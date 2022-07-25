if "%1" == "" goto error

mkdir S:\CommomDev\crosslib\%1

xcopy /e /i /f /g /h /r /y C:\git\SE-Build-crosslib_win32_v3\OpenSSL\output\* S:\CommomDev\crosslib\%1\OpenSSL\*

echo %1> S:\CommomDev\crosslib\%1\OpenSSL\Library\vc2005\OpenSSL_Build_ID.txt
echo %1> S:\CommomDev\crosslib\%1\OpenSSL\Library\vc2008\OpenSSL_Build_ID.txt
echo %1> S:\CommomDev\crosslib\%1\OpenSSL\Library\vc2017\OpenSSL_Build_ID.txt
echo %1> S:\CommomDev\crosslib\%1\OpenSSL\Library\vc2019\OpenSSL_Build_ID.txt

xcopy /e /i /f /g /h /r /y C:\git\SE-Build-crosslib_win32_v3\zlib\output\* S:\CommomDev\crosslib\%1\zlib\*

echo %1> S:\CommomDev\crosslib\%1\zlib\Library\vc2005\zlib_Build_ID.txt
echo %1> S:\CommomDev\crosslib\%1\zlib\Library\vc2008\zlib_Build_ID.txt
echo %1> S:\CommomDev\crosslib\%1\zlib\Library\vc2017\zlib_Build_ID.txt
echo %1> S:\CommomDev\crosslib\%1\zlib\Library\vc2019\zlib_Build_ID.txt

xcopy /e /i /f /g /h /r /y C:\git\SE-Build-crosslib_win32_v3\intel-aesni\output\* S:\CommomDev\crosslib\%1\intel-aesni\*

echo %1> S:\CommomDev\crosslib\%1\intel-aesni\Library\vc2005\intel-aesni_Build_ID.txt
echo %1> S:\CommomDev\crosslib\%1\intel-aesni\Library\vc2008\intel-aesni_Build_ID.txt
echo %1> S:\CommomDev\crosslib\%1\intel-aesni\Library\vc2017\intel-aesni_Build_ID.txt
echo %1> S:\CommomDev\crosslib\%1\intel-aesni\Library\vc2019\intel-aesni_Build_ID.txt

copy /y  C:\git\SE-Build-crosslib_win32_v3\README.md S:\CommomDev\crosslib\%1\Versions.txt

goto end

:error

Usage: copy_release <BUILD_ID>

:end

