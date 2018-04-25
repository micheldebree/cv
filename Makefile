################
# Docker Image #
################
NAMESPACE=micheldebree
ARTIFACT=cv
VERSION=1.0.0
IMAGE=micheldebree/cv

build: image
	docker run --rm -v "$$PWD":/home $(IMAGE)

# Build Docker image
image: Dockerfile
	docker build -t $(IMAGE) .

# Run a shell in the docker container, useful for debugging
debug: image
	docker run -it --rm -v "$$PWD":/home --entrypoint /bin/bash $(IMAGE)

#################
# Build targets #
#################

.PHONY: all
.PRECIOUS: Photo.jpg

FILENAME_BASE=CV-Michel_de_Bree

%.docx: src/%.md src/Template.docx Photo.jpg
	pandoc -s --smart --reference-docx=src/Template.docx -o $@ $< 

%.pdf: src/%.md src/Template.tex Photo.jpg
	pandoc $< -s --smart --template=src/Template.tex --variable fontsize=11pt -o $@

%.jpg: src/%.jpg
	cp $< $@

all: README.md $(FILENAME_BASE).EN.docx $(FILENAME_BASE).EN.pdf $(FILENAME_BASE).NL.docx $(FILENAME_BASE).NL.pdf

README.md: src/$(FILENAME_BASE).EN.md
	cp $< $@

clean:
	rm -f *.docx
	rm -f *.pdf
	rm -f *.jpg
	rm -f *.md
