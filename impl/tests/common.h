#ifndef _TEST_COMMON_
#define _TEST_COMMON_

#include <string>

namespace Test {
    std::string GenerateRandomString(int length);
    size_t GenerateRandomUInt(size_t maxInteger);
}

#endif
