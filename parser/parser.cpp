#include "parser.h"

#include <algorithm>
#include <cctype>
#include <functional>
#include <regex>
#include <stack>
#include <string>
#include <unordered_map>
#include <unordered_set>

namespace IsotopParser {
    static const std::string PARSE_DESCRIPTION =
        "Element-token of a simple chemical formula should be able to be matched with regexp: '[A-Z][a-z]*\\d*'";
    static const std::regex ELEMENT_REGEX("[A-Z][a-z]*\\d*");

    namespace  {
         template <class It> size_t ParseIdx(It begin, It end) {
            size_t result = 0;

            for (; begin != end; ++begin) {
                if (*begin < '0' || *begin > '9') {
                    throw ParseError("Prohibited symbol in index: ", begin, end);
                }
                result *= 10;
                result += *begin - '0';
            }

            return result ? result : 1;
        }

        template<class It> void ParseElem(It begin, It end, const ElementLexer& lexx) {
            It elemEnd = std::find_if(
                    std::next(begin),
                    end,
                    [](char c) {
                        return std::isdigit(c);
                    }
                );

            lexx(std::string(begin, elemEnd), ParseIdx(elemEnd, end));
        }
    }

    void ParseSimpleFormula(const std::string& formula, const ElementLexer& lexx) {
        if (formula.empty()) {
            return;
        }

        auto itUnexpectedSymbol = std::find_if(
            formula.begin(),
            formula.end(),
            [](char c){
                return !std::isdigit(c) && !std::isupper(c) && !std::islower(c);
            });
        if (itUnexpectedSymbol != formula.end()) {
            throw ParseError("Unexpected symbol:", itUnexpectedSymbol, formula.end());
        }

        auto it = std::sregex_iterator(formula.begin(), formula.end(), ELEMENT_REGEX);
        auto end = std::sregex_iterator();

        size_t parsedSz = 0;
        std::string elem;
        for (; it != end; ++it) {
            elem = std::move(it->str());
            ParseElem(elem.begin(), elem.end(), lexx);
            parsedSz += elem.size();
        }

        if (parsedSz != formula.size()) {
            throw ParseError(
                "Parsed " + std::to_string(parsedSz) + " symbols from " + std::to_string(formula.size()) + ": some elements can not be parsed");
        }
    }

    namespace {
        std::unordered_set<char> LBRACKETS {'(', '{', '['};
        std::unordered_map<char, char> RBRACKET_MATCH {
            {')', '('},
            {']', '['},
            {'}', '{'},
        };

        template<class It>
        BraketsTree ParseBrackets(It first, It last) {
            std::stack<It> lbrackets;
            std::stack<BraketsTree> trees;
            trees.push(
                BraketsTree {
                    .Index = 1,
                }
            );

            while (first != last) {
                if (LBRACKETS.contains(*first)) {
                    if (std::next(first) == last) {
                        throw ParseError("Unmatched bracket", first, last);
                    }

                    trees.push(
                        BraketsTree{
                            .Index = 1,
                        }
                    );
                    lbrackets.push(first);
                } else if (RBRACKET_MATCH.contains(*first)) {
                    if (lbrackets.empty() || *lbrackets.top() != RBRACKET_MATCH.at(*first)) {
                        throw ParseError("Unmatched bracket", first, last);
                    }

                    BraketsTree topTree = trees.top();
                    trees.pop();
                    if (std::next(first) != last && std::isdigit(*std::next(first))) {
                        first++;
                        auto endIdx = std::find_if(first, last, [](char c) { return !std::isdigit(c); });
                        topTree.Index = ParseIdx(first, endIdx);
                        first = std::prev(endIdx);
                    }

                    trees.top().SubTrees.push_back(topTree);
                    lbrackets.pop();
                } else {
                    trees.top().Formula.push_back(*first);
                }

                first++;
            }

            return trees.top();
        }
    }

    BraketsTree ParseBrackets(const std::string& formula) {
        return ParseBrackets(formula.begin(), formula.end());
    }

    void ParseFormulaWithBrackets(const std::string &formula, const ElementLexer &lexx) {
        BraketsTree bt = ParseBrackets(formula);
        std::stack<std::reference_wrapper<const BraketsTree>> btStack;
        std::stack<size_t> multipliers;

        btStack.push(bt);
        multipliers.push(bt.Index);
        while (!btStack.empty()) {
            auto top = btStack.top();
            size_t mult = multipliers.top();

            auto localLexer = [mult, lexx](
                const std::string& elem,
                size_t idx) {
                lexx(elem, idx * mult);
            };

            ParseSimpleFormula(top.get().Formula, localLexer);
            btStack.pop();
            multipliers.pop();

            for (const auto& bt : top.get().SubTrees) {
                btStack.push(bt);
                multipliers.push(mult * bt.Index);
            }
        }
    }
}
