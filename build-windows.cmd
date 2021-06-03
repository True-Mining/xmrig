@echo off

mkdir build && cd build

start "" "c:\msys64\msys2.exe" pacman -S mingw-w64-x86_64-gcc git make"
echo Complete tasks and press any key here
pause >nul
start "" "c:\Program Files\CMake\bin\cmake.exe" . -G "Unix Makefiles" -DXMRIG_DEPS=c:/xmrig-deps/gcc/x64"
echo Complete tasks and press any key here
pause >nul
start "" "c:\msys64\msys2.exe" make -j$(nproc)"
echo Complete tasks and press any key here
pause >nul

cd build
cmake . -G "Visual Studio 16 2019" -A x64 -DXMRIG_DEPS=c:\xmrig-deps\msvc2019\x64
cmake --build . --config Release


echo.
echo end
pause