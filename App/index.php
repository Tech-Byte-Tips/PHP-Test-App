<?php

echo "<h1>Welcome to My Test App!</h1>";

$CID = getenv('DOCKER_CID');

echo "<p>We are currently running PHP8 + Apache2 in an Alpine Docker Container!</p>";

echo "<p>To view details about our PHP installation, <a href='info.php'>click here</a></p>";

?>