BUILD_DIR	:= build

LATEX 		:= pdflatex
LATEXFLAGS 	:= -halt-on-error -output-directory=$(BUILD_DIR)

SHOW 		:= zathura
SHOWFLAGS 	:=

DEPS		:= preamble.tex
SRC 		:= target.tex
TARGET 		:= target

all: $(BUILD_DIR)/$(TARGET).pdf

$(BUILD_DIR)/$(TARGET).pdf: $(SRC) $(DEPS)
	mkdir -p $(BUILD_DIR)
	$(LATEX) $(LATEXFLAGS) -jobname="$(TARGET)" $(SRC)

show: $(BUILD_DIR)/$(TARGET).pdf
	$(SHOW) $(SHOWFLAGS) $(BUILD_DIR)/$(TARGET).pdf

.PHONY: clean

clean:
	rm -rf $(BUILD_DIR)
