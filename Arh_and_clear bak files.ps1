function get-ksDElTRNfile {

param ($Path)

$arr=@()

Get-ChildItem -Path $Path | 
   Where-Object { $_.Name -match '.bak' } | 
   Sort-Object -Property LastWriteTime -Descending  | 
   Select -First 1 |
   #Select-Object $_.FullName
   ForEach-Object { $arr+=$_.LastWriteTime }

#$arr

if($arr.Count -ne 0)
{

Get-ChildItem -Path $Path | 
   Where-Object { $_.Name -match '.trn' -and   $_.LastWriteTime -lt $arr[0] } |
   ForEach-Object { Remove-Item -LiteralPath $_.FullName #-WhatIf 
                  } 
 # Select LastWriteTime,FullName
  }


}

function get-ksDelRarFile {

param ($Path)

$zipDate = (Get-Date).AddDays(-10).Date

$arr=@()

Get-ChildItem -Path $Path | 
   Where-Object { $_.Name -match '.rar' -and $_.LastWriteTime -lt $zipdate } | 
    Group {$_.LastWriteTime.ToString("yyyy.MM") ,'$1'} | 
    ForEach-Object {
        $_.Group |
            Sort-Object -Property LastWriteTime  | 
            Select -First 1
   
    } | 
  #Select-Object $_.FullName
  ForEach-Object { $arr+=$_.FullName }

#$arr

Get-ChildItem -Path $Path | 
   Where-Object { $_.Name -match '.rar' -and  $_.FullName -notin $arr  -and $_.LastWriteTime -lt $zipdate } | 
   ForEach-Object { Remove-Item -LiteralPath $_.FullName #-WhatIf 
                  } 
 # Select LastWriteTime,FullName


}

function get-ksArh {

param ($PathSub)

$WinRar = "C:\Program Files\WinRAR\Rar.exe"
$TempPathRar = "E:\TEMP"

$data = Get-ChildItem $PathSub -Force |
            Where-Object { $_.Name -match '.bak' } | 
            Sort-Object -Property LastWriteTime -Descending   
    
foreach ($node in $data)
{
$f1 = $node.LastWriteTime.ToString("yyyy-MM-dd")
$dirName = $node.Directory.Name
$fileArh = "$PathSub\$dirName-$f1"
$fileName = $node.FullName
$fileErr  = "$PathSub\error.log"


& $WinRar  a -ep1 -df "-ilog($fileErr)" "-w($TempPathRar)" $fileArh $fileName


}

}

$Path = "D:\1c8BackUp\"

$data = Get-ChildItem $Path -Directory -Force
foreach ($node in $data)
{

get-ksDElTRNfile($node.FullName)
get-ksDelRarFile($node.FullName)

} 


$data = Get-ChildItem $Path -Directory -Force
foreach ($node in $data)
{
get-ksArh($node.FullName)
} 

