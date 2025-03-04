#include "distribution.h"

#include <cmath>
#include <cstddef>
#include <unordered_map>

namespace IsotopParser {
    Distribution Normalize(const Distribution &d) {
        std::unordered_map<double, double> result(d.Distribution);
        double sum = 0.0;
        for (const auto& [_, i] : result) {
            sum += i;
        }

        auto it = result.begin();
        while (it != result.end()) {
            size_t intensity = std::round(it->second / sum / d.Accuracy.Abundance);
            if (intensity == 0) {
                it = result.erase(it);
                continue;
            }
            it->second = intensity * d.Accuracy.Abundance;
            ++it;
        }

        return Distribution {
            .Distribution = result,
            .Accuracy = d.Accuracy,
        };
    }

    Distribution Multiply(const Distribution &l, const Distribution &r) {
        Distribution result {
            .Accuracy = {
                .Mass = std::max(l.Accuracy.Mass, r.Accuracy.Mass),
                .Abundance = std::max(l.Accuracy.Abundance, r.Accuracy.Abundance),
            }
        };

        std::unordered_map<size_t, size_t> distrAccumulator;
        for (const auto& [ml,il] : l.Distribution) {
            for (const auto& [mr, ir] : r.Distribution) {
                size_t massIdx = static_cast<size_t>(std::round((ml + mr) / result.Accuracy.Mass));
                distrAccumulator[massIdx] += static_cast<size_t>(std::round((il * ir) / result.Accuracy.Abundance));
            }
        }

        for (const auto& [mi, ii] : distrAccumulator) {
            if (ii != 0) {
                result.Distribution[mi * result.Accuracy.Mass] = ii * result.Accuracy.Abundance;
            }
        }

        return Normalize(result);
    }

}
