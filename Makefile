config-mysql:
	sudo mysql/reset_isotop.sh -u isotop_user.json

parser-build:
	cd parser && $(MAKE) build

parser-config-test-data:
	sudo mysql/reset_isotop.sh -u parser/tests/data/isotop_user.json

parser-test:
	cd parser && $(MAKE) test

clean:
	rm -rf $(BUILD_FILES)
	cd parser && $(MAKE) clean
