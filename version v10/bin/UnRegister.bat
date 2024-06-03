cd "%~dp0"
echo Registrar: "%~dp0ShellPreviewImagesFiles.dll"
regsvr32 /u "%~dp0ShellPreviewImagesFiles.dll"
regsvr32 /u "%~dp0ShellPreviewTextFiles.dll"
