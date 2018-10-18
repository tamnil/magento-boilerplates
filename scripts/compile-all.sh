#!/bin/sh

rm -rf var/di/* var/generation/* var/cache/* var/log/* var/page_cache/* var/session/* var/view_preprocessed/* pub/static/*
php bin/magento setup:upgrade
php bin/magento setup:db-schema:upgrade
php bin/magento setup:di:compile
php bin/magento setup:static-content:deploy
php bin/magento indexer:reindex
php bin/magento cache:clean
php bin/magento cache:flush
