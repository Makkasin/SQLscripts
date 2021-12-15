Для копирования techsys длл-ок:
Батник копирующий Ps-скрипт:
mkdir c:\1c
copy \\MTK-1.RU\NETLOGON\1c\21.ps1 C:\1c\21.ps1
powershell "C:\1c\21.ps1"
PS-скрипт проверяет есть ли папка 1С нужной версии, проверяет наличие файла techsys_100.dll - если его нет - выполняет копирование:
$Folder1C = 'C:\Program Files\1cv8\8.3.18.1289\bin'
$FileDll = 'C:\Program Files\1cv8\8.3.18.1289\bin\techsys_100.dll'

if ((Test-Path -Path $Folder1C) -and  (-not(Test-Path -Path $FileDll -PathType Leaf))) {
Copy-Item -Path "\\MTK-1.RU\NETLOGON\1c\Mimo3\x64\techsys_100.dll" -Destination "C:\Program Files\1cv8\8.3.18.1289\bin\techsys_100.dll" -PassThru
Copy-Item -Path "\\MTK-1.RU\NETLOGON\1c\Mimo3\x64\techsys.dll" -Destination "C:\Program Files\1cv8\8.3.18.1289\bin\techsys.dll" -PassThru
}
P.S.: Почему так сложно? Изначально написано на PS, но политикой разрешено выполнение ps-скриптов с повышенными правами только из локальных источников. Обход через батник. Дебильно конечно, но работает так... Все можно посмотреть живое в \\MTK-1.RU\NETLOGON\1c
