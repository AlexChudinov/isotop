#ifndef _PARSER_H_
#define _PARSER_H_

#include <functional>
#include <list>
#include <stdexcept>
#include <string>


namespace IsotopParser {
    using ElementLexer = std::function<void(const std::string&, size_t)>;

    class ParseError : public std::runtime_error {
    public:
        template<class It>
        ParseError(const std::string& err, It cur, It last)
        : std::runtime_error(err + ": " + "<< " + *cur + " >>" + std::string(std::next(cur), last))
        {}

        ParseError(const std::string& err)
        : std::runtime_error(err)
        {}
    };

    void ParseSimpleFormula(const std::string& formula, const ElementLexer& lexx);

    struct BraketsTree {
        std::list<BraketsTree> SubTrees;
        size_t Index = 1;
        std::string Formula;
    };

    BraketsTree ParseBrackets(const std::string& formula);

    void ParseFormulaWithBrackets(const std::string& formula, const ElementLexer& lexx);
}


#endif //_PARSER_H_
