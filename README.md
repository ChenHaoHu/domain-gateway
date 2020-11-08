# domain-gateway
simple tool but not good, u can use ingress with traefik or nginx


### nginx.conf 

```conf
# dev env
lua_code_cache off;

location / {
  default_type text/html;
  set $url '';
  # your nginx must support lua , u can choose openresty
  rewrite_by_lua_file /root/nginx/openresty/lua/gateway.lua;  
  proxy_pass $url;
  proxy_set_header Host $host:$server_port;
}

```
