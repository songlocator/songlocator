MODULES = $(shell ls -1 | grep '^songlocator-')
MODULES = \
	songlocator-base \
	songlocator-cli \
	songlocator-api \
	songlocator-soundcloud \
	songlocator-youtube \
	songlocator-exfm \
	songlocator-spotify \
	songlocator-deezer

link: node_modules
	$(foreach mod,$(MODULES), (cd node_modules; ln -fs ../$(mod) .) &&) \
		echo 'completed'

git-status:
	$(foreach mod,$(MODULES), (cd $(mod); git status .) &&) \
		echo 'completed'

node_modules:
	mkdir $<
