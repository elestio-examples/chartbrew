<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Chartbrew, verified and packaged by Elestio

[Chartbrew](https://chartbrew.com/) allows you to connect all your databases and APIs to create beautiful live charts and visualize your data in custom dashboards.

<img src="https://raw.githubusercontent.com/elestio-examples/chartbrew/main/Chartbrew.png" alt="chartbrew" width="800">

[![deploy](https://github.com/elestio-examples/chartbrew/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/chartbrew)

Deploy a <a target="_blank" href="https://elest.io/open-source/chartbrew">fully managed Chartbrew</a> on <a target="_blank" href="https://elest.io/">elest.io</a> if you want automated backups, reverse proxy with SSL termination, firewall, automated OS & Software updates, and a team of Linux experts and open source enthusiasts to ensure your services are always safe, and functional.

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/chartbrew.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Run the project with the following command
⚠️The first deployment is a bit long ~ 8-10 minutes because it recompiles with the REACT_APP environment⚠️

    docker-compose up -d
    ./scripts/postInstall.sh

You can access the Web UI at: `http://your-domain:4118`

# Update

If you want to update your image, use the following commands:

    ./scripts/postDeploy.sh => only once
    ./scupts/postUpdate.sh => each time you want to update the image, it will be recompiled ~ 8-10 minutes

## Docker-compose

Here are some example snippets to help you get started creating a container.

    version: "3"

    services:
        chartbrew:
            image: elestio4test/chartbrew:latest
            restart: always
            ports:
                - 172.17.0.1:4118:4018
                - 172.17.0.1:4019:4019
            expose:
                - 4018
                - 4019
            environment:
                CB_SECRET: ${ADMIN_PASSWORD}
                CB_API_HOST: 0.0.0.0
                CB_API_PORT: 4019
                CB_RESTRICT_TEAMS: 0
                CB_DB_DIALECT: mysql
                CB_DB_HOST: db
                CB_DB_NAME: chartbrew
                CB_DB_USERNAME: chartbrew
                CB_DB_PASSWORD: ${ADMIN_PASSWORD}
                CB_DB_PORT: 3306
                REACT_APP_CLIENT_HOST: ${BASE_URL}
                REACT_APP_API_HOST: ${BASE_URL}/api
            volumes:
                - ./settings.js:/code/server/settings.js
                - ./storage/dist:/code/client/dist
            depends_on:
                - db

        db:
            image: elestio/mysql:8.0
            restart: always
            environment:
                MYSQL_DATABASE: chartbrew
                MYSQL_USER: chartbrew
                MYSQL_PASSWORD: ${ADMIN_PASSWORD}
                MYSQL_ALLOW_EMPTY_PASSWORD: 1
            ports:
                - 172.17.0.1:20064:3306
            volumes:
                - ./storage/chartbrew-db:/var/lib/mysql

### Environment variables

|      Variable      |     Value (example)     |
| :----------------: | :---------------------: |
|   ADMIN_PASSWORD   |      your-password      |
|    ADMIN_EMAIL     |     admin@email.com     |
|      BASE_URL      | https://your.domain.com |
|    CB_MAIL_HOST    |       172.17.0.1        |
|    CB_MAIL_PORT    |           25            |
|   CB_MAIL_SECURE   |          false          |
|   CB_ADMIN_MAIL    |    sender@email.com     |
|       DOMAIN       |     your.domain.com     |
|   PIPELINE_NAME    |        chartbrew        |
| CB_RESTRICT_SIGNUP |            0            |

# Maintenance

## Logging

The Elestio Chartbrew Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://docs.chartbrew.com/">Chartbrew documentation</a>

- <a target="_blank" href="https://github.com/chartbrew/chartbrew">Chartbrew Github repository</a>

- <a target="_blank" href="https://github.com/elestio-examples/chartbrew">Elestio/Chartbrew Github repository</a>
