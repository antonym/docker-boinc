# docker-boinc

Simple docker image for running Rosetta on BOINC

Build the image:

```
docker build -t antonym/boinc .
```

Run the image, setting the boincurl and boinckey:
```
docker run -ti -d --name boinc -e “boincurl=http://boinc.bakerlab.org/rosetta” -e “boinckey=insert_insecure_key_here" antonym/boinc
```
