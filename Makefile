JEKYLL=bundle exec jekyll

all:
	$(JEKYLL) build
serve:
	$(JEKYLL) serve

clean:
	rm -rf _site/*
