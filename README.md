# Гистограмма встречаемости изотопных форм по брутто-формуле


Здесь присутствует набор программ-скриптов, который в перспективе позволяет создать и запустить свой собственный сервис ~~с блэкджеком и шлю~~ для генерации изотопных форм по заданной брутто-формуле. Нечто подобное тому, что уже сейчас можно найти [тут](https://www.sisweb.com/mstools/isotope.htm), [тут](https://alchemistmatt.com/MwtHelp/IsotopicDistribution.htm), [тут](https://envipat.eawag.ch/), а также в куче других мест, включая поиск на самом [`github.com`](https://github.com/search?q=isotopic%20distribution&type=repositories). Поэтому у автора есть полное осознание того, что, конкретно, в этом репозитории не будет ничего нового, ибо все новое - это просто хорошо забытое старое. Или даже просто тихо скопипизженное не забытое старое. Или даже просто тихо скопипизженное настоящее. Или даже просто очень-очень тихо...


# Директории

## `mysql` - cкрипт для инициализации MySQL БД

Например, так:
```bash
$ sudo mysql/reset_isotop.sh -u isotop_user.json`
```
или так:
```bash
$ make config-mysql
```

После запуска скрипта таблицы MySQL заполняются элементарными распределениями и создается файл `isotop_user.json` с кредами БД. Файл с кредами выглядит как-то так:
```json
{
  "user": "isotop_all",
  "host": "localhost",
  "password": "0Eh0KZvVRhhBFhHs75neeFHRKYRgYUOEi985PH7OoEiFvARlwGF794ifcqCfSG9D6xJvcAnAVdZK2sV3ivsNl8bnuUkcZf0hHRcsMDLB1SLETZr9X2Zav6mU15NLmuT2",
  "database": "isotop"
}
```
