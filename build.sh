#!/bin/bash
if [[ ! -d django-dukop ]]; then
	git clone 'https://github.com/localresource/django-dukop.git'
fi

sudo docker build -t django-dukop .
