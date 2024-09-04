#!/bin/bash


if [[ $1 == "-h" || $1 == "--help" ]]; then

cat << EOF
Использование: ./reset_isotop.sh [OPTION]
Инициализирует MySQL базу данных isotop (!!!сбрасывая все, что там было до этого)
    -h                    Показывает это сообщение
    -u, --user-out <file> Сохраняет пользователя базы в файл
EOF
exit 0

elif [[ $1 == "-u" || $1 == "--user-out" ]]; then

  USEROUT=$2

fi

SCRIPT_DIR=$(dirname $0)
python3 -m venv $SCRIPT_DIR/venv
PYTHON3=$SCRIPT_DIR/venv/bin/python3
PIP3=$SCRIPT_DIR/venv/bin/pip3

getRandom() {
  echo `tr -dc A-Za-z0-9 </dev/urandom | head -c $1; echo ''`
}

$PIP3 install pandas==2.1.3
$PYTHON3 $SCRIPT_DIR/load_table.py --out $SCRIPT_DIR/out.sql
mysql < $SCRIPT_DIR/isotop_table.sql
mysql < $SCRIPT_DIR/out.sql


USER=isotop_all
HOST=localhost
PASSWORD=$(getRandom 128)
DATABASE=isotop


if [ ! -z $USEROUT ]; then

cat << EOF > $USEROUT
{
  "user": "${USER}",
  "host": "${HOST}",
  "password": "${PASSWORD}",
  "database": "${DATABASE}"
}
EOF

fi


cat << EOF > $SCRIPT_DIR/mysql_user.sql
DROP USER IF EXISTS '${USER}'@'${HOST}';
CREATE USER '${USER}'@'${HOST}' IDENTIFIED BY '${PASSWORD}';
GRANT INSERT, SELECT, DELETE, UPDATE ON ${DATABASE}.* TO '${USER}'@'${HOST}';
EOF

mysql < $SCRIPT_DIR/mysql_user.sql

rm -rf $SCRIPT_DIR/venv $SCRIPT_DIR/out.sql $SCRIPT_DIR/mysql_user.sql
