cd /d C:\git\SE-Build-crosslib_win32_v3\zlib\src\build\vc2017\Win32_Release

set CYGWIN=nodosfilewarning
set PATH=C:\Perl\bin;C:\ADMIN\nasm-2.11.08;%PATH%

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvars32.bat"

perl -i.bak -p -e "s/-MD/-MT/g" win32\Makefile.msc
perl -i.bak -p -e "s/-debug//g" win32\Makefile.msc
perl -i.bak -p -e "s/-Zi/-Z7/g" win32\Makefile.msc


nmake /f win32\Makefile.msc clean
nmake /f win32\Makefile.msc



mkdir C:\git\SE-Build-crosslib_win32_v3\zlib\output\Library\vc2017\Win32_Release

copy zlib.lib C:\git\SE-Build-crosslib_win32_v3\zlib\output\Library\vc2017\Win32_Release\ /y

mkdir C:\git\SE-Build-crosslib_win32_v3\zlib\output\Include\vc2017\

copy C:\git\SE-Build-crosslib_win32_v3\zlib\src\build\vc2017\Win32_Release\zconf.h C:\git\SE-Build-crosslib_win32_v3\zlib\output\Include\vc2017\ /y

copy C:\git\SE-Build-crosslib_win32_v3\zlib\src\build\vc2017\Win32_Release\zlib.h C:\git\SE-Build-crosslib_win32_v3\zlib\output\Include\vc2017\ /y


