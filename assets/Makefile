all: assets

assets:
	mkdir -p ./build/css ./build/js ./build/images
	coffee -o ./build/js --compile js/*.coffee
	node-sass -o ./build/css --indent-width=2 --indent-type=space --output-style=expanded css/*.scss

install: assets
	cp -rp ./build/js/* /srv/www/js
	cp -rp ./build/css/* /srv/www/css
	cp -rp ./build/images/* /srv/www/images

clean:
	rm -rf ./build
