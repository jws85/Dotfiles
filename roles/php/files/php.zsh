# Run CLI programs against various PHP versions, using docker
alias php8.0-cli='docker run -it --rm --name php8-lint -v "$PWD":/usr/src/myapp -w /usr/src/myapp php:8.0-cli'
alias php7.2-cli='docker run -it --rm --name php8-lint -v "$PWD":/usr/src/myapp -w /usr/src/myapp php:7.2-cli'
alias php5.6-cli='docker run -it --rm --name php8-lint -v "$PWD":/usr/src/myapp -w /usr/src/myapp php:5.6-cli'
alias php5.3-cli='docker run -it --rm --name php8-lint -v "$PWD":/usr/src/myapp -w /usr/src/myapp php:5.3-cli'
