cd /d C:\git\SE-Build-crosslib_win32_v3\OpenSSL\src\build\vc2005\Win32_Debug

set CYGWIN=nodosfilewarning
set PATH=C:\Strawberry\perl\bin;C:\ADMIN\nasm-2.11.08;%PATH%

call "C:\Program Files (x86)\Microsoft Visual Studio 8\VC\vcvarsall.bat" x86

REM -- force enable threads --
perl -i.bak -p -e "s/unless\(\$disabled\{threads\}\) \{/if \(1\) \{/g" ./Configure

perl Configure --debug VC-WIN32 -D_WIN32_WINNT=0x0501 -static threads no-engine no-shared enable-weak-ssl-ciphers enable-ssl3 enable-ssl3-method no-async no-tests

perl -i.bak -p -e "s/_WIN32_WINNT \>\= 0x0600/_WIN32_WINNT \>\= 0xFFFF/g" providers\implementations\rands\seeding\rand_win.c
perl -i.bak -p -e "s/_WIN32_WINNT \>\= 0x600/_WIN32_WINNT \>\= 0xFFFF/g" crypto\threads_win.c

perl -i.bak -p -e "s/\/MT/\/MTd/g" makefile
perl -i.bak -p -e "s/\/MDd/\/MTd/g" makefile
perl -i.bak -p -e "s/\/MD/\/MTd/g" makefile
perl -i.bak -p -e "s/\/Zl/\/Z7/g" makefile
perl -i.bak -p -e "s/\/Zi/\/Z7/g" makefile
perl -i.bak -p -e "s/\/WX/\/W3/g" makefile

perl -i.bak -p -e "s/\/MT/\/MTd/g" configdata.pm
perl -i.bak -p -e "s/\/MDd/\/MTd/g" configdata.pm
perl -i.bak -p -e "s/\/MD/\/MTd/g" configdata.pm
perl -i.bak -p -e "s/\/Zl/\/Z7/g" configdata.pm
perl -i.bak -p -e "s/\/Zi/\/Z7/g" configdata.pm
perl -i.bak -p -e "s/\/WX/\/W3/g" configdata.pm

echo #ifndef HEADER_DSO_CONF_H> crypto\include\internal\dso_conf.h
echo #define HEADER_DSO_CONF_H>> crypto\include\internal\dso_conf.h
echo #define DSO_NONE>> crypto\include\internal\dso_conf.h
echo #endif>> crypto\include\internal\dso_conf.h

copy /y crypto\include\internal\dso_conf.h crypto\include\internal\dso_conf.h.in


rem --- Win32 VC2005 lacks of InterlockedOr64 ---

perl -i.bak -p -e "s/\*ret = \(uint64_t\)InterlockedOr64\(\(LONG64 volatile \*\)val\, \(LONG64\)op\) \| op\;/\*val \|\= op\;\*ret  \= \*val\;/g" crypto\threads_win.c
perl -i.bak -p -e "s/\*ret \= \(uint64_t\)InterlockedOr64\(\(LONG64 volatile \*\)val, 0\)\;/\*ret  \= \*val\;/g" crypto\threads_win.c


nmake /f makefile clean
nmake /f makefile
nmake /f makefile

mkdir C:\git\SE-Build-crosslib_win32_v3\OpenSSL\output\Library\vc2005\Win32_Debug

copy libcrypto.lib C:\git\SE-Build-crosslib_win32_v3\OpenSSL\output\Library\vc2005\Win32_Debug\libeay32.lib /y
copy libssl.lib C:\git\SE-Build-crosslib_win32_v3\OpenSSL\output\Library\vc2005\Win32_Debug\ssleay32.lib /y


