cd /d C:\git\SE-Build-crosslib_win32_v3\zlib\src\build\vc2017\x64_Debug

set CYGWIN=nodosfilewarning
set PATH=C:\Perl\bin;C:\ADMIN\nasm-2.11.08;%PATH%

call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvars64.bat"

perl -i.bak -p -e "s/-MD/-MTd/g" win32\Makefile.msc
perl -i.bak -p -e "s/-O2/-Od/g" win32\Makefile.msc
perl -i.bak -p -e "s/-Zi/-Z7/g" win32\Makefile.msc


nmake /f win32\Makefile.msc clean
nmake /f win32\Makefile.msc



mkdir C:\git\SE-Build-crosslib_win32_v3\zlib\output\Library\vc2017\x64_Debug

copy zlib.lib C:\git\SE-Build-crosslib_win32_v3\zlib\output\Library\vc2017\x64_Debug\ /y


