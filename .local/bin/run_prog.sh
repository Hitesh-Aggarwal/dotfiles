#!/bin/sh

PROG=$1

JAVA() {
	CLASS="${1%.java}"
	javac -d classes "$1"
	java -cp classes "$CLASS"
}

C() {
	if [ -f "Makefile" ] || [ -f "makefile" ]; then
		echo "make"
		make
	else
		FILE=/tmp/$(basename "${1%.c}")
		gcc -O3 -Wall "$1" -o "$FILE"
		if [ -f "$FILE" ]; then
			"$FILE"
			command rm "$FILE"
		fi
	fi
}

CPP() {
	if [ -f "Makefile" ] || [ -f "makefile" ]; then
		echo "make"
		make
	else
		FILE=/tmp/$(basename "${1%.cpp}")
		g++ -O3 -Wall "$1" -o "$FILE"
		if [ -f "$FILE" ]; then
			"$FILE"
			command rm "$FILE"
		fi
	fi
}

case "$PROG" in
*.c)
	C "$PROG"
	;;
*.cpp)
	CPP "$PROG"
	;;
*.py)
	python3 "$PROG"
	;;
*.java)
	JAVA "$PROG"
	;;
*.js)
	node "$PROG"
	;;
*.lua)
	lua "$PROG"
	;;
*.sh)
	bash "$PROG"
	;;
*.bash)
	bash "$PROG"
	;;
*.zsh)
	zsh "$PROG"
	;;
*)
	echo "Can't run file"
	exit
	;;
esac
