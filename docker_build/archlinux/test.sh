docker run -d --name gui_test $1 
docker exec gui_test pacman --version