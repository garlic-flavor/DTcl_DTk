## MACRO
TARGET = demo.exe
AUTHORS = KUMA
LICENSE = CC0
VERSION = UC

MAKEFILE = Makefile
DC = dmd
MAKE = make
TO_COMPILE = demo.d src\dtcl\binding\functions.d src\dtcl\binding\loader.d src\dtcl\binding\package.d src\dtcl\binding\types.d src\dtcl\package.d src\dtcl\util.d src\dtk\binding\functions.d src\dtk\binding\loader.d src\dtk\binding\package.d src\dtk\binding\types.d src\dtk\package.d src\dtk\util.d src\sworks\base\loader.d src\sworks\base\malloc.d
TO_LINK = demo.obj src\dtcl\binding\functions.obj src\dtcl\binding\loader.obj src\dtcl\binding\package.obj src\dtcl\binding\types.obj src\dtcl\package.obj src\dtcl\util.obj src\dtk\binding\functions.obj src\dtk\binding\loader.obj src\dtk\binding\package.obj src\dtk\binding\types.obj src\dtk\package.obj src\dtk\util.obj src\sworks\base\loader.obj src\sworks\base\malloc.obj
COMPILE_FLAG = -m64 -Isrc
LINK_FLAG = -m64
EXT_LIB =
DDOC_FILE = doc\src\main.ddoc
DOC_FILES = demo.html src\dtcl\binding\functions.html src\dtcl\binding\loader.html src\dtcl\binding\package.html src\dtcl\binding\types.html src\dtcl\package.html src\dtcl\util.html src\dtk\binding\functions.html src\dtk\binding\loader.html src\dtk\binding\package.html src\dtk\binding\types.html src\dtk\package.html src\dtk\util.html src\sworks\base\loader.html src\sworks\base\malloc.html
DOC_HEADER = doc\src\header.txt
DOC_FOOTER = doc\src\footer.txt
DOC_TARGET = doc/index.html
FLAG =

## LINK COMMAND
$(TARGET) : $(TO_LINK) $(EXT_LIB)
	$(DC) -g $(LINK_FLAG) $(FLAG) -of$@ $**

## COMPILE RULE
.d.obj :
	$(DC) -c -g -op -debug $(COMPILE_FLAG) $(FLAG) $<

## DEPENDENCE
$(TO_LINK) : $(MAKEFILE) $(EXT_LIB)
demo.obj : src\dtcl\binding\functions.d src\dtcl\util.d src\dtk\util.d src\dtk\package.d src\sworks\base\malloc.d src\sworks\base\loader.d src\dtcl\binding\types.d src\dtk\binding\loader.d src\dtk\binding\types.d src\dtk\binding\functions.d src\dtcl\package.d demo.d src\dtcl\binding\loader.d src\dtcl\binding\package.d src\dtk\binding\package.d
src\dtcl\binding\functions.obj : src\dtcl\binding\functions.d src\dtcl\binding\types.d
src\dtcl\binding\loader.obj : src\dtcl\binding\loader.d src\dtcl\binding\functions.d src\dtcl\binding\types.d src\sworks\base\loader.d
src\dtcl\binding\package.obj : src\dtcl\binding\functions.d src\dtcl\binding\loader.d src\dtcl\binding\types.d src\dtcl\binding\package.d src\sworks\base\loader.d
src\dtcl\binding\types.obj : src\dtcl\binding\types.d
src\dtcl\package.obj : src\dtcl\binding\functions.d src\dtcl\util.d src\sworks\base\malloc.d src\sworks\base\loader.d src\dtcl\binding\types.d src\dtcl\package.d src\dtcl\binding\loader.d src\dtcl\binding\package.d
src\dtcl\util.obj : src\dtcl\util.d src\dtcl\binding\functions.d src\sworks\base\malloc.d src\sworks\base\loader.d src\dtcl\binding\types.d src\dtcl\binding\loader.d src\dtcl\binding\package.d
src\dtk\binding\functions.obj : src\dtcl\binding\functions.d src\dtk\binding\types.d src\dtk\binding\functions.d src\dtcl\binding\types.d
src\dtk\binding\loader.obj : src\dtcl\binding\functions.d src\sworks\base\loader.d src\dtcl\binding\types.d src\dtk\binding\loader.d src\dtk\binding\types.d src\dtk\binding\functions.d src\dtcl\binding\loader.d
src\dtk\binding\package.obj : src\dtcl\binding\functions.d src\sworks\base\loader.d src\dtcl\binding\types.d src\dtk\binding\loader.d src\dtk\binding\types.d src\dtk\binding\functions.d src\dtcl\binding\loader.d src\dtk\binding\package.d
src\dtk\binding\types.obj : src\dtk\binding\types.d src\dtcl\binding\types.d
src\dtk\package.obj : src\dtcl\binding\functions.d src\dtcl\util.d src\dtk\util.d src\dtk\package.d src\sworks\base\malloc.d src\sworks\base\loader.d src\dtcl\binding\types.d src\dtk\binding\loader.d src\dtk\binding\types.d src\dtk\binding\functions.d src\dtcl\package.d src\dtcl\binding\loader.d src\dtcl\binding\package.d src\dtk\binding\package.d
src\dtk\util.obj : src\dtcl\binding\functions.d src\dtcl\util.d src\dtk\util.d src\sworks\base\malloc.d src\sworks\base\loader.d src\dtcl\binding\types.d src\dtk\binding\loader.d src\dtk\binding\types.d src\dtk\binding\functions.d src\dtcl\package.d src\dtcl\binding\loader.d src\dtcl\binding\package.d src\dtk\binding\package.d
src\sworks\base\loader.obj : src\sworks\base\loader.d
src\sworks\base\malloc.obj : src\sworks\base\malloc.d

## PHONY TARGET
debug-all :
	$(DC) -g -debug -of$(TARGET) $(COMPILE_FLAG) $(LINK_FLAG) $(TO_COMPILE) $(EXT_LIB) $(FLAG)
release :
	$(DC) -release -O -inline -of$(TARGET) $(COMPILE_FLAG) $(LINK_FLAG) $(TO_COMPILE) $(EXT_LIB) $(FLAG)
clean :
	del $(TARGET) $(TO_LINK)
clean_obj :
	del $(TO_LINK)
vwrite :
	vwrite --setversion "$(VERSION)" $(TO_COMPILE)
ddoc :
	$(DC) -c -o- -op -D $(COMPILE_FLAG) $(DDOC_FILE) $(TO_COMPILE) $(FLAG)
	@type $(DOC_HEADER) $(DOC_FILES) $(DOC_FOOTER) > $(DOC_TARGET) 2>nul
	@del $(DOC_FILES)
show :
	@echo ROOT = demo.d
	@echo TARGET = $(TARGET)
	@echo VERSION = UC
run :
	$(TARGET) $(FLAG)
edit :
	emacs $(TO_COMPILE)
remake :
	amm -m64 demo.d v=UC authors=KUMA license=CC0 .\doc\src\main.ddoc dd\doc doch=doc\src\header.txt docf=doc\src\footer.txt $(FLAG)

debug :
	ddbg $(TARGET)

## generated by amm.
readme :
	dmd -c -o- -D -DfREADME.md -version=README demo.d doc\src\readme.ddoc
