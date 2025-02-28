<!DOCTYPE html>
<html>
<head>
    <title>Run PowerShell Script</title>
</head>
<body>
    <a href="run_script.php">Run PowerShell Script</a>
</body>
</html>
<?php
$output = shell_exec("powershell.exe -ExecutionPolicy Bypass -install_chrome_remote_desktop.ps1");
echo "<pre>$output</pre>";
?>
