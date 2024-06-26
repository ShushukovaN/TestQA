﻿#language: ru

@tree
@Документы

Функционал: Создание документа Продажи товаров

Как Тестировщик я хочу
Создать документ Продажи товаров
чтобы проверить функционал документа   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _001 Подготовка окружения	
	И я закрываю все окна клиентского приложения
	Когда перезаполнение констант
	Когда экспорт основных данных
	И я выполняю код встроенного языка на сервере
		| 'Документы.ПриходТовара.НайтиПоНомеру("000000006").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' |
		| 'Документы.РасходТовара.НайтиПоНомеру("000000009").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' |
		| 'Документы.ПриходТовара.НайтиПоНомеру("000000029").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' |
		| 'Документы.РасходТовара.НайтиПоНомеру("000000001").ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);' |

@РасходТовара
Сценарий: _002 Расход товара. Создание и заполнение документа
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/Документ.РасходТовара"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Продажа товара (создание)'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И из выпадающего списка с именем "Покупатель" я выбираю точное значение 'Магазин "Продукты"'
	* Проверка заполнения цены
		И у элемента с именем "ВидЦен" я жду значения "Оптовая"
	Если элемент "Склад" присутствует на форме Тогда
		И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
* Заполнение закладки Прочее
	И я перехожу к закладке с именем "Прочее"
	И в поле с именем 'ОбоснованиеОтгрузки' я ввожу текст 'тест'
	И я перехожу к закладке с именем "ГруппаТовары"
	И я удаляю все строки таблицы "Товары"

* Заполнение табличной части
	* Кнопка добавить
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
		Тогда открылось окно 'Товары'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Veko67NE'     |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Продажа товара (создание) *'
	* Кнопка Побор	
		И в таблице "Товары" я нажимаю на кнопку с именем 'КомандаПодбор'
		Тогда открылось окно 'Подбор товара'
		И в таблице "ДеревоТоваров" я перехожу к строке:
			| 'Наименование' |
			| 'Товары'       |
		И в таблице "ДеревоТоваров" я разворачиваю текущую строку
		И в таблице "ДеревоТоваров" я перехожу к строке:
			| 'Наименование' |
			| 'Услуги'       |
		И в таблице "СписокТоваров" я перехожу к строке:
			| 'Наименование' |
			| 'Доставка'     |
		И в таблице "СписокТоваров" я выбираю текущую строку
		И я нажимаю на кнопку с именем 'ОК'
	* Заполнение цена, количество
		* Строка номер 1
			И в таблице "Товары" я перехожу к строке:
				| 'N' | 'Товар'    |
				| '1' | 'Veko67NE' |
			И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '3,00'
			И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '4,00'
			И в таблице "Товары" я завершаю редактирование строки
		* Строка номер 2
			И в таблице "Товары" я перехожу к строке:
				| 'N' | 'Товар'    |
				| '2' | 'Доставка' |
			И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '2,00'
			И в таблице "Товары" я завершаю редактирование строки

* Проверка доступности колонки количество для товара		
	Когда открылось окно 'Продажа товара (создание) *'
	И в таблице "Товары" я перехожу к строке:
		| 'N' | 'Товар'    |
		| '1' | 'Veko67NE' |
	И В таблице "Товары" поле с именем "ТоварыКоличество" доступно не только для просмотра
* Проверка доступности колонки количество для услуги		
	И в таблице "Товары" я перехожу к строке:
		| 'N' | 'Товар'    |
		| '2' | 'Доставка' |
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И Проверяю шаги на Исключение:
		|'И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5,00''|
	И в таблице 'Товары' поле с именем 'ТоварыКоличество' имеет значение ''

* Проверка расчета итоговой суммы в строках	
		И таблица "Товары" содержит строки:
  			| 'Товар'    | 'Цена' | 'Количество' | 'Сумма' |
  			| 'Veko67NE' | '3,00' | '4,00'       | '12,00' |
  			| 'Доставка' | '2,00' | ''           | '2,00'  |
