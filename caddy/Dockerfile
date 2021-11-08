FROM caddy:2-builder-alpine

# ARG plugins="cors"

# ## ARG plugins="cors cgi cloudflare azure linode"

# RUN caddyplug install ${plugins}
    
EXPOSE 80 443 2015

WORKDIR /var/www/public

CMD ["/usr/bin/caddy", "run", "--config", "/etc/caddy/Caddyfile"]
