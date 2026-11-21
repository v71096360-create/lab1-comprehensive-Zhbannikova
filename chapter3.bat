@echo off
chcp 65001 >nul

echo ========================================
echo   Модуль сравнительного анализа (WSM)
echo ========================================
echo.
echo Назначьте веса критериям (сумма должна быть ровно 100):
set /p w1="1. Производительность и асинхронность (%%): "
set /p w2="2. Скорость разработки и встроенные функции (%%): "
set /p w3="3. Масштабируемость и экосистема (%%): "

set /a total_weight=w1+w2+w3
if %total_weight% neq 100 (
    echo.
    echo ОШИБКА: Сумма весов = %total_weight%, а должна быть 100.
    pause
    exit /b
)

echo.
echo Оцените альтернативы по шкале от 1 до 5:
echo.
echo --- FastAPI ---
set /p f1="Производительность (1-5): "
set /p f2="Скорость разработки (1-5): "
set /p f3="Масштабируемость (1-5): "

echo.
echo --- Django ---
set /p d1="Производительность (1-5): "
set /p d2="Скорость разработки (1-5): "
set /p d3="Масштабируемость (1-5): "

echo.
echo --- Flask ---
set /p fl1="Производительность (1-5): "
set /p fl2="Скорость разработки (1-5): "
set /p fl3="Масштабируемость (1-5): "

set /a score_f=f1*w1 + f2*w2 + f3*w3
set /a score_d=d1*w1 + d2*w2 + d3*w3
set /a score_fl=fl1*w1 + fl2*w2 + fl3*w3

echo.
echo ========================================
echo          МАТРИЦА РЕШЕНИЙ
echo ========================================
echo Критерий                     ^| Вес ^| FastAPI ^| Django ^| Flask
echo -----------------------------^|-----^|---------^|--------^|------
echo Производительность           ^| %w1%  ^|   %f1%    ^|   %d1%   ^|  %fl1%
echo Скорость разработки          ^| %w2%  ^|   %f2%    ^|   %d2%   ^|  %fl2%
echo Масштабируемость             ^| %w3%  ^|   %f3%    ^|   %d3%   ^|  %fl3%
echo -----------------------------^|-----^|---------^|--------^|------
echo ИТОГОВЫЙ БАЛЛ                ^|      ^|  %score_f% ^|  %score_d% ^|  %score_fl%
echo ========================================
echo.

set winner=FastAPI
set max_score=%score_f%

if %score_d% gtr %max_score% (
    set winner=Django
    set max_score=%score_d%
)
if %score_fl% gtr %max_score% (
    set winner=Flask
    set max_score=%score_fl%
)

echo ПОБЕДИТЕЛЬ: %winner% (набрал %max_score% баллов)
echo.
pause