function TOR_DOMAIN(){
  while [ ! -f ./tor/hidden_service/hostname ]; do
    echo "Waiting for Tor hidden service to initialize..."
    sleep 2
  done
  domain=$(cat ./tor/hidden_service/hostname)
  echo -e "\033[32mhttp://$domain/\033[0m"
  echo "http://$domain/" > ./public/domains.html
}
TOR_DOMAIN
