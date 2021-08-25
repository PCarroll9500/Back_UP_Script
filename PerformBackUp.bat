:: Performs Back Up with Latest Files and Time Stamps with Log
:: V3.0 5/21/2021
:: By: Patrick Carroll
:: Txt File Implementation for To and From Directory
@echo off &color 1f && Title [Welcome to Perform Data Full BackUp.....]

echo Hello and Welcome to my Script!
:: Create A Variable with a date/time stamp [*] Works
set DateFolder=%date:~10,4%-%date:~4,2%-%date:~7,2%

:: Check The To and From File Exhists
if not exist "%cd%/ToFolder.txt" echo Failed to find the directory the back up is being sent to "ToFolder.txt"  & GOTO EOF
if not exist "%cd%/FromFolder.txt" echo Failed to find the directory being backed up "FromFolder.txt" & GOTO EOF

:: Load content of files into ToFolder
FOR /F "tokens=* delims=" %%x in (ToFolder.txt) DO set "ToFolderText=%ToFolderText%%%x"
echo To  Folder:	"%ToFolderText%"

:: Load content of files into FromFolder
FOR /F "tokens=* delims=" %%x in (FromFolder.txt) DO set "FromFolderText=%FromFolderText%%%x"
echo From Folder:	"%FromFolderText%"

echo Starting BackUp....

:: Create Back Up Log Directory
if not exist "%ToFolderText%\BackUpLogs\" mkdir "%ToFolderText%\BackUpLogs"

:: Create the Directory where the files are backed up
if not exist "%ToFolderText%\%DateFolder%\" mkdir "%ToFolderText%\%DateFolder%"
::
robocopy "%FromFolderText%" "%ToFolderText%\%DateFolder%" /MIR /W:0 /R:1 /REG > "%ToFolderText%\BackUpLogs\%DateFolder%.log"
echo BackUp complete!
:EOF

echo Scipt is Complete

pause