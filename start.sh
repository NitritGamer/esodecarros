#!/bin/bash
# Servir la carpeta deploy usando static-server
npm install -g static-server
static-server ./deploy --port $PORT
