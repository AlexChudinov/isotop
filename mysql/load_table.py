from os import path
from argparse import ArgumentParser

import pandas as pd

argparser = ArgumentParser(description="Скрипт для создания первичных, элементарных SQL таблиц")
argparser.add_argument("--out", type=str, help="Файл, куда выводим команды для создания первичных таблиц", required=True)

args = argparser.parse_args()

_SCRIPT_PATH = path.dirname(path.abspath(__file__))

# Источник таблицы: "https://dpva.ru/Guide/GuideChemistry/PeriodicalMendeleevTable/IsotopiAbundance1/"
# Ниже, видимо, оригинальная ссылка: "Ted Pella Inc, USA - продукты для микроскопии"

def parse_element(el: str):
    name = ''.join(filter(str.isalpha, el))
    id = ''.join(filter(str.isdigit, el))
    return name, id

df = pd.read_csv(_SCRIPT_PATH + "/isotop_table.csv")
df['isotop'] = df['isotop'].apply(parse_element)
df['name'], df['isotop_id'] = df['isotop'].apply(lambda x: f'"{x[0]}"'), df['isotop'].apply(lambda x: x[1])

print("Длина таблицы до удаления пустых строк: ", len(df))
print("Эти строки будут удалены: \n", df[df['isotop_id'] == ''])

df.drop(df[df['isotop_id'] == ''].index, inplace=True)
df.drop(columns=['isotop'], inplace=True)

print(f"Длина таблицы после удаления: {len(df)}\n", df.head())

df['queries'] = "INSERT INTO `distribution` VALUES ("\
    + df[['name', 'isotop_id', 'mass', 'abundance']].agg(','.join, axis=1)\
    + ",@current_table_id);\n"

bruttos = set(df['name'].values)

print("Создание таблицу изотопов...")
with open(args.out, "w") as file:
    file.write('USE `isotop`;\n')
    file.write('INSERT INTO `isotop_tables` (`source`,`mass_accuracy`,`abundance_accurace`) '
               'VALUES ("https://dpva.ru/Guide/GuideChemistry/PeriodicalMendeleevTable/IsotopiAbundance1/",1e-7,1e-5);\n')
    file.write('SELECT @current_table_id := id FROM isotop_tables '
               'WHERE `source`="https://dpva.ru/Guide/GuideChemistry/PeriodicalMendeleevTable/IsotopiAbundance1/";\n')
    df['queries'].apply(lambda x: file.write(x))

print("Создание таблицы брутто-формул")
with open(args.out, "a") as file:
    for formula in bruttos:
        file.write(f'INSERT INTO `composition` VALUES ({formula}, {formula}, 1, @current_table_id);\n')
