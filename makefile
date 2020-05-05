

operation:

	@shc -f ./2fa.bash
	@mv ./2fa.bash.x 2fa
	@rm 2fa.bash.x.c
	@sudo mv ./2fa /usr/bin
	@echo  "\e[32mBuild successful.\e[0m"
