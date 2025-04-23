@echo off
:: Batch file to run the Lua script
:: Checks if Lua is installed, installs it if not, and runs the Lua script

:: Function to check if Lua is installed
where lua >nul 2>nul
if errorlevel 1 (
    echo Lua interpreter is not installed. Installing Lua...

    :: Download Lua installer (Windows version) from Lua.org
    curl -LO https://www.lua.org/ftp/lua-5.4.4_Win64_bin.zip
    echo Lua downloaded successfully.

    :: Extract the Lua zip file
    tar -xf lua-5.4.4_Win64_bin.zip
    echo Lua extracted.

    :: Move the extracted Lua files to a directory in the PATH (e.g., C:\Lua)
    mkdir C:\Lua
    move lua-5.4.4_Win64_bin\* C:\Lua\
    echo Lua installed to C:\Lua.

    :: Add Lua to the system PATH environment variable
    setx PATH "%PATH%;C:\Lua"
    echo Lua has been added to your PATH.
)

:: Run the Lua script
lua minecraft_game.lua

:: Wait for user input before closing
pause
exit
