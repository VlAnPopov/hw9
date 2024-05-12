#!/bin/bash

# Скрипт просмотра лога

WORD=$1
LOG=$2
DATE=`date`
if grep $WORD $LOG &> /dev/null
then
# Вместо логгера, как в методичке, использую echo и перенаправление вывода в настройках сервиса
echo "I found word, master!"
else
exit 0
fi
