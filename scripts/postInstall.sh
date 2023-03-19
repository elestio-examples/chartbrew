# #set env vars
set -o allexport; source .env; set +o allexport;

# #wait until the server is ready
sleep 20s;

curl http://172.17.0.1:4019/user \
  -H 'accept: application/json' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'content-type: application/json' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
  --data-raw '{"name":"root","email":"'${ADMIN_EMAIL}'","password":"'${ADMIN_PASSWORD}'"}' \
  --compressed


# echo "Waiting for software to be ready ..."

# # echo "before"
# # sed -i '' -e '$ d' /opt/elestio/nginx/conf.d/${DOMAIN}.conf && 
# # docker exec elestio-nginx nginx
# echo "  
# map \$http_upgrade \$connection_upgrade {
#   default upgrade;
#   '' close;
# }

# proxy_cache_path /tmp/${PIPELINE_NAME} levels=1:2 keys_zone=${PIPELINE_NAME}:10m max_size=1g inactive=60m use_temp_path=off;
# limit_req_zone \$binary_remote_addr\$http_x_forwarded_for zone=${PIPELINE_NAME}e:16m rate=500r/m;


          
# server {
#   listen 443 ssl http2;
#   ssl_certificate /etc/nginx/certs/cert.pem;
#   ssl_certificate_key /etc/nginx/certs/key.pem;
#   server_name ${DOMAIN};

#   client_header_buffer_size 32k;
#   large_client_header_buffers 4 32k;

#   access_log flush=1s;
#   #access_log  /var/log/nginx/access_log;
#   #error_log /var/log/nginx/error_log;
  
#   location / {

#     content_by_lua_block {
#         ngx.header['server'] = 'Elestio'
#     }
#     access_by_lua_block {
#         ngx.header['server'] = 'Elestio'
#     }


    


#     limit_req zone=${PIPELINE_NAME}e burst=500 nodelay;
#     limit_req_log_level warn;

    

#     add_header X-Cache-Status \$upstream_cache_status;
#     proxy_ignore_headers Cache-Control;

#     #proxy_cache_valid any 0s;
#     #proxy_cache ${PIPELINE_NAME};
#     #proxy_cache_lock on;
#     #proxy_cache_methods GET HEAD;
#     #proxy_cache_bypass \$cookie_nocache \$arg_nocache;
#     #proxy_cache_use_stale error timeout updating http_500 http_502 http_503 http_504;
#     #proxy_cache_bypass \$http_upgrade;

#     proxy_http_version 1.1;
#     proxy_pass http://172.17.0.1:4118/;
#     proxy_set_header Host \$http_host;
#     proxy_set_header X-Real-IP \$remote_addr;
#     proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
#     proxy_set_header X-Forwarded-Proto \$scheme;
#     proxy_set_header X-Forwarded-Port  \$server_port;
#     proxy_set_header Upgrade \$http_upgrade;
#     proxy_set_header Connection \$connection_upgrade;

#     proxy_set_header Authorization \$http_authorization;
#     proxy_pass_header  Authorization;

#     proxy_hide_header x-powered-by;

#   }

# location /api/ {

#     content_by_lua_block {
#         ngx.header['server'] = 'Elestio'
#     }
#     access_by_lua_block {
#         ngx.header['server'] = 'Elestio'
#     }


    


#     limit_req zone=${PIPELINE_NAME}e burst=500 nodelay;
#     limit_req_log_level warn;

    

#     add_header X-Cache-Status \$upstream_cache_status;
#     proxy_ignore_headers Cache-Control;

#     #proxy_cache_valid any 0s;
#     #proxy_cache ${PIPELINE_NAME};
#     #proxy_cache_lock on;
#     #proxy_cache_methods GET HEAD;
#     #proxy_cache_bypass \$cookie_nocache \$arg_nocache;
#     #proxy_cache_use_stale error timeout updating http_500 http_502 http_503 http_504;
#     #proxy_cache_bypass \$http_upgrade;

#     proxy_http_version 1.1;
#     proxy_pass http://172.17.0.1:4019/;
#     proxy_set_header Host \$http_host;
#     proxy_set_header X-Real-IP \$remote_addr;
#     proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
#     proxy_set_header X-Forwarded-Proto \$scheme;
#     proxy_set_header X-Forwarded-Port  \$server_port;
#     proxy_set_header Upgrade \$http_upgrade;
#     proxy_set_header Connection \$connection_upgrade;

