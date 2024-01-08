config-mysql:
	sudo mysql/reset_isotop.sh -u isotop_user.json

clean:
	rm -rf $(BUILD_FILES)
