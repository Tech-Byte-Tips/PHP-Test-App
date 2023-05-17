# Building the Alpine + Apache2 + PHP8 Container

The image will be based on the latest version of Alpine and will include Apache2 and PHP8

## OPTIONAL - Define ENVIRONMENT variables

You can (optionally) define environnement variables that will change configurations in the container.  As so:

--------------------------------------------------------------------------------------------------------------------------------------
- VARIABLE NAME		| EXAMPLE								| DEFAULT VALUE			     -
--------------------------------------------------------------------------------------------------------------------------------------
- `SERVER_ADMIN` 	| `name@domain.tld`							| `you@example.com`		     -
- `HTTP_SERVER_NAME` 	| `www.servername.com`							| `www.example.com`		     -
-			| Ref (https://httpd.apache.org/docs/2.4/fr/mod/core.html#servername)	|				     -
- `HTTPS_SERVER_NAME` 	| `www.servername.com`							| `www.example.com`		     -
-			| Ref (https://httpd.apache.org/docs/2.4/fr/mod/core.html#servername)	|				     -
- `LOG_LEVEL`		| `info`								| `info`		     	     -
-			| Ref (https://httpd.apache.org/docs/2.4/fr/mod/core.html#loglevel)	|				     -
- `TZ`			| `America/New_York`							| `UTC`			     	     -
-			| Ref (https://www.php.net/manual/timezones.php)			|				     -
- `PHP_MEMORY_LIMIT`	| `512M`|								| `256M`			     -
--------------------------------------------------------------------------------------------------------------------------------------

### How to Build

Run the following command to trigger the Docker build:

```sh
docker build -t <repoName>/<imageName>:<tag> .
```

### How to Run (direct command)

Run the following command to run a container of this image:

```sh
docker run --detach \
    --name <containerName> \
    --publish 80:80 \
    --publish 443:443 \
    --restart unless-stopped \
    <repoName>/<imageName>:<tag>
```

#### How to Run  (direct command, pecifying ENVIRONMENT variables)

This is an example of the run command with the variables set:

```sh
docker run --detach \
    --name MyApp \
    --hostname MyApp.local \
    --env HTTP_SERVER_NAME="www.myapp.com" \
    --env HTTPS_SERVER_NAME="www.myapp.com" \
    --env SERVER_ADMIN="admin@myapp.com" \
    --env TZ="America/New_York" \
    --env PHP_MEMORY_LIMIT="256M" \
    --publish 80:80 \
    --publish 443:443 \
    --restart unless-stopped \
    prengineer/myapp:latest
```

### Accessing the application

Open your browser and navigate to http://localhost