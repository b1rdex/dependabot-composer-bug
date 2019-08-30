
```
docker build -t dependabot-skimmed .
docker run --rm -it -v /REPLACE/PATH:/app dependabot-skimmed bash

cd /app
composer update -v beberlei/assert --no-autoloader --no-scripts --ignore-platform-reqs
```
