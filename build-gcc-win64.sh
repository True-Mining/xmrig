read -p "First run? (install necessary packages) [y/n] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	pacman -S mingw-w64-x86_64-gcc git make cmake gcc mingw-w64-x86_64-cmake
fi

rm -rf CMakeCache.txt
rm -rf CMakeFiles
rm -rf build-gcc-win64

mkdir build-gcc-win64
cd build-gcc-win64

cmake .. -G "Unix Makefiles" -DXMRIG_DEPS=c:/xmrig-deps/gcc/x64
cmake --build . --config Release
make -j$(nproc)

echo finish.
read