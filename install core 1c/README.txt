��� ����������� techsys ���-��:
������ ���������� Ps-������:
mkdir c:\1c
copy \\MTK-1.RU\NETLOGON\1c\21.ps1 C:\1c\21.ps1
powershell "C:\1c\21.ps1"
PS-������ ��������� ���� �� ����� 1� ������ ������, ��������� ������� ����� techsys_100.dll - ���� ��� ��� - ��������� �����������:
$Folder1C = 'C:\Program Files\1cv8\8.3.18.1289\bin'
$FileDll = 'C:\Program Files\1cv8\8.3.18.1289\bin\techsys_100.dll'

if ((Test-Path -Path $Folder1C) -and  (-not(Test-Path -Path $FileDll -PathType Leaf))) {
Copy-Item -Path "\\MTK-1.RU\NETLOGON\1c\Mimo3\x64\techsys_100.dll" -Destination "C:\Program Files\1cv8\8.3.18.1289\bin\techsys_100.dll" -PassThru
Copy-Item -Path "\\MTK-1.RU\NETLOGON\1c\Mimo3\x64\techsys.dll" -Destination "C:\Program Files\1cv8\8.3.18.1289\bin\techsys.dll" -PassThru
}
P.S.: ������ ��� ������? ���������� �������� �� PS, �� ��������� ��������� ���������� ps-�������� � ����������� ������� ������ �� ��������� ����������. ����� ����� ������. �������� �������, �� �������� ���... ��� ����� ���������� ����� � \\MTK-1.RU\NETLOGON\1c
