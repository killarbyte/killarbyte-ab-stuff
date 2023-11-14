### Extentions

Get-Content "input.txt" | Where-Object { $_ -notmatch '\.pdf$|\.png$|\.jpg$|\.jpeg$|\.gif$|\.ico$|\.webp$|\.svg$|\.doc$|\.txt$|\.csv$|\.xlsx$|\.zip$|\.rar$|\.js$|\.css$|\.ttf$|\.woff$|\.cab$|\.js\?|\.css\?|\.eot$|\.woff2$' } | Set-Content "output.txt"


### Sites

Get-Content "input.txt" | Where-Object { $_ -notmatch 'reg\.ru|2domains\.ru|google\.com|yandex\.ru|nic\.ru|beget\.com|axelname\.ru' } | Set-Content "output.txt"
Get-Content "input.txt" | Where-Object { $_ -notmatch 'reg\.ru|2domains\.ru|google\.com|yandex\.ru|nic\.ru|beget\.com|axelname\.ru|googleapis\.com|googletagmanager\.com|gstatic\.com|w3\.org' } | Set-Content "output.txt"

#alternative
#Select-String -Path "input.txt" -Pattern 'reg\.ru|2domains\.ru|google\.com|yandex\.ru|nic\.ru|beget\.com|axelname\.ru' -NotMatch | ForEach-Object { $_.Line } | Set-Content "output.txt"