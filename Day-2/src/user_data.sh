#!/bin/bash
apt update
apt install -y apache2

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Practice website</title>
  <style>
    /* Add animation and styling for the text */
    @keyframes colorChange {
      0% { color: red; }
      50% { color: green; }
      100% { color: blue; }
    }
    h1 {
      animation: colorChange 2s infinite;
    }
  </style>
</head>
<body>
  <h1>Hello world!</h1>
  
</body>
</html>
EOF

# Start Apache and enable it on boot
systemctl start apache2
systemctl enable apache2