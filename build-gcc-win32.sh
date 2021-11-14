read -p "First run? (install necessary packages) [y/n] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	pacman -S mingw-w64-x86_64-gcc git make cmake gcc
fi

rm -rf CMakeCache.txt
rm -rf CMakeFiles
rm -rf build-gcc-win32

mkdir build-gcc-win32
cd build-gcc-win32

cmake .. -G "Unix Makefiles" -DXMRIG_DEPS=c:/xmrig-deps/gcc/x86        -DWITH_AEON=OFF -DWITH_CN_LITE=OFF -DWITH_CN_HEAVY=OFF -DWITH_CN_PICO=OFF -DWITH_CN_FEMTO=OFF -DWITH_ARGON2=OFF -DWITH_ASTROBWT=OFF -DWITH_KAWPOW=OFF
cmake --build . --config Release
make -j$(nproc)

echo finish.
read