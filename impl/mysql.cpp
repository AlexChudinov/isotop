#include "mysql.h"

#include <filesystem>
#include <fstream>
#include <nlohmann/json.hpp>
#include <mysql/mysql.h>
#include <sstream>
#include <stdexcept>
#include <string>
#include <string_view>
#include <vector>

namespace IsotopParser {
    void MySQL::Result::AddRow(const MySQLResult& row) {

        if (!Names.count(row.Name) || !Tables.count(row.TableID)) {
            Names.emplace(row.Name, IsotopDistribs.size());
            Tables.emplace(row.TableID, IsotopDistribs.size());

            if (!Accuracies.contains(row.TableID)) {

                Accuracies.emplace(
                    row.TableID,
                    IsotopDistribAccuracy{
                        .Mass = row.MassAcc,
                        .Abundance = row.AbundanceAcc,
                    }
                );

            }

            IsotopDistribs.emplace_back(IsotopDistrib{});
        }

        IsotopDistribs.back().Abundances.emplace_back(row.Abundance);
        IsotopDistribs.back().Masses.emplace_back(row.Mass);
    }

    MySQL::MySQL() {
        if (mySQL = mysql_init(nullptr); !mySQL) {
            throw std::runtime_error("failed to initialize mysql");
        }
    }

    MySQL::~MySQL() {
        mysql_close(mySQL);
    }

    void MySQL::Connect(const User& user) {
        mysql_real_connect(
            mySQL,
            user.Host.c_str(),
            user.User.c_str(),
            user.PassWord.c_str(),
            user.DataBase.c_str(),
            0,
            nullptr,
            0);
        auto  error = mysql_error(mySQL);
        if (*error) {
            throw std::runtime_error("failed to connect to MySQL database: " + std::string(error));
        }
    }

    MySQL::Result MySQL::GetIsotops(const std::vector<std::string_view>& compounds) {
        std::ostringstream os;

        for (auto it = compounds.begin(); it != std::prev(compounds.end()); ++it) {
            os << "\"" << *it << "\",";
        }
        os << "\"" << compounds.back() << "\"";

        std::string query =
            "SELECT "
                "name,"
                "isotop_id,"
                "mass,"
                "abundance,"
                "mass_accuracy,"
                "abundance_accurace,"
                "table_id "
            "FROM distribution JOIN isotop_tables ON(table_id=id) "
            "WHERE name IN (" + os.str() + ") "
            "ORDER BY table_id, name, isotop_id";
        if (mysql_query(mySQL, query.c_str())) {
            throw std::runtime_error(
                "failed to fetch compounds: " + std::string(mysql_error(mySQL)) + " with query '" + query + "'");
        }

        MYSQL_RES* result = mysql_use_result(mySQL);
        if (mysql_field_count(mySQL) == 0) {
            throw std::runtime_error("query does'not return data");
        }

        Result isotopResult;
        while (MYSQL_ROW row = mysql_fetch_row(result)) {
            isotopResult.AddRow(ParseRow(row));
        }

        return isotopResult;
    }

    MySQL::User MySQL::ReadJsonFile(const std::string& fileName) {
        if (!std::filesystem::is_regular_file(fileName)) {
            throw std::runtime_error(
                "can not find file '" + fileName + "'" + " for CWD '" + std::filesystem::current_path().string() + "'"
            );
        }
        std::ifstream in(fileName);

        auto obj = nlohmann::json::parse(in);
        return User {
            .User = obj.at("user"),
            .Host = obj.at("host"),
            .DataBase = obj.at("database"),
            .PassWord = obj.at("password"),
        };
    }

    MySQL::MySQLResult MySQL::ParseRow(char** const row) {
        return MySQLResult {
            .Name = row[NAME],
            .IsotopID = std::stoi(row[ISOTOP_ID]),
            .Mass = std::stod(row[MASS]),
            .MassAcc = std::stod(row[MASS_ACC]),
            .Abundance = std::stod(row[ABUNDANCE]),
            .AbundanceAcc = std::stod(row[ABUNDANCE_ACC]),
            .TableID = std::stoi(row[TABLE_ID]),
        };
    }
}
