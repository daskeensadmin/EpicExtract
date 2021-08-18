echo %date% %time%
IF EXIST "C:\EPIC Extracts\TANOAK-ReportExtract.zip" DEL /F "C:\EPIC Extracts\TANOAK-ReportExtract.zip"
"C:\Program Files (x86)\WinSCP\WinSCP.exe" ^
  /log="C:\EPIC Extracts\WinSCP.log" /ini=nul ^
  /command ^
    "open ftps://ftp-tanoak:$Ev9T8uTM7@fE$wf@ftp.epicloansystems.com:995/ -certificate=""42:24:8b:3a:4b:39:5f:50:a1:95:e8:c6:04:c8:c5:7b:5c:87:fb:2d"" -rawsettings ProxyPort=0" ^
    "get ""/TANOAK_ReportExtract.zip"" ""C:\EPIC Extracts\TANOAK-ReportExtract.zip""" ^
    "exit"

set WINSCP_RESULT=%ERRORLEVEL%
if %WINSCP_RESULT% equ 0 (
  echo Success
  echo %date% %time%
) else (
  echo Error
  exit
)

echo %date% %time%
IF EXIST "C:\EPIC Extracts\TANOAK\*" DEL /F /Q "C:\EPIC Extracts\TANOAK\*"
"C:\Program Files\7-Zip\7z.exe" x  "C:\EPIC Extracts\TANOAK-ReportExtract.zip"  -o"C:\EPIC Extracts\TanOak" -y -r
set DD=%DATE:~7,2%
set MM=%DATE:~4,2%
set YYYY=%DATE:~10,4%
set DEST="C:\EPIC Extracts\TANOAK_ReportExtract_%YYYY%-%MM%-%DD%.zip"
move "C:\EPIC Extracts\TANOAK-ReportExtract.zip" %DEST%

echo %date% %time%
sqlcmd -Q "exec EPICBulkInsert2017" -s TOUKDB02 -d TO_EPIC -o "C:\EPIC Extracts\SQL-Server_Import.log"
echo %date% %time%