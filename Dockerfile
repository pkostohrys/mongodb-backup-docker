FROM mongo:4.4.1

# Preparate update
RUN apt-get update
RUN apt-get install -y awscli

COPY backup-mongodb-to-s3.sh /scripts/

# MongoDB Source Database
ARG MONGO_URI

# S3 bucket that the backup will be stored
ARG AWS_TARGET_BUCKET
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY

#Execute Backup
CMD ["/bin/sh", "/scripts/backup-mongodb-to-s3.sh"]
