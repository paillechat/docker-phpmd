# Docker image for `phpmd`

[![](https://img.shields.io/docker/pulls/paillechat/docker-phpmd.svg)](https://hub.docker.com/r/paillechat/docker-phpmd)
[![License](https://img.shields.io/badge/license-MIT-%233DA639.svg)](https://opensource.org/licenses/MIT)

View **[Dockerfile](https://github.com/paillechat/docker-phpmd/blob/main/Dockerfile)** on GitHub.

[Docker hub](https://hub.docker.com/r/paillechat/docker-phpmd)

Tiny Alpine-based multistage-builld dockerized version of [phpmd](https://github.com/phpmd/phpmd).

## Docker mounts

The working directory inside the Docker container is **`/app/`** and should be mounted locally to
the root of your project.

## Usage

### Basic
```bash
$ docker run --rm -v $(pwd):/app paillechat/docker-phpmd:8-2.13 src text cleancode

/app/src/Foo/Bar/OfferSync.php:47        UndefinedVariable  Avoid using undefined variables such as '$parameters' which will lead to PHP notices.
/app/src/Foo/Bar/OfferSync.php:104       StaticAccess       Avoid using static access to class '\App\Boo\Bar' in method 'updateVariantLogisticClassMetadata'.
```

## License

**[MIT License](LICENSE)**