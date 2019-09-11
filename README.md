# Phalcon Docker

- Phalcon 3.4.4
- PHP 7.1
- Apache

## Web data volume

```yaml
    volumes:
      - ./www:/var/www/html
```

## Build

```bash
$ docker build -t <tag> ./
```

## Push

```bash
$ docker push <tag>
```
