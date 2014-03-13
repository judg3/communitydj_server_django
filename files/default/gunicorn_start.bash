#!/bin/bash

NAME="service"                                    # Name of the application
DJANGODIR=/the_app/server/service                 # Django project directory
SOCKFILE=/the_app/server/run/gunicorn.sock        # we will communicte using this unix socket
USER=vagrant                                      # the user to run as
GROUP=vagrant                                     # the group to run as
NUM_WORKERS=3                                     # how many worker processes should Gunicorn spawn
DJANGO_SETTINGS_MODULE=service.setting            # which settings file should Django use
DJANGO_WSGI_MODULE=service.wsgi                   # WSGI module name

echo "Starting $NAME as `whoami`"

# Activate the virtual environment
cd $DJANGODIR

# Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Start your Django Unicorn

gunicorn ${DJANGO_WSGI_MODULE}:application --name $NAME --workers $NUM_WORKERS --user=$USER --group=$GROUP --log-level=debug 
#  --bind=unix:$SOCKFILE