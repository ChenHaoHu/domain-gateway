# domain-gateway
simple tool but not good, u can use ingress with traefik or nginx


### nginx.conf 

```
lua_code_cache off; # dev env

location / {
  default_type text/html;
  set $url '';
  rewrite_by_lua_file /root/nginx/openresty/lua/gateway.lua;  # your nginx must support lua , u can choose openresty
  proxy_pass $url;
  proxy_set_header Host $host:$server_port;
}

```
