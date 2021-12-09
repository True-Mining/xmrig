read -p "First run? (install necessary packages) [y/n] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	pacman -S mingw-w64-x86_64-gcc git make cmake gcc
fi

rm -rf CMakeCache.txt
rm -rf CMakeFiles
rm -rf build-gcc-win64

mkdir build-gcc-win64
cd build-gcc-win64

mingw-w64-x86_64-cmake .. -G "Unix Makefiles" -DXMRIG_DEPS=c:/xmrig-deps/gcc/x64 -DWITH_AEON=OFF -DWITH_CN_LITE=OFF -DWITH_CN_HEAVY=OFF -DWITH_CN_PICO=OFF -DWITH_CN_FEMTO=OFF -DWITH_ARGON2=OFF -DWITH_ASTROBWT=OFF -DWITH_KAWPOW=ON
mingw-w64-x86_64-cmake --build . --config Release
make -j$(nproc)

echo finish.
read