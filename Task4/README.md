# Веб-приложение для турагентства

## Описание
Приложение позволяет просматривать и бронировать туры.  
**Стек**: Delphi 10.2, MS SQL Server, IIS.

## Установка
1. **База данных**:  
   Выполните скрипт `Database/tourism.sql` в MS SQL Server.

2. **Приложение**:  
   - Откройте проект `DelphiApp/WebApp.dpr` в Delphi.  
   - Настройте подключение к БД в `FDConnection.config`.  
   - Опубликуйте проект через `Deployment → Remote Profile`.

3. **IIS**:  
   Следуйте инструкциям в `IIS_Config/DeploymentGuide.md`.

## Примеры использования
- Просмотр туров: `http://localhost:8080/tours`.
- Добавление заказа: `http://localhost:8080/order`.

## Лицензия
MIT License.