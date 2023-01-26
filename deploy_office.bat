@echo off
title Office deployment script
echo Press Enter if you ran this as Administrator.
echo If not, right-click this batch and then click "Run as Administrator".
pause
echo Copying setup.exe and the XML to your Desktop...
copy setup.exe %userprofile%\Desktop /y
copy Config.xml %userprofile%\Desktop /y
echo Setting the KMS server to automatically activate...
slmgr /skms kms8.msguides.com
echo Checking if you already ran this script on this computer (copying Office deployment tools to Desktop)...
move %temp%\officedep\*.* %userprofile%\Desktop\ /y
echo Check to make sure you have setup.exe and Config.xml on your Desktop, then press any key.
pause
cls
echo ###############################
echo #    Deploying Office 2021    #
echo ###############################
echo.
echo Starting setup.exe...
cd %userprofile%\Desktop
echo Started setup.exe.
echo Setup.exe is now deploying Office 2021...
setup.exe /configure Config.xml
echo Setup.exe has finished, moving the config files into the temp dir.
mkdir %temp%\officedep
move Config.xml %temp%\officedep\ /y
move setup.exe %temp%\officedep\ /y
echo Done.
echo Press any key to close...
pause
exit