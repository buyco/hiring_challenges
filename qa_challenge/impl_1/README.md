# Use case
Run in `Docker` using `docker-compose`.

## Docker use
We can use the docker mecanism in order to use the developped system. You have to run the following command:
```bash
docker-compose up
```


## Test application

You have to call the page http://127.0.0.1:8000/ with the following body (of course you can change data inside)

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
