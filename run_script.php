<?php
$output = shell_exec("powershell.exe -ExecutionPolicy Bypass -install_chrome_remote_desktop.ps1");
echo "<pre>$output</pre>";
?>
