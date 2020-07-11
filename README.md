# nocIstrazivaca2019

### Prerequisites

What things you need to install the software and how to install them

```
PHP, MySQL, Composer, NPM or Yarn
```

### Installing API

A step by step series of examples that tell you how to get a development env running

Install dependencies from composer.json

```
composer install
```

Edit your .env file with correct values
```
edit mysql parameters
```

Setup Database

```
php bin/console doctrine:database:create
php bin/console doctrine:migrations:migrate
```

Finally run dev server
```
php bin/console s:r
```
