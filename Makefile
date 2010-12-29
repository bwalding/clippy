HAXE_LIBRARY_PATH=/usr/lib/haxe/std

all: library.swf build/clippy.swf

clean:
	rm -f library.swf build/clippy.swf

library.swf: library.xml
	swfmill simple library.xml library.swf

build/clippy.swf: library.swf Clippy.hx
	HAXE_LIBRARY_PATH=${HAXE_LIBRARY_PATH} haxe compile.hxml
	echo build/clippy.swf now built
