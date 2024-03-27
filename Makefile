#=-=-=-=-=-=-=- COLORS DEFINITION =-=-=-=-=-=-=-=-=-#

DEL_LINE		=	\033[2K
ITALIC			=	\033[3m
BOLD			=	\033[1m
DEF_COLOR		=	\033[0;39m
GRAY			=	\033[0;90m
RED			=	\033[0;91m
GREEN			=	\033[0;92m
YELLOW			=	\033[0;93m
BLUE			=	\033[0;94m
MAGENTA			=	\033[0;95m
CYAN			=	\033[0;96m
WHITE			=	\033[0;97m
BLACK			=	\033[0;99m
ORANGE			=	\033[38;5;209m
BROWN			=	\033[38;2;184;143;29m
DARK_GRAY		=	\033[38;5;234m
MID_GRAY		=	\033[38;5;245m
DARK_GREEN		=	\033[38;2;75;179;82
DARK_YELLOW		=	\033[38;5;143m

DIR = srcs
MAKE = make --no-print-directory
DCK_EXEC = /usr/bin/docker

all:
	@echo "$(YELLOW)"
	@echo up: for compose up
	@echo upd: for compose up with detach mode
	@echo down: for compose down
	@echo im: display all images
	@echo vol: display all volumes
	@echo cont: display all containers
	@echo clean: delete all containers
	@echo fclean: delete all containers and all images
	@echo "$(DEF_COLOR)"

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
	@echo "$(GREEN)Containers deleted!"
	@$(DCK_EXEC) images --format "{{.Repository}}" | awk '{print $1}' | xargs -I {} docker rmi {} 1> /dev/null
	@echo "Images deleted!$(DEF_COLOR)"
	@$(DCK_EXEC) volume rm -f srcs_mariadb 1> /dev/null
	@$(DCK_EXEC) volume rm -f srcs_wordpress 1> /dev/null

fclean: clean
	@$(DCK_EXEC) builder prune -f

.PHONY: all up upd down im cont vol clean fclean

#	@sudo rm -rf ~/data/mariadb/*
#	@sudo rm -rf ~/data/wordpress/*
