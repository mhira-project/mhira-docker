FROM ubuntu:latest

RUN apt-get update && apt-get -y install cron

# Copy backup cron file to the cron.d directory
COPY ./crontab/daily-backup /etc/cron.d/daily-backup
COPY ./scripts/backup /bin/backup
COPY ./scripts/restore /bin/restore
COPY ./scripts/prune /bin/prune
 
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/daily-backup
RUN chmod +x /bin/backup
RUN chmod +x /bin/restore
RUN chmod +x /bin/prune

# Apply cron job
RUN crontab /etc/cron.d/daily-backup
 
# Run the command on container startup
CMD touch /var/log/cron.log && cron && tail -f /var/log/cron.log