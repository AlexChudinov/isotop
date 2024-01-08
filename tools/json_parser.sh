set -e

mkdir -p /usr/include/nlohmann
wget https://raw.githubusercontent.com/nlohmann/json/develop/single_include/nlohmann/json.hpp -O /usr/include/nlohmann/json.hpp
wget https://raw.githubusercontent.com/nlohmann/json/develop/single_include/nlohmann/json_fwd.hpp -O /usr/include/nlohmann/json_fwd.hpp
wget https://raw.githubusercontent.com/nlohmann/json/develop/LICENSE.MIT -O /usr/include/nlohmann/LICENSE.MIT
