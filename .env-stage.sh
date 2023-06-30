echo "/* eslint-disable */ window._env_ = {" > ./GPTutor-Frontend/src/env-config.js
awk -F '=' '{ print $1 ": \"" (ENVIRON[$1] ? ENVIRON[$1] : $2) "\"," }' ./.env-frontend-stage >> ./GPTutor-Frontend/src/env-config.js
echo "}" >> ./GPTutor-Frontend/src/env-config.js