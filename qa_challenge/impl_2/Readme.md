# buyCo test project
## Usage
Start server :

```shell
docker-compose up --build
# Wait while initialization
```

## Api
### Get boxes
```shell
curl --location --request GET 'http://localhost:3000/api/boxes'
```

### Create box
```shell
curl --location --request POST 'http://localhost:3000/api/boxes' \
--header 'Content-Type: application/json' \
--data-raw '{
            "type": "metal",
            "locked": true,
            "height": 100,
            "width": 150,
            "depth": 200,
            "contents": "Super value",
            "origin": {
                "line1": "Alée des lauriers",
                "line2": "Impasse",
                "city": "Marseille",
                "state": "Bouches du rhône",
                "postal_code": "13000",
                "country": "fra"
            }
        }'
```

### Get metal count
```shell
curl --location --request GET 'http://localhost:3000/api/box_types_counters'
```