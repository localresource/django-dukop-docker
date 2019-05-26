#!/bin/bash

SCRIPT_DIR=$( realpath $( dirname $0 ) )

sudo docker inspect my-django-dukop >/dev/null
if [[ $? -eq 0 ]]; then
	sudo docker start my-django-dukop
else
	sudo docker run --tty --user "1000:1000" --volume "$SCRIPT_DIR/django-dukop:/myapp" --name my-django-dukop -d django-dukop
fi

ADDR=$( sudo docker inspect -f '{{range .NetworkSettings.Networks}} http://{{.IPAddress}}:8000{{end}}' my-django-dukop )

echo "********************************************************************************"
echo
echo "dukop should now be running at$ADDR"
echo
echo "********************************************************************************"

