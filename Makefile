all: test
	
test:
	npm test	
	
debug:
	npm run debug
	
.PHONY : test debug