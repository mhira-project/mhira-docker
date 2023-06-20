FROM alpine:latest

RUN apk update && apk add --no-cache dpkg wget postgresql-client mongodb-tools busybox

# Copy backup cron file to the cron.d directory
COPY ./crontab/daily-backup /etc/cron.d/daily-backup
COPY ./scripts/backup /bin/backup
COPY ./scripts/restore /bin/restore
COPY ./scripts/prune /bin/prune
COPY ./scripts/entrypoint /bin/entrypoint
 
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/daily-backup
RUN chmod +x /bin/backup
RUN chmod +x /bin/restore
RUN chmod +x /bin/prune
RUN chmod +x /bin/entrypoint

# Apply cron job
RUN crontab /etc/cron.d/daily-backup
 
# Run the command on container startup
ENTRYPOINT ["/bin/entrypoint"]
CMD touch /var/log/cron.log && crond && tail -f /var/log/cron.log