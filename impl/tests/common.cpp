#include <algorithm>
#include <cstddef>
#include <mutex>
#include <random>
#include <string_view>

#include "common.h"

namespace Test {

    namespace {
        constexpr std::string_view CHARSET = "abcdefghijklmnopqrstuvwxyz"
                                        "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "0123456789([{}])";
    }

    std::string GenerateRandomString(int length) {
        static std::mutex mtx;
        std::lock_guard<std::mutex> lock(mtx);
        std::string result(length, '\0');

        for (char& c : result) {
            c = CHARSET[GenerateRandomUInt(CHARSET.size() - 1)];
        }

        return result;
    }

    size_t GenerateRandomUInt(size_t maxInteger) {
        static std::mutex mtx;
        std::lock_guard<std::mutex> lock(mtx);
        static std::random_device rd;
        static std::mt19937_64 generator(rd());
        return std::uniform_int_distribution<size_t>(0, maxInteger)(generator);
    }
}
