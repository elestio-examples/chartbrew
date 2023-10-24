#!/bin/bash

export REACT_APP_API_HOST=${REACT_APP_API_HOST}
export REACT_APP_CLIENT_HOST=${REACT_APP_CLIENT_HOST}
export REACT_APP_ONE_ACCOUNT_EXTERNAL_ID=${REACT_APP_ONE_ACCOUNT_EXTERNAL_ID}

cd server
NODE_ENV=production nohup node index.js &

cd ../client
mkdir -p dist

if [ -z "$(ls -A dist)" ]; then
  echo "Building the UI. This might take a couple of minutes..."
  npm run build
  echo "UI built successfully!"
  cp -rf build/* dist/
fi

npx serve -s -p 4018 dist