#     proxy_set_header Authorization \$http_authorization;
#     proxy_pass_header  Authorization;

#     proxy_hide_header x-powered-by;

#   }

# }" > /opt/elestio/nginx/conf.d/${DOMAIN}.conf
# docker exec elestio-nginx nginx -s reload;


# sleep 800s;


# curl https://${DOMAIN}/api/app/users \
#   -H 'accept: application/json' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'content-type: application/json' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
#   --compressed


# # sleep 90s;

# # curl https://${DOMAIN}/api/app/users \
# #   -H 'accept: application/json' \
# #   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
# #   -H 'content-type: application/json' \
# #   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
# #   --compressed

# curl https://${DOMAIN}/api/user \
#   -H 'accept: application/json' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'content-type: application/json' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
#   --data-raw '{"name":"root","email":"'${ADMIN_EMAIL}'","password":"'${ADMIN_PASSWORD}'"}' \
#   --compressed




# #   curl 'https://chartbrewvfd-u353.vm.elestio.app/login' \
# #   -H 'authority: chartbrewvfd-u353.vm.elestio.app' \
# #   -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
# #   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
# #   -H 'cookie: ajs_anonymous_id=93fd7d45-2f30-4972-b019-93f1cdd540a9; _ga_R4YJ9JN8L4=GS1.1.1676460410.18.1.1676461759.0.0.0; _ga=GA1.2.2136135344.1675585239; ph_phc_7F92HoXJPeGnTKmYv0eOw62FurPMRW9Aqr0TPrDzvHh_posthog=%7B%22distinct_id%22%3A%22sq1dBVll3Ecwof60SbBGM%22%2C%22%24device_id%22%3A%22185fe5c0c521826-0d7abf7a8f6f13-26021051-1fa400-185fe5c0c53ad7%22%2C%22%24referrer%22%3A%22https%3A%2F%2Fdash.elest.io%2F%22%2C%22%24referring_domain%22%3A%22dash.elest.io%22%2C%22%24sesid%22%3A%5B1678091403064%2C%22186b5ea7884fe8-04b34fe8f4490c-26031951-1fa400-186b5ea788519bf%22%2C1678089287812%5D%2C%22%24user_id%22%3A%22sq1dBVll3Ecwof60SbBGM%22%2C%22%24active_feature_flags%22%3A%5B%5D%2C%22%24enabled_feature_flags%22%3A%7B%7D%2C%22%24session_recording_enabled_server_side%22%3Afalse%2C%22%24feature_flag_payloads%22%3A%7B%7D%2C%22%24user_state%22%3A%22identified%22%7D; ph_phc_nSin8j5q2zdhpFDI1ETmFNUIuTG4DwKVyIigrY10XiE_posthog=%7B%22distinct_id%22%3A%22amsellem.joseph%40gmail.com%22%2C%22%24device_id%22%3A%22186977993eb125e-0d3174c114d09a-26031951-1fa400-186977993ec1974%22%2C%22%24referrer%22%3A%22%24direct%22%2C%22%24referring_domain%22%3A%22%24direct%22%2C%22%24sesid%22%3A%5B1678284432697%2C%22186c18c2539eba-0e29e992cc837c-26031951-1fa400-186c18c253a106e%22%2C1678284432697%5D%2C%22%24session_recording_enabled_server_side%22%3Afalse%2C%22%24active_feature_flags%22%3A%5B%5D%2C%22%24enabled_feature_flags%22%3A%7B%7D%2C%22%24user_id%22%3A%22amsellem.joseph%40gmail.com%22%7D' \
# #   -H 'referer: https://chartbrewvfd-u353.vm.elestio.app/' \
# #   -H 'sec-ch-ua: "Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"' \
# #   -H 'sec-ch-ua-mobile: ?0' \
# #   -H 'sec-ch-ua-platform: "Windows"' \
# #   -H 'sec-fetch-dest: document' \
# #   -H 'sec-fetch-mode: navigate' \
# #   -H 'sec-fetch-site: same-origin' \
# #   -H 'upgrade-insecure-requests: 1' \
# #   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36' \
# #   --compressed