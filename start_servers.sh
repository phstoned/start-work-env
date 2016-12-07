#! /bin/bash
gnome-terminal --working-directory=/home/zh/dev/prod/magtuner/magtuner-api --tab --title="api" -e 'bash -c "export BASH_POST_RC=\"rails server\"; exec bash"';
gnome-terminal --working-directory=/home/zh/dev/prod/magtuner/magtuner-frontend --tab --title="frontend" -e 'bash -c "export BASH_POST_RC=\"ember server\"; exec bash"';
gnome-terminal --working-directory=/home/zh/dev/prod/magtuner/cooltext --tab --title="cooltext" -e 'bash -c "export BASH_POST_RC=\"webpack-dev-server --hot\"; exec bash"';
