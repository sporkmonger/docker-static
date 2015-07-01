all: assets

assets:
	mkdir -p ./.build/css ./.build/js ./.build/images
	coffee -o ./.build/js --compile js/*.coffee
	# Using app.css instead of sending directly to ./.build/ gives a more
	# useful source map.
	sass --scss --sourcemap=none --line-numbers --style=expanded -r sass-globbing --trace css/main.scss app.css
	mv app.css* ./.build/css/
	pngcrush -brute -d ./.build/images/ images/*.png
	cp -rp images/*.jpg ./.build/images/ || :
	cp -rp images/*.jpeg ./.build/images/ || :
	cp -rp images/*.gif ./.build/images/ || :
	cp -rp images/*.svg ./.build/images/ || :
	cp -rp fonts/* ./.build/fonts/ || :

install: assets
	cp -rp ./.build/js/* /srv/www/js
	cp -rp ./.build/css/* /srv/www/css
	cp -rp ./.build/images/* /srv/www/images
	cp -rp ./.build/fonts/* /srv/www/fonts

clean:
	rm -rf ./.build
