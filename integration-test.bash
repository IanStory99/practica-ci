# !/bin/bash
export NODE_ENV=test
npm run build
node dist/server.js &
curl --head -X GET --retry 5 --retry-connrefused --retry-delay 2 http://localhost:3000
