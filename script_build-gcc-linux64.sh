read -p "First run? (install necessary packages) [y/n] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	install git build-essential cmake automake libtool autoconf libuv1-dev libssl-dev libhwloc-dev
fi

rm -rf CMakeCache.txt
rm -rf CMakeFiles
rm -rf build-gcc-linux64

mkdir build-gcc-linux64
cd build-gcc-linux64

./build_deps.sh && cd ../build-gcc-linux64
cmake .. -DXMRIG_DEPS=scripts/deps
make -j$(nproc)

echo finish.
read