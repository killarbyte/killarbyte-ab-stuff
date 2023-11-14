### Extentions

Get-Content "input.txt" | Where-Object { $_ -notmatch '\.pdf$|\.png$|\.jpg$|\.jpeg$|\.gif$|\.ico$|\.webp$|\.svg$|\.doc$|\.txt$|\.csv$|\.xlsx$|\.zip$|\.rar$|\.js$|\.css$|\.ttf$|\.woff$|\.cab$|\.js\?|\.css\?' } | Set-Content "output.txt"


### Sites

Get-Content "input.txt" | Where-Object { $_ -notmatch 'reg\.ru|2domains\.ru|google\.com|yandex\.ru|nic\.ru|beget\.com|axelname\.ru' } | Set-Content "output.txt"