#!/bin/bash

# 実行権限付与のコマンド
# chmod +x run_mysql_script.sh

# 実行コマンド
# ./run_mysql_script.sh

# MySQL接続情報
DB_HOST="localhost"
DB_PORT="3306"
DB_USER="root"
DB_PASSWORD="fEeqsTech"

# スクリプトの実行
echo "Creating tables..."
docker exec -i feeps-db-1 mysql -h$DB_HOST -P$DB_PORT -u$DB_USER -p$DB_PASSWORD < run_mysql_script/init_tables.sql

echo "Inserting data..."
docker exec -i feeps-db-1 mysql -h$DB_HOST -P$DB_PORT -u$DB_USER -p$DB_PASSWORD < run_mysql_script/insert_data.sql

echo "Views data..."
docker exec -i feeps-db-1 mysql -h$DB_HOST -P$DB_PORT -u$DB_USER -p$DB_PASSWORD < run_mysql_script/views_data.sql


echo "Done!"
