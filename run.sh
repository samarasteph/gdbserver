

if [ $# -gt 0 ]; then
	VOLUME="$1:/project"
else
	echo Please give path of volume to be mounted
	exit 1
fi

if [ $# -gt 1 ]; then
	NAME="--name $2"
else
	NAME=""
fi
docker run --rm -it -v $VOLUME $NAME albertdupre/gdbserver:latest
