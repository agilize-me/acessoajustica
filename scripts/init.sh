#! /bin/bash
#
# Builds the Docker image using Docker-Compose,
# Wraps running bundler and rspec tests,
# Starts and Restarts the app;
# (requires docker, docker-compose and sudo privileges)
#

DOCKER='docker'
DOCKER_COMPOSE='docker-compose'
GEMS='Gemfile'

function usage {
    echo "usage: ./scripts/init.sh [OPTIONS]:"
    echo " "
    echo " all:        Builds everything, images and containers."
    echo " run:        Runs the app on the latest container."
    echo " test:       Runs all tests."
    echo " clean:      Stops and Removes all containers."
    echo " purge:      Stops and Removes all containers and images."
    echo " update:     Runs bundle update."
    echo " migrate:    Runs all migrations. (also done by 'run' and 'all')"
    echo " restart:    Stops all containers and then 'run'."
    echo " seed:       Puts initial values on the database."
    echo " help:       Prints this message."
    echo " "
}
function check_deps {
    # Check dependencies.
    command -v ${DOCKER}>/dev/null 2>&1 || { echo >&2 "I require '${DOCKER}', but it's not installed.  Aborting."; exit 1; }
    command -v ${DOCKER_COMPOSE}>/dev/null 2>&1 || { echo >&2 "I require '${DOCKER_COMPOSE}', but it's not installed.  Aborting."; exit 1; }
    return 0
}
function app_seed {
    sudo ${DOCKER_COMPOSE} run web rake db:seed                 # Seeds the database.
    sudo ${DOCKER_COMPOSE} run web rake db:seed RAILS_ENV=test  # Seeds the database.
}
function app_restart {
    sudo ${DOCKER} stop $(sudo ${DOCKER} ps -a -q)              # Stops old containers.
    sudo ${DOCKER_COMPOSE} up                                   # Starts the app.
}
function app_migrate {
    sudo ${DOCKER_COMPOSE} run web rake db:create               # Creates all databases.
    sudo ${DOCKER_COMPOSE} run web rake db:migrate              # Runs migrations.
}
function app_test {
    app_migrate
    sudo ${DOCKER_COMPOSE} run web rake spec                    # Runs tests.
}
function app_run {
    app_migrate
    sudo ${DOCKER_COMPOSE} up                                   # Starts the app.
}
function build_update {
    sudo ${DOCKER_COMPOSE} run web bundle update                # Updating gems.
    app_test
}
function build_clean {
    COMPOSER=$(sudo ${DOCKER} ps -a -q)
    if [[ -n $COMPOSER ]] 
    then
        sudo ${DOCKER} stop $COMPOSER # Stops old containers.
        sudo ${DOCKER} rm $COMPOSER   # Remove old containers.
    fi
    if [[ -f ./tmp/pid/server.pid ]]
    then
        sudo rm ./tmp/pid/server.pid
    fi
}
function build_purge {
    build_clean
    PROJECT_DIR=${PWD##*/}                         # Gets current dir name.
    rm ${GEMS}.lock                                # Purges the lock.
    sudo ${DOCKER} rmi ${PROJECT_DIR}_web:latest   # Removes old project image.
}
function build_all {
    build_purge

    sudo ${DOCKER_COMPOSE} build                   # Builds a new image.
    sudo ${DOCKER_COMPOSE} run web rake db:seed    # Adds admin user.
    app_test
}
if check_deps; then
    if [[ $1 == all ]]; then build_all;
    elif [[ $1 == purge ]]; then build_purge;
    elif [[ $1 == update ]]; then build_update;
    elif [[ $1 == clean ]]; then build_clean;
    elif [[ $1 == restart ]]; then app_restart;
    elif [[ $1 == run ]]; then app_run;
    elif [[ $1 == migrate ]]; then app_migrate;
    elif [[ $1 == test ]]; then app_test;
    elif [[ $1 == seed ]]; then app_seed;
    elif [[ $1 == help ]]; then usage;
    else { echo ""; echo "Error: no valid argument."; echo ""; usage; echo "Exiting..."; exit 0; }
    fi
fi
