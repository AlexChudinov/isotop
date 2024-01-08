#include "../distribution.h"
#include <cmath>
#include <gtest/gtest.h>
#include <unordered_map>

TEST(TestDistrib, test) {
    IsotopParser::Distribution distribution1{
        .Distribution = {
            {10, 0.1},
            {11, 0.3},
            {12, 0.6},
        },
    };

    auto result = IsotopParser::Multiply(distribution1, distribution1);

    std::unordered_map<double, double>  expected {
        {20, 0.01},
        {21, 0.06},
        {22, 0.21},
        {23, 0.36},
        {24, 0.36},
    };

    for (const auto& [m, i] : result.Distribution) {
        ASSERT_FLOAT_EQ(i, expected.at(std::round(m)));
    }
}
