echo %date% %time%
IF EXIST "C:\EPIC Extracts\PATH_ReportExtract.zip" DEL /F "E:\EPIC Extracts\PATH_ReportExtract.zip"
"C:\Program Files (x86)\WinSCP\WinSCP.exe" ^
  /log="C:\EPIC Extracts\WinSCP.log" /ini=nul ^
  /command ^
    "open ftps://ftp-path:k4rnNS92X7x554fG@ftp2.epicloansystems.com:995/ -certificate=""42:24:8b:3a:4b:39:5f:50:a1:95:e8:c6:04:c8:c5:7b:5c:87:fb:2d"" -rawsettings ProxyPort=0" ^
    "get ""/PATH_ReportExtract.zip"" ""E:\EPIC Extracts\PATH_ReportExtract.zip""" ^
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
IF EXIST "C:\EPIC Extracts\Path Lending\*" DEL /F /Q "C:\EPIC Extracts\Path Lending\*"
"C:\Program Files\7-Zip\7z.exe" x  "E:\EPIC Extracts\PATH_ReportExtract.zip"  -o"C:\EPIC Extracts\Path Lending" -y -r
set DD=%DATE:~7,2%
set MM=%DATE:~4,2%
set YYYY=%DATE:~10,4%
set DEST="E:\EPIC Extracts\Path_ReportExtract_%YYYY%-%MM%-%DD%.zip"
move "E:\EPIC Extracts\Path_ReportExtract.zip" %DEST%

echo %date% %time%
sqlcmd -Q "exec EPICBulkInsert2017" -S COUKDB02\MSSQLSERVER2017 -d EPIC -o "E:\EPIC Extracts\SQL-Server_Import.log"
echo %date% %time%