all: assets

assets:
	mkdir -p ./build/css ./build/js ./build/images
	coffee -o ./build/js --compile js/*.coffee
	node-sass -o ./build/css --indent-width=2 --indent-type=space --output-style=expanded css/*.scss
	pngcrush -brute -d ./build/images/ images/*.png
	cp -rp images/*.jpg ./build/images/ || :
	cp -rp images/*.jpeg ./build/images/ || :
	cp -rp images/*.gif ./build/images/ || :
	cp -rp images/*.svg ./build/images/ || :

install: assets
	cp -rp ./build/js/* /srv/www/js
	cp -rp ./build/css/* /srv/www/css
	cp -rp ./build/images/* /srv/www/images

clean:
	rm -rf ./build
