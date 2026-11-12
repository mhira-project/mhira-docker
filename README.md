# Mental health information reporting assistant

MHIRA with Docker: this repository starts the MHIRA backend, the frontend,
PostgreSQL, MongoDB, Redis, the Caddy web server, the Shiny report server
and a nightly backup together.

## Installing

You need a Linux server with [Docker](https://docs.docker.com/engine/install/)
and its Compose plugin (`docker compose version` prints a version), and a
domain name or IP address under which the server is reached.

    git clone https://github.com/mhira-project/mhira-docker.git
    cd mhira-docker
    cp env-example .env

Edit `.env` before the first start:

- `APP_VERSION`: the MHIRA version to run, for example `2.0.0`. Always name
  a version.
- `SITE_DOMAIN`: the server's domain name or IP address. Caddy gets a
  certificate for a public domain name by itself.
- `SUPERADMIN_PASSWORD`, `JWT_SECRET`, `POSTGRES_PASSWORD`,
  `RSTUDIO_PASSWORD` and `FRONTEND_ENCRYPTION_KEY`: replace every one of
  the example values with your own (`openssl rand -base64 32` prints a
  random one).
- `MAIL_HOST`, `MAIL_PORT`, `MAIL_SECURE` (`true` or `false`), `MAIL_USER`,
  `MAIL_PASS` and `SENDER_MAIL`: your mail server. The backend does not
  start while one of them is empty, also when MHIRA is not meant to send
  mail; fill in placeholders in that case.
- `APP_URL`: the address users open, for example `https://mhira.example.org`.
  It is used for the links in assessment mails.
- `SHINY_APPS_PATH`: the folder that holds the report apps. Create it
  before the start.

Then start MHIRA:

    docker compose up -d

The first start downloads and builds the images and creates the databases,
which takes a few minutes. `docker compose logs -f mhira-backend` shows
`Application started on port 3000` when the backend is ready. Open
`https://<SITE_DOMAIN>` and log in as `superadmin` with
`SUPERADMIN_PASSWORD`.

The MHIRA images are published for x86-64 (`linux/amd64`) and 64-bit ARM
(`linux/arm64`). The Shiny report server's image exists for x86-64 only.

## Data and backups

The databases keep their data under `DATA_SAVE_PATH`. The `backup`
container writes a dump of PostgreSQL and MongoDB into `DATA_BACKUP_PATH`
every night; `docker compose ps` shows whether it is healthy. Copy these
backups to another machine.

## Changing the version

Make a backup, set `APP_VERSION` in `.env`, and run:

    docker compose up -d --build

Before moving from 1.1.6 to 2.0.0, run the upgrade check of
[mhira-backend](https://github.com/mhira-project/mhira-backend/tree/main/upgrade-check)
on a copy of a backup. To go back, set `APP_VERSION=1.1.6` and run the same
command. What changed is in the backend's
[CHANGELOG](https://github.com/mhira-project/mhira-backend/blob/main/CHANGELOG.md).
