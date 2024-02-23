DIR = srcs
DCK_EXEC = /usr/bin/docker

up:
	@cd $(DIR) && $(DCK_EXEC) compose up

upd:
	@cd $(DIR) && $(DCK_EXEC) compose up -d

down:
	@cd $(DIR) && $(DCK_EXEC) compose down

clean:
	$(DCK_EXEC) images --format "{{.Repository}}" | awk '{print $1}' | xargs -I {} docker rmi {}
