#include <gtest/gtest.h>
#include <map>
#include <memory>
#include "../mysql.h"

class TestDatabase : public ::testing::Test {
public:
    std::unique_ptr<IsotopParser::MySQL> mySQL;

private:
    void SetUp() {
        ASSERT_NO_THROW(mySQL = std::make_unique<IsotopParser::MySQL>());
        IsotopParser::MySQL::User user;
        ASSERT_NO_THROW(user = IsotopParser::MySQL::ReadJsonFile("./data/isotop_user.json"));
        ASSERT_NO_THROW(mySQL->Connect(user));
    }
};

TEST_F(TestDatabase, readIsotops){
    IsotopParser::MySQL::Result result;
    ASSERT_NO_THROW(result = mySQL->GetIsotops({"He", "Ne", "C"}));

    ASSERT_EQ(result.Names, (std::multimap<std::string, size_t>{{"C", 0}, {"He", 1}, {"Ne", 2}}));
    ASSERT_EQ(result.Tables, (std::multimap<size_t, size_t>{{1, 0}, {1, 1}, {1, 2}}));

    ASSERT_EQ(result.Accuracies.size(), 1);
    ASSERT_TRUE(result.Accuracies.contains(1));
    ASSERT_EQ(result.Accuracies.at(1).Mass, 1e-07);
    ASSERT_EQ(result.Accuracies.at(1).Abundance, 1e-5);

    ASSERT_EQ(result.IsotopDistribs.size(), 3);

    ASSERT_EQ(result.IsotopDistribs[0].Masses[0], 12.0);
    ASSERT_EQ(result.IsotopDistribs[0].Masses[1], 13.003355);
    ASSERT_EQ(result.IsotopDistribs[0].Masses.size(), 2);
    ASSERT_EQ(result.IsotopDistribs[0].Abundances[0], 98.9);
    ASSERT_EQ(result.IsotopDistribs[0].Abundances[1], 1.1);
    ASSERT_EQ(result.IsotopDistribs[0].Abundances.size(), 2);

    ASSERT_EQ(result.IsotopDistribs[1].Masses[0], 3.01603);
    ASSERT_EQ(result.IsotopDistribs[1].Masses[1], 4.0026);
    ASSERT_EQ(result.IsotopDistribs[1].Masses.size(), 2);
    ASSERT_EQ(result.IsotopDistribs[1].Abundances[0], 0.00014);
    ASSERT_EQ(result.IsotopDistribs[1].Abundances[1], 99.99986);
    ASSERT_EQ(result.IsotopDistribs[1].Abundances.size(), 2);

    ASSERT_EQ(result.IsotopDistribs[2].Masses[0], 19.992435);
    ASSERT_EQ(result.IsotopDistribs[2].Masses[1], 20.993843);
    ASSERT_EQ(result.IsotopDistribs[2].Masses[2], 21.991383);
    ASSERT_EQ(result.IsotopDistribs[2].Masses.size(), 3);
    ASSERT_EQ(result.IsotopDistribs[2].Abundances[0], 90.51);
    ASSERT_EQ(result.IsotopDistribs[2].Abundances[1], 0.27);
    ASSERT_EQ(result.IsotopDistribs[2].Abundances[2], 9.22);
    ASSERT_EQ(result.IsotopDistribs[2].Abundances.size(), 3);
}
