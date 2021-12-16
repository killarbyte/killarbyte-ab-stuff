@echo off

SETLOCAL EnableExtensions
Set Process=Zennoposter
tasklist | Find /i "%Process%.exe" || (goto FOUND)

echo Not running

exit 0
:FOUND
:: echo Running
:: Указываем полный путь к файлу Zennoposter.exe
start "" "C:\Program Files (x86)\ZennoLab\RU\ZennoPoster Pro\5.16.2.0\Progs\ZennoPoster.exe" -screen 0 -clipboard -multiwindow
exit 0


