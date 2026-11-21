@echo off
chcp 65001 >nul
set score_fastapi=0
set score_django=0
set score_flask=0

echo ========================================
echo   Модуль выбора фреймворка для бэкенда
echo ========================================
echo.

echo Вопрос 1: Какой размер команды разработчиков?
echo 1. 1-2 человека (маленькая команда)
echo 2. 3-5 человек (средняя команда)
echo 3. 6+ человек (большая команда)
choice /c 123 /n
if errorlevel==3 set /a score_django+=10
if errorlevel==2 set /a score_fastapi+=5
if errorlevel==1 set /a score_flask+=10
echo.

echo Вопрос 2: Требуется ли асинхронная обработка запросов?
echo 1. Да, высокая нагрузка и много одновременных пользователей
echo 2. Нет, обычная нагрузка
choice /c 12 /n
if errorlevel==1 set /a score_fastapi+=15
if errorlevel==2 set /a score_django+=5
echo.

echo Вопрос 3: Какие сроки реализации проекта?
echo 1. Очень сжатые (нужно быстро запустить MVP)
echo 2. Стандартные (2-3 месяца)
echo 3. Долгосрочные (полгода+)
choice /c 123 /n
if errorlevel==1 set /a score_django+=10
if errorlevel==2 set /a score_fastapi+=5
if errorlevel==3 set /a score_flask+=10
echo.

echo Вопрос 4: Опыт команды с Python?
echo 1. Новички, только начинают
echo 2. Средний уровень, есть опыт
echo 3. Опытные разработчики
choice /c 123 /n
if errorlevel==1 set /a score_django+=10
if errorlevel==2 set /a score_fastapi+=5
if errorlevel==3 set /a score_fastapi+=10
echo.

echo Вопрос 5: Нужна ли встроенная админ-панель?
echo 1. Да, обязательно
echo 2. Нет, сделаем сами или не нужна
choice /c 12 /n
if errorlevel==1 set /a score_django+=15
if errorlevel==2 set /a score_fastapi+=5
echo.

echo Вопрос 6: Какой тип API планируется?
echo 1. Простой CRUD (создать/прочитать/обновить/удалить)
echo 2. Сложный с бизнес-логикой и валидацией
echo 3. Микросервисы с высокой производительностью
choice /c 123 /n
if errorlevel==1 set /a score_flask+=10
if errorlevel==2 set /a score_django+=10
if errorlevel==3 set /a score_fastapi+=15
echo.

echo ========================================
echo   РЕЗУЛЬТАТЫ АНАЛИЗА
echo ========================================
echo FastAPI: %score_fastapi% баллов
echo Django:  %score_django% баллов
echo Flask:   %score_flask% баллов
echo.

if %score_fastapi% gtr %score_django% if %score_fastapi% gtr %score_flask% (
    echo РЕКОМЕНДАЦИЯ: FastAPI
    echo Причина:最佳 выбор для высоконагруженных асинхронных API
) else if %score_django% gtr %score_flask% (
    echo РЕКОМЕНДАЦИЯ: Django
    echo Причина: Лучший выбор для быстрой разработки с командой
) else (
    echo РЕКОМЕНДАЦИЯ: Flask
    echo Причина: Идеален для небольших проектов и обучения
)
echo.
pause