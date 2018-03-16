$dirs = Get-ChildItem -Path . | ?{ $_.PSIsContainer }
$back = pwd
foreach ($dir in $dirs)
{
    cd $dir.FullName
    echo $dir.FullName
    git add -A
	git commit -m "Committed automatically from <WS> Workstation"
	git pull origin
	git push
}   
cd $back.Path

Write-Host "Press any key to continue ..."

$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
