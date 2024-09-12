# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkondo <tkondo@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/13 00:20:00 by tkondo            #+#    #+#              #
#    Updated: 2024/09/13 00:48:00 by tkondo           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

IMG = 42tokyo-clang-env
DIR = $(CURDIR)
BASHRC = $(DIR)/home/.bashrc
DOCKERFILE = $(DIR)/Dockerfile
OPT_FLG = 

ifdef NO_CACHE
OPT_FLG += --no-cache
endif

build: warpify #init docker image
	docker build $(OPT_FLG) --platform linux/amd64 -f $(DOCKERFILE) -t $(IMG) .
	@make add-alias

warpify: #add setting for warp
	@if [[ "$$TERM_PROGRAM" == "WarpTerminal" ]]; then \
	  grep "SourcedRcFileForWarp" $(BASHRC) >/dev/null || \
	  echo "printf '\\eP\$$f{\"hook\": \"SourcedRcFileForWarp\", \"value\": { \"shell\": \"bash\"}}\\x9c'" >> $(BASHRC); \
	fi

add-alias: #'42env' to start container anywhere
	@grep "# 42env" ~/.zshrc >/dev/null || \
	echo '# 42env\nalias 42env="'$(DIR)'/run.sh"\n' >> ~/.zshrc

rmi: #remove image
	@docker rmi $(IMG)

re: #build without cache
	@make NO_CACHE=1
