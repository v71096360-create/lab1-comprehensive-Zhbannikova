@echo off
chcp 65001 >nul
set correct=0
set total=5

echo ========================================
echo   Модуль инспекции кода (Code Review)
echo ========================================
echo.

echo Фрагмент 1 (FastAPI - маршрут):
echo 1: @app.get("/users/{user_id}")
echo 2: def get_user(user_id: int):
echo 3:     user = db.query(user_id)
echo 4:     return user
echo 5:     db.close()
echo.
echo Какой дефект здесь скрыт?
echo 1. Мёртвое присваивание
echo 2. Недостижимый код после return
echo 3. Утечка ресурса
choice /c 123 /n
if errorlevel==2 (
    echo Верно! Строка 5 никогда не выполнится.
    set /a correct+=1
) else (
    echo Неверно. Правильный ответ: 2
)
echo.

echo Фрагмент 2 (Django - модель):
echo 10: class Product(models.Model):
echo 11:     price = models.DecimalField(max_digits=10, decimal_places=2)
echo 12:     discount = price * 0.15
echo 13:     total = price - discount
echo.
echo Какой дефект здесь скрыт?
echo 1. Магическое число (0.15)
echo 2. Неинициализированная переменная
echo 3. Утечка ресурса
choice /c 123 /n
if errorlevel==1 (
    echo Верно! Коэффициент скидки должен быть константой.
    set /a correct+=1
) else (
    echo Неверно. Правильный ответ: 1
)
echo.

echo Фрагмент 3 (Flask - обработка запроса):
echo 20: @app.route("/api/data", methods=["POST"])
echo 21: def process_data():
echo 22:     data = request.json
echo 23:     result = heavy_computation(data)
echo 24:     return jsonify(result)
echo.
echo Какой дефект здесь скрыт?
echo 1. Отсутствие обработки ошибок
echo 2. Мёртвое присваивание
echo 3. SQL-инъекция
choice /c 123 /n
if errorlevel==1 (
    echo Верно! Нет try/except для обработки сбоев.
    set /a correct+=1
) else (
    echo Неверно. Правильный ответ: 1
)
echo.

echo Фрагмент 4 (FastAPI - зависимость):
echo 30: def get_db():
echo 31:     db = SessionLocal()
echo 32:     try:
echo 33:         yield db
echo 34:     finally:
echo 35:         db.close()
echo 36:     db = None
echo.
echo Какой дефект здесь скрыт?
echo 1. Мёртвое присваивание (db = None после close)
echo 2. Утечка ресурса
echo 3. Отсутствие обработки ошибок
choice /c 123 /n
if errorlevel==1 (
    echo Верно! Присваивание db = None бессмысленно после закрытия.
    set /a correct+=1
) else (
    echo Неверно. Правильный ответ: 1
)
echo.

echo Фрагмент 5 (Django - вьюха):
echo 40: def calculate_discount(price, tier):
echo 41:     if tier == 1:
echo 42:         discount = price * 0.1
echo 43:     elif tier == 2:
echo 44:         discount = price * 0.2
echo 45:     final_price = price - discount
echo 46:     return final_price
echo.
echo Какой дефект здесь скрыт?
echo 1. Магическое число (0.1, 0.2)
echo 2. Неинициализированная переменная (discount если tier != 1 и != 2)
echo 3. Утечка ресурса
choice /c 123 /n
if errorlevel==2 (
    echo Верно! Если tier не 1 и не 2, переменная discount не определена.
    set /a correct+=1
) else (
    echo Неверно. Правильный ответ: 2
)
echo.

echo ========================================
echo   ИТОГОВЫЙ ОТЧЁТ
echo ========================================
echo Правильных ответов: %correct% из %total%
set /a percentage=correct*100/total
echo Точность: %percentage%%%
echo.
if %percentage% geq 80 (
    echo Уровень: Senior Reviewer
) else if %percentage% geq 50 (
    echo Уровень: Middle Reviewer
) else (
    echo Уровень: Junior Reviewer
)
echo.
pause