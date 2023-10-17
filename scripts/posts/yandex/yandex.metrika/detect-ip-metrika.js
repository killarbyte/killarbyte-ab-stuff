<!-- Detect IP -->
<script type='text/javascript'>
  var userip;

  function setUserIP(ip) {
    userip = ip;
    // здесь можно выполнить дополнительные операции, связанные с IP
    console.log('User IP:', userip);
  }

  function loadScript(url, callback) {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = url;
    script.async = true;
    script.onload = callback;
    script.onerror = function() {
      console.error('Failed to load script: ' + url);
    };
    document.head.appendChild(script);
  }

  // Проверка наличия переменной перед использованием
  if (!userip) {
    loadScript('https://api64.ipify.org?format=jsonp&callback=setUserIP', function() {
      if (typeof setUserIP === 'function') {
        // Изоляция кода
        try {
          setUserIP(userip);
        } catch (error) {
          console.error('Error setting user IP:', error);
        }
      } else {
        console.error('Failed to load setUserIP function');
      }
    });
  }
</script>
<!-- /Detect IP -->
