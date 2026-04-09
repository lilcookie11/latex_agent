MAIN=main
BUILD_DIR=build

.PHONY: pdf clean status

pdf:
	latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=$(BUILD_DIR) $(MAIN).tex

clean:
	latexmk -C -outdir=$(BUILD_DIR)
	rm -rf $(BUILD_DIR)

status:
	git status --short

