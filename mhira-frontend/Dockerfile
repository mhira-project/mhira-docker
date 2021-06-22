FROM public.ecr.aws/a3v1m7k0/mhira-frontend:development

WORKDIR /usr/share/nginx/html

RUN find ./ -type f -exec sed -i -e 's/https:\/\/dev-api.mhira.net\/graphql/.\/graphql/g' {} \;

EXPOSE 80 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]

