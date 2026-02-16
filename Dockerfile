FROM alpine:latest

RUN apk add --no-cache curl bash

CMD ["sh", "-c", "curl -sSf https://lets.tunshell.com/init.sh | sh -s -- T IBBQ7VRI2WaW8rEbaDwKI4 Sdq7Dc5cVfu4lfcgkBdhYJ eu.relay.tunshell.com"]
