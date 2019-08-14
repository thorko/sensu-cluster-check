#!/bin/bash

while getopts "u:p:w:" opt; do
  case "$opt" in
    u)
      username=$OPTARG
      ;;
    p)
      password=$OPTARG
      ;;
    w)
      url=$OPTARG
      ;;
  esac
done

if [ "x$username" == "x" -o "x$password" == "x" -o  "x$url" == "x" ]; then
  echo "Usage: $0 -u <username> -p <password> -w <api url>"
  exit 1
fi

# setup sensuctl
sensuctl configure --username $username --password $password --format tabular --api-url $url -n

r=$(sensuctl cluster health)

if [[ $r =~ /false/ ]]; then
  echo "$r"
  exit 2
else
  echo "Cluster healthy"
  exit 0
fi
