# Use case
Run in `Docker` using `docker-compose`.

https://docs.docker.com/engine/install/

https://pypi.org/project/docker-compose/

We are assuming you are using a UNIX type system, Linux (preferred) or MacOSX (may run slowly).

If you're trying to do this in Windows, we can't offer *any* support, sorry!


## Docker use
We can use the docker mecanisme in order to use the developped system. You have to run the following command:
```bash
docker-compose up
```


## Test application
In order to test the application you have to use software like "Postman", "Swagger UI." or other software for API/ReST Development tools.

You have to call the page http://127.0.0.1:8000 with the following body (of course you can change data inside)
```json
    {
        "id": 2,
        "type": "cardboard",
        "locked": true,
        "height": 100,
        "width": 80,
        "depth": 5,
        "contents": "Foods",
        "origin": {
            "line1": "My line One",
            "line2": "My line Two",
            "city": "Marseille",
            "state": "BdR",
            "postal_code": "13008",
            "country": "FRA"
        }
    }
```
In the header don't forget to insert the ```content-type: application/json```

As there is no authentication all data will be inserted very quickly.

In order to test the system charge, you can create some tests in "Postman" or other software. 
