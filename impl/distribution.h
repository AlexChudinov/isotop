#ifndef __DISTRIB_H__
#define __DISTRIB_H__

#include <unordered_map>

#include "mysql.h"

namespace IsotopParser {
    struct Distribution {
        std::unordered_map<double, double> Distribution;
        MySQL::IsotopDistribAccuracy Accuracy {
            .Mass = 1e-5,
            .Abundance = 1e-2,
        };
    };

    Distribution Normalize(const Distribution& d);

    Distribution Multiply(const Distribution& l, const Distribution& r);
}

#endif