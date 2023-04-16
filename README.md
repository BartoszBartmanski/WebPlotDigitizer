
# WebPlotDigitizer

Docker image for WebPlotDigitizer app from <https://github.com/ankitrohatgi/WebPlotDigitizer>.

To build:
```
docker build -t bartoszbartmanski/webplotdigitizer:4.6 -f Dockerfile .
```

To run this container:
```
docker run -it --rm -p 8080:8080 localhost/webplotdifitizer:latest
```
