# Start Docker Container
### Using Makefile
For easier usage, we can use Makefile to run our scripts for us.(`Makefile` contains command list)
- build container `make build`
- interact with app container terminal `make interact` -> to get out of container `exit` (not a make file cmd, just shell command).
- show running containers for this project `make list`
- autoload composer `make autoload`
##  Installation Guide (Required)
#### Dev Env
1. `make dev` this will create docker container 'app' and 'server'. (Nginx Caching Disabled) during development.
2. Follow rest steps from point 2 onwards.
#### Or regular setup
1. `make build` this will create the docker container app and server.
2. `make install` this will install the vendor folder into our Container (can't install it directly from Dockerfile. Idk why.).
3. (Optional) `make interact` go inside the docker `app` container.
4. (Optional - if required) - `make autoload` this will run `composer autoload` from our container.
5. (Optional - if required) - `make list` show docker container for current project.
6. (Optional - if required) - `make dump` remove container.
7. (Optional - if required) - `make clean-vendor` this will get rid of the vendor folder in our `app container`.

`Full command list available in the Makefile.`
 ### Or use just use shell commands
Run this shell command from the root of the project.

This will create two containers.
- one for php "app".
- second one for webserver "nginx".
```shell
docker compose up --build -d
```
### (Optional) Install Composer - Maybe additional command required
### (Commented out in Dockerfile!!)
`Composer` should be installed through the `Dockerfile`. If not, we need to go into our container and run this command.
```shell
docker exec -it form-validation-app sh
```
When we are inside the container in interactive mode.
```shell
composer init
```
This should create a `composer.json` file in our `src directory`.

### Available on Port `localhost:8000`

---
### Still not sure how to use Git Version Control with Docker.
- I ran `git init` inside from the container in interactive mode
- And ran a second `git init` in my project root.

---
## Todos
- Create a `Dev Env` for php and docker. for easier Development.
- Create a `Prod Env` for php, docker and nginx.
- Add `SQL DB` Container.