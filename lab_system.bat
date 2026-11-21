@echo off
chcp 65001 >nul

:menu
cls
echo ========================================
echo   СИСТЕМА МОДЕЛИРОВАНИЯ ПРОЦЕССОВ РАЗРАБОТКИ ПО
echo ========================================
echo.
echo 1. Модуль выбора технологий
echo 2. Модуль инспекции кода
echo 3. Модуль сравнительного анализа
echo 4. Запустить все модули последовательно
echo 5. Выход
echo.
set /p choice=Ваш выбор: 

if "%choice%"=="1" (
    call chapter1.bat
    goto menu
)
if "%choice%"=="2" (
    call chapter2.bat
    goto menu
)
if "%choice%"=="3" (
    call chapter3.bat
    goto menu
)
if "%choice%"=="4" (
    echo.
    echo Запуск всех модулей последовательно...
    echo.
    echo === МОДУЛЬ 1: Выбор технологий ===
    call chapter1.bat
    
    echo.
    echo === МОДУЛЬ 2: Инспекция кода ===
    call chapter2.bat
    
    echo.
    echo === МОДУЛЬ 3: Сравнительный анализ ===
    call chapter3.bat
    
    echo.
    echo ========================================
    echo   ИТОГОВЫЙ ОТЧЁТ СИСТЕМЫ
    echo ========================================
    echo.
    echo Модуль 1: Рекомендация по технологии сформирована.
    echo Модуль 2: Уровень ревьюера определён.
    echo Модуль 3: Победитель сравнительного анализа определён.
    echo.
    echo Результаты сохранены в report.txt
    echo.
    
    echo Итоговый отчёт системы > report.txt
    echo Дата: %date% %time% >> report.txt
    echo. >> report.txt
    echo Модуль 1: Рекомендация по технологии сформирована. >> report.txt
    echo Модуль 2: Уровень ревьюера определён. >> report.txt
    echo Модуль 3: Победитель сравнительного анализа определён. >> report.txt
    
    pause
    goto menu
)
if "%choice%"=="5" (
    echo.
    echo До свидания!
    pause
    exit
)

echo Неверный выбор. Попробуйте снова.
pause
goto menu