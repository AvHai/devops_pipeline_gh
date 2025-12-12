#!/bin/bash

echo "*********DEPLOYMENT STARTED**************"

code_clone() {
    echo "Cloning the Django App.."
    if [ -d "django-notes-app" ]; then
        echo "The code directory already exists, skipping clone."
    else
        git clone https://github.com/LondheShubham153/django-notes-app.git || {
            echo "Failed to clone the repo"
            return 1
        }
    fi
}

install_requirements() {
    echo "Installing Dependencies.."
    sudo apt-get update && sudo apt-get install -y docker.io nginx docker-compose || {
        echo "Failed to install dependencies."
        return 1
    }
}

required_restarts() {
    sudo chown $USER /var/run/docker.sock
    sudo systemctl enable docker
    sudo systemctl enable nginx
    sudo systemctl restart docker
}

deploy() {
    cd django-notes-app || return 1

    # Build docker correctly
    docker build -t notes-app . || return 1

    # Run container
    docker run -d -p 8000:8000 notes-app:latest || return 1
}

# Execute steps
if ! code_clone; then exit 1; fi
if ! install_requirements; then exit 1; fi
if ! required_restarts; then exit 1; fi
if ! deploy; then
    echo "Deployment failed. Mailing the admin..."
    exit 1
fi

echo "********** DEPLOYMENT DONE *********"

