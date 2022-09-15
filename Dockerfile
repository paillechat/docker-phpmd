ARG PHP
FROM php:${PHP} as production
LABEL \
	maintainer="paillechat <paillechat@gmail.com>" \
	repo="https://github.com/paillechat/docker-phpmd"

COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer
ENV PATH="${PATH}:/root/.composer/vendor/bin"

ARG PHPMD=@stable
RUN composer global require phpmd/phpmd:${PHPMD}

WORKDIR /app

ENTRYPOINT ["phpmd"]
CMD ["--version"]