DIR = srcs
MAKE = make --no-print-directory
DCK_EXEC = /usr/bin/docker

all:
	@echo up: for compose up
	@echo upd: for compose up with detach mode
	@echo down: for compose down
	@echo im: display all images
	@echo vol: display all volumes
	@echo cont: display all containers
	@echo clean: delete all containers
	@echo fclean: delete all containers and all images

up:
	@cd $(DIR) && $(DCK_EXEC) compose up

upd:
	@cd $(DIR) && $(DCK_EXEC) compose up -d

down:
	@cd $(DIR) && $(DCK_EXEC) compose down

im:
	@$(DCK_EXEC) images

cont:
	@$(DCK_EXEC) ps -a

vol:
	@$(DCK_EXEC) volume ls

clean:
	@$(DCK_EXEC) container prune -f 1> /dev/null

fclean: clean
	@$(DCK_EXEC) images --format "{{.Repository}}" | awk '{print $1}' | xargs -I {} docker rmi {} 1> /dev/null
