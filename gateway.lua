

--  动态代理实现 v0.1 
-- make by hcy

function FileRead(filepath)
	local file = io.open(filepath, "r");
	local json = file:read("*a");
	file:close();
	return json;
end

function FileWrite(filepath)
	local file = io.open(filepath, "w");
	-- .....
	file:close();
end




-- start
--
local cjson = require("cjson");

local config_path = "/root/nginx/openresty/lua/gateway.json"

local config = FileRead(config_path);
local url_map = cjson.decode(config);

-- ip_url_http="http://127.0.0.1:"
req_host = ngx.var.host
req_prefix_pos = string.find(req_host, "%.", 1) 
req_prefix = string.sub(req_host,1,req_prefix_pos-1)

url=url_map[req_prefix]

if(url==nil)
then
	ngx.exit(403);
else
	ngx.var.url = url
end


--end