* Проверка общих Итогов
	Попытка
		И у элемента с именем "ТоварыИтогКоличество" я жду значения "4"
	Исключение	
		И я регистрирую ошибку "Ошибка при расчете поля Количество (итог)" по данным исключения
	И у элемента с именем "ТоварыИтогСумма" я жду значения "14"
	
* Запись документа
	И я нажимаю на кнопку с именем 'ФормаПровести'
	И я запоминаю значение поля с именем 'Номер' как 'Номер'

* Контроль отрицательных остатков
	* Выбираем склад на котором нет остатков
		И из выпадающего списка с именем "Склад" я выбираю точное значение 'Строящийся склад'
	* Проверка выполнения контроля остатков оперативно проводимого документа
		попытка
			И я нажимаю на кнопку с именем 'ФормаПровести'
			Тогда открылось окно '1С:Предприятие'     
			И элемент формы с именем "ErrorInfo" стал равен 'Не удалось провести \"Продажа*\"!'	по шаблону										
			И я закрываю текущее окно
			Затем я жду, что в сообщениях пользователю будет подстрока "Не хватает " в течение 30 секунд
		Исключение
			И я регистрирую ошибку "Не выполнен контроль остатков для оперативно проводимого документа" по данным исключения

* Проведение документа
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И Пауза 5

* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер'   |
		| '$Номер$' |

@ПроверкаДвижений
Сценарий: _003 Расход товара. Проверка движений. Регистр взаиморасчетов с контрагентами
* Открываем документ
	И я закрываю все окна клиентского приложения
	И Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=bbef0050ba5c887711e1fc040faf2b1d"
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр взаиморасчетов с контрагентами'
* Проверка движений
	И таблица "Список" равна макету "Движения. Регистр взаиморасчетов с контрагентами"
	И я закрываю все окна клиентского приложения

@ПроверкаДвижений
Сценарий: _004 Расход товара. Проверка движений. Регистр продаж
* Открываем документ
	И я закрываю все окна клиентского приложения
	И Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=bbef0050ba5c887711e1fc040faf2b1d"
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр продаж'
* Проверка движений текущего документа
	И таблица "Список" равна макету "Движения. Регистр продаж"
	И я закрываю все окна клиентского приложения

@ПроверкаДвижений
Сценарий: _005 Расход товара. Проверка движений. Регистр товарных запасов
* Открываем документ
	И я закрываю все окна клиентского приложения
	И Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=bbef0050ba5c887711e1fc040faf2b1d"
	И В текущем окне я нажимаю кнопку командного интерфейса 'Регистр товарных запасов'
* Проверка движений
	И таблица "Список" равна макету "Движения. Регистр товарных запасов"
	И я закрываю все окна клиентского приложения

@ПроверкаПечати
Сценарий: _006 Расход товара. Печать. Расхдная накладная
* Открываем документ
	И я закрываю все окна клиентского приложения
	И Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=bbef0050ba5c887711e1fc040faf2b1d"
* Проверка Расходной накладной
	Когда открылось окно 'Продажа * от *'
	И я нажимаю на кнопку с именем 'ФормаДокументРасходТовараПечатьРасходнойНакладной'
	Тогда Табличный документ "SpreadsheetDocument" равен макету "Печать. Расход товара"
	И я закрываю все окна клиентского приложения

@ПроверкаПечати	
Сценарий: _007 Расход товара. Печать. Доставка
* Открываем документ
	И я закрываю все окна клиентского приложения
	И Я открываю навигационную ссылку "e1cib/data/Документ.РасходТовара?ref=bbef0050ba5c887711e1fc040faf2b1d"
* Проверка Доставка
	Когда открылось окно 'Продажа * от *'
	И я нажимаю на кнопку с именем 'ФормаОформитьДоставку'
	Тогда Табличный документ "ТабличныйДокумент" равен макету "Печать. Доставка"
	И я закрываю все окна клиентского приложения