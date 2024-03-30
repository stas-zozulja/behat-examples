#!/usr/bin/env bash
until $(curl --output /dev/null --silent --head --fail http://localhost:4444); do
echo "Waiting for Selenium Hub being started ..."
sleep 1
done