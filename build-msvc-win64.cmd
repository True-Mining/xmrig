@echo off

del /F /S /Q CMakeCache.txt
del /F /S /Q CMakeFiles
del /F /S /Q build-msvc-win64

mkdir build-msvc-win64
cd build-msvc-win64
cmake .. -G "Visual Studio 16 2019" -A x64 -DXMRIG_DEPS=c:\xmrig-deps\msvc2019\x64 -DWITH_AEON=OFF -DWITH_CN_LITE=OFF -DWITH_CN_HEAVY=OFF -DWITH_CN_PICO=OFF -DWITH_CN_FEMTO=OFF -DWITH_ARGON2=OFF -DWITH_ASTROBWT=OFF -DWITH_KAWPOW=ON
cmake --build . --config Release

echo.
echo finish.
pause > null