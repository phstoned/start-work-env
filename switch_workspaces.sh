#! /bin/bash
# globals
USER_INPUT_RES = false;


function start_mt {
	google-chrome & disown;
	sleep 2;
	wmctrl -s 1;
	sleep 3;
	gnome-terminal --working-directory=/home/zh/dev/prod/magtuner/magtuner-frontend --title="front-dev";
	atom ~/dev/prod/magtuner/magtuner-frontend
	sleep 3;
	wmctrl -s 2;
	sleep 4;
	atom ~/dev/prod/magtuner/magtuner-api
	gnome-terminal --working-directory=/home/zh/dev/prod/magtuner/magtuner-api --title="api-dev"
	sleep 4;
	wmctrl -s 3; 
	sleep 3;
	# startprod alias for start_servers.sh
	gnome-terminal --working-directory=/home/zh/ --title="close_me" -e 'bash -c "export BASH_POST_RC=\"startprod\"; exec bash"';
}

function user_input {
	echo 'should I not run the script to start mt env?'
	read -t 10 not_run
	is_empty_string $not_run
}

function is_empty_string {
	whitespace=$(printf '\n\t ');
	res=false;
	case $1 in
		*[!$whitespace]*) USER_INPUT_RES=true;;
		*) USER_INPUT_RES=false;;
	esac
}

function run_mt_env {
echo $USER_INPUT_RES
	if [ $USER_INPUT_RES = true ] ;
		then
			echo 'interrupt setting mt_env';
			echo 'exiting';
			exit 0;
		else	
			start_mt;
			exit 0;
	fi
}

user_input
run_mt_env
exit
