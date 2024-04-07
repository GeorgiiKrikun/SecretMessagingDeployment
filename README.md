## Secret messaging

### Structure
This is the project that allows to hide the information in messages from plain sight using the invisible Unicode characters `\u200C` and `\u200D`.
It consists of two submodules:

1. [Secret messaging Backend](https://github.com/GeorgiiKrikun/SecretMessagingBackEnd) - WASM C++ binary that defines the encode and decode routines. They take the string as an input and convert its binary unicode represention into a new string that consists of `\u200C` as a logical `1` and `\u200D` as a logical `0`.
2. [Secret messaging Frontend](https://github.com/GeorgiiKrikun/SecretMessaging) - Django program that just serves HTML's, CSS, WASM and JS files.
3. This repo - deployment, used to host the whole app as a website.

### Example
Example: secret message resides right here.‍‌‌‍‌‌‍‌‌‌‌‌‌‍‌‌‌‌‍‍‌‍‍‌‍‌‌‍‌‍‍‌‍‍‌‍‌‍‍‌‍‌‍‌‌‍‍‌‌‌‌‌‌‍‌‌‌‌‍‌‍‍‍‌‍‍‍‍‌‍‍‌‌‌‌‌‌‍‌‌‌‌‌‍‌‍‍‌‍‌‍‌‍‍‍‌‍‍‍‌‌‍‍‌‌‌‌‌‌‍‌‌‌‌‌‍‌‍‍‌‍‌‍‌‌‍‍‌‌‌‍‌‌‍‍‌‍‍‍‌‌‍‍‌‍‌‍‌‌‍‍‌‌‌‌‍‌‍‍‌‍‍‍‍‌‍‍‌‍‍‍‌‌‍‍‌‍‍‌‌‍‍‍‌

To decode it, you can use the hosted website - [pleasehide.it](https://pleasehide.it). Select "Reveal secret" and you will be able to decode the secret message.

### Deployment
Deployment consists of:
* Containerised Django application, with Uvicorn as an ASGI server. It also collects the static files to be later served by NGinx.
* Backend builder, that builds the required WASM binary and JS bindings. The resulting files are then mounted into the Django application container as static files.
* NGinx builder, that acts as a HTTP/HTTPS reverse proxy to the Django app. It also serves the static files to the user. I use Let's Encrypt to create HTTPS certificates.
