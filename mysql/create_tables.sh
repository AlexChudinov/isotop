#!/bin/bash
# Создание первичных таблиц с элементами

SCRIPT_DIR=$(dirname $0)

python3 -m venv $SCRIPT_DIR/venv

PYTHON3=$SCRIPT_DIR/venv/bin/python3
PIP3=$SCRIPT_DIR/venv/bin/pip3

$PIP3 install pandas==2.1.3

$PYTHON3 $SCRIPT_DIR/load_table.py --out $SCRIPT_DIR/out.sql

mysql < $SCRIPT_DIR/isotop_table.sql
mysql < $SCRIPT_DIR/out.sql

rm -rf $SCRIPT_DIR/venv $SCRIPT_DIR/out.sql
