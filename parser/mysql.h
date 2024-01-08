#ifndef _MYSQL_H_
#define _MYSQL_H_

#include <list>
#include <map>
#include <string>
#include <vector>

struct MYSQL;

namespace IsotopParser {
    class MySQL {
    private:
        enum COLUMNS : size_t {
            NAME,
            ISOTOP_ID,
            MASS,
            ABUNDANCE,
            MASS_ACC,
            ABUNDANCE_ACC,
            TABLE_ID,

            COLUMNS_COUNT,
        };

        struct MySQLResult {
            std::string Name;
            int IsotopID = -1;
            double Mass = -0.1;
            double MassAcc = -0.1;
            double Abundance = -0.1;
            double AbundanceAcc = -0.1;
            int TableID = -1;
        };

    public:
        struct User {
            std::string User;
            std::string Host;
            std::string DataBase;
            std::string PassWord;
        };

        struct IsotopDistrib {
            std::vector<double> Masses;
            std::vector<double> Abundances;
        };

        struct IsotopDistribAccuracy {
            double Mass = -0.1;
            double Abundance = -0.1;
        };

        struct Result {
            std::vector<IsotopDistrib> IsotopDistribs;
            std::map<size_t, IsotopDistribAccuracy> Accuracies;
            std::multimap<std::string, size_t> Names;
            std::multimap<size_t, size_t> Tables;

            void AddRow(const MySQLResult& result);
        };
    public:
        MySQL();
        ~MySQL();

        void Connect(const User& user);
        Result GetIsotops(const std::vector<std::string_view>& compounds);

        static User ReadJsonFile(const std::string& fileName);

    private:
        static MySQLResult ParseRow(char** const row);

    private:
        MYSQL* mySQL;
    };
}

#endif //_MYSQL_H_
