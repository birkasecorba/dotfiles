# Update the local package index so that you have access to the most recent package listings.
apt update

# Install Nginx
apt install nginx

# Update Firewall
ufw allow 'Nginx Full'

# Check for status
systemctl status nginx