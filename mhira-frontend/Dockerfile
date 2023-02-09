FROM mhiraproject/mhira-frontend:latest

WORKDIR /usr/share/nginx/html

ARG email

RUN find ./ -type f -exec sed -i -e 's/https:\/\/dev-api.mhira.net\/graphql/.\/graphql/g' {} \;

# added to replace all possible values since the changes are done in the image and are persistent
RUN find ./ -type f -exec sed -i -e "s/email:!0/email:$email/g" {} \;
RUN find ./ -type f -exec sed -i -e "s/email:0/email:$email/g" {} \;
RUN find ./ -type f -exec sed -i -e "s/email:true/email:$email/g" {} \;
RUN find ./ -type f -exec sed -i -e "s/email:false/email:$email/g" {} \;

EXPOSE 80 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]

