#include <cstddef>
#include <gtest/gtest.h>
#include <ostream>
#include <string>
#include <string_view>

#include "common.h"
#include "../parser.h"

TEST(TestParser, bracketsParser) {
    IsotopParser::BraketsTree result;
    ASSERT_NO_THROW(result = IsotopParser::ParseBrackets("[(CH3)4N]2CO3"));
    ASSERT_EQ(result.Index, 1);
    ASSERT_EQ(result.Formula, "CO3");

    ASSERT_EQ(result.SubTrees.size(), 1);
    ASSERT_EQ(result.SubTrees.front().Formula, "N");
    ASSERT_EQ(result.SubTrees.front().Index, 2);

    ASSERT_EQ(result.SubTrees.back().SubTrees.size(), 1);
    ASSERT_EQ(result.SubTrees.back().SubTrees.back().Formula, "CH3");
    ASSERT_EQ(result.SubTrees.back().SubTrees.back().Index, 4);

    ASSERT_NO_THROW(result = IsotopParser::ParseBrackets("[[(CH3)4N]20{CO3}10]15"));
    ASSERT_EQ(result.Index, 1);
    ASSERT_EQ(result.Formula, "");

    ASSERT_EQ(result.SubTrees.size(), 1);
    ASSERT_EQ(result.SubTrees.front().Formula, "");
    ASSERT_EQ(result.SubTrees.front().Index, 15);

    ASSERT_EQ(result.SubTrees.front().SubTrees.size(), 2);
    ASSERT_EQ(result.SubTrees.front().SubTrees.front().Index, 20);
    ASSERT_EQ(result.SubTrees.front().SubTrees.front().Formula, "N");
    ASSERT_EQ(result.SubTrees.front().SubTrees.back().Index, 10);
    ASSERT_EQ(result.SubTrees.front().SubTrees.back().Formula, "CO3");

    ASSERT_TRUE(result.SubTrees.front().SubTrees.back().SubTrees.empty());
    ASSERT_EQ(result.SubTrees.front().SubTrees.front().SubTrees.size(), 1);
    ASSERT_EQ(result.SubTrees.front().SubTrees.front().SubTrees.front().Formula, "CH3");
    ASSERT_EQ(result.SubTrees.front().SubTrees.front().SubTrees.front().Index, 4);
}

TEST(TestParser, simpleFormula) {

    std::map<std::string, size_t> formula;
    auto lexx = [&](const std::string& elem, size_t idx) {
        auto it = formula.emplace(elem, 0).first;
        it->second += idx;
        return std::string_view(it->first);
    };

    IsotopParser::ParseSimpleFormula("C2H5OH", lexx);
    ASSERT_EQ(
        formula,
        (std::map<std::string, size_t>{
            {"C", 2},
            {"H", 6},
            {"O", 1},
        })
    );
    formula.clear();

    IsotopParser::ParseSimpleFormula("CO3Na2", lexx);
    ASSERT_EQ(
        formula,
        (std::map<std::string, size_t>{
            {"C", 1},
            {"Na", 2},
            {"O", 3},
        })
    );
    formula.clear();

    IsotopParser::ParseSimpleFormula("CO3Na2", lexx);
    auto formula_other = std::move(formula);
    IsotopParser::ParseSimpleFormula("O3CNa2", lexx);
    ASSERT_EQ(formula, formula_other);
    formula.clear();

    IsotopParser::ParseSimpleFormula("Na2CO3", lexx);
    formula_other = std::move(formula);
    IsotopParser::ParseSimpleFormula("O3CNa2", lexx);
    ASSERT_EQ(formula, formula_other);
    formula.clear();

    IsotopParser::ParseSimpleFormula("O3CNa2", lexx);
    formula_other = std::move(formula);
    IsotopParser::ParseSimpleFormula("Na2O3C", lexx);
    ASSERT_EQ(formula, formula_other);
    formula.clear();

    IsotopParser::ParseSimpleFormula("W1234Ni56O45635365N2OHWHWHWC10", lexx);
    ASSERT_EQ(
        formula,
        (std::map<std::string, size_t>{
                {"C", 10},
                {"H", 3},
                {"N", 2},
                {"Ni", 56},
                {"O", 45635366},
                {"W", 1237}
        })
    );
}

TEST(TestParser, simpleFormulaErrors) {
    auto dummyLexx = [&](const std::string&, size_t) -> std::string_view { return std::string_view(); };
    ASSERT_THROW(IsotopParser::ParseSimpleFormula("G%$& 032032", dummyLexx), IsotopParser::ParseError);
    ASSERT_THROW(IsotopParser::ParseBrackets("((]))"), IsotopParser::ParseError);
    ASSERT_NO_THROW(IsotopParser::ParseSimpleFormula("", dummyLexx));
    ASSERT_NO_THROW(IsotopParser::ParseBrackets(""));
    ASSERT_THROW(IsotopParser::ParseBrackets(")"), IsotopParser::ParseError);
    ASSERT_THROW(IsotopParser::ParseBrackets("("), IsotopParser::ParseError);
}

TEST(TestParser, fuzzingErrors) {
    auto dummyLexx = [&](const std::string&, size_t) -> std::string_view { return std::string_view(); };
    constexpr size_t NTESTS = 100;
    constexpr size_t MAX_LENGTH = 100;
    size_t counter = 0;

    auto testException = [dummyLexx, &counter](const std::string& formula) {
        std::cout << counter << "===========================================" << std::endl;
        counter++;
        std::cout << "Формула для тестов: '" << formula << "'" << std::endl;
        std::cout << "Размер формулы: " << formula.size() << std::endl;
        IsotopParser::ParseSimpleFormula(formula, dummyLexx);
        std::cout << "Скобки" << std::endl;
        IsotopParser::ParseBrackets(formula);
        std::cout << "Исключение" << std::endl;
        throw IsotopParser::ParseError("dummy");
    };

    for (size_t i = 0; i < NTESTS; ++i) {
        auto mayBeFormula = ::Test::GenerateRandomString(
            ::Test::GenerateRandomUInt(MAX_LENGTH));
        ASSERT_THROW(testException(mayBeFormula), IsotopParser::ParseError);
    }
}

TEST(TestParser, formulaWithBrackets) {
    std::map<std::string, size_t> formula;
    auto lexx = [&](const std::string& elem, size_t idx) {
        auto it = formula.emplace(elem, 0).first;
        it->second += idx;
    };

    ASSERT_NO_THROW(IsotopParser::ParseFormulaWithBrackets("[(CH3)4N]2CO3", lexx));

    ASSERT_EQ(
        formula,
        (std::map<std::string, size_t>{
            {"C", 9},
            {"H", 24},
            {"N", 2},
            {"O", 3},
        })
    );
    formula.clear();

    ASSERT_NO_THROW(IsotopParser::ParseFormulaWithBrackets("[(CH3)4N]3PO4(H2O)10", lexx));
    ASSERT_EQ(
        formula,
        (std::map<std::string, size_t>{
            {"C", 12},
            {"H", 56},
            {"N", 3},
            {"O", 14},
            {"P", 1},
        })
    );
}
