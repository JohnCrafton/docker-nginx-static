# docker-nginx-static

This image contains the standard configuration of nginx for running static html/content sites on my swarm.

Baked into the image is a standard error page which displays in the event one is not included in any volume mounted to `/var/www/html`.

The server listens on port `9001`, so map external ports accordingly.