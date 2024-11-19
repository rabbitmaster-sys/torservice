function TOR_DOMAIN() {
  if [ -f ./tor/hidden_service/hostname ]; then
    domain=$(cat ./tor/hidden_service/hostname)
    echo -e "\033[32mhttp://$domain/\033[0m"
    echo "http://$domain/" > ./public/domains.html
  else
    echo "Hidden service hostname not found. Tor may not be fully initialized yet." > ./public/domains.html
  fi
}
TOR_DOMAIN
