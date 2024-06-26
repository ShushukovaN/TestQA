﻿#language: ru

@tree
@Отчеты

Функционал: Тестирование отчетов

Как Тестировшик я хочу
Протестировать отчет Остатки
чтобы проверить что данные по остаткам товаров он показывает верно

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _001 Подготовка окружения	
	И я закрываю все окна клиентского приложения
	Когда перезаполнение констант
	Когда экспорт основных данных
	когда экспорт документов закупок
	И я выполняю код встроенного языка на сервере
		| 'Документы.ПриходТовара.НайтиПоНомеру("000000006").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' |
		| 'Документы.РасходТовара.НайтиПоНомеру("000000009").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' |
		| 'Документы.ПриходТовара.НайтиПоНомеру("000000029").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' |
		| 'Документы.РасходТовара.НайтиПоНомеру("000000001").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' |

Сценарий: _002 Проверка отчета Остатки
* Открытие отчета
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/app/Отчет.ОстаткиТоваровНаСкладах"
* Выбор варианта
	И я нажимаю на кнопку с именем 'ФормаЗагрузитьВариант'
	Тогда открылось окно 'Выбор варианта отчета'
	И в таблице "СписокНастроек" я перехожу к строке:
		| 'Представление' |
		| 'Основной'      |
	И в таблице "СписокНастроек" я выбираю текущую строку
	И Пауза 5
	Тогда открылось окно 'Остатки товаров'
* Формирование отчета	
	И я нажимаю на кнопку с именем 'ФормаСформировать'
* Проверка отчета
	Дано Табличный документ "Результат" содержит строки из макета "Отчет. Остатки товаров" по шаблону	