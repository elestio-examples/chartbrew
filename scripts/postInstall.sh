#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."

sed -i '' -e '$ d' /opt/elestio/nginx/conf.d/${DOMAIN}.conf

echo "  
  location /api/ {

    content_by_lua_block {
        ngx.header['server'] = 'Elestio'
    }
    access_by_lua_block {
        ngx.header['server'] = 'Elestio'
    }


    


    limit_req zone=${PIPELINE_NAME}e burst=500 nodelay;
    limit_req_log_level warn;

    

    add_header X-Cache-Status \$upstream_cache_status;
    proxy_ignore_headers Cache-Control;

    #proxy_cache_valid any 0s;
    #proxy_cache ${PIPELINE_NAME};
    #proxy_cache_lock on;
    #proxy_cache_methods GET HEAD;
    #proxy_cache_bypass \$cookie_nocache \$arg_nocache;
    #proxy_cache_use_stale error timeout updating http_500 http_502 http_503 http_504;
    #proxy_cache_bypass \$http_upgrade;

    proxy_http_version 1.1;
    proxy_pass http://172.17.0.1:4019/;
    proxy_set_header Host \$http_host;
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto \$scheme;
    proxy_set_header X-Forwarded-Port  \$server_port;
    proxy_set_header Upgrade \$http_upgrade;
    proxy_set_header Connection \$connection_upgrade;

    proxy_set_header Authorization \$http_authorization;
    proxy_pass_header  Authorization;

    proxy_hide_header x-powered-by;

  }
}" >> /opt/elestio/nginx/conf.d/${DOMAIN}.conf
docker exec elestio-nginx nginx -s reload;

sleep 250s;

curl https://${DOMAIN}/api/app/users \
  -H 'accept: application/json' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  --compressed

curl https://${DOMAIN}/api/user \
  -H 'accept: application/json' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  --data-raw '{"name":"root","email":"'${ADMIN_EMAIL}'","password":"'${ADMIN_PASSWORD}'"}' \
  --compressed