﻿#language: ru

@tree

Функционал: Циклы, условия

Как <Роль> я хочу
<описание функционала> 
чтобы <бизнес-эффект>   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Цикл. Создание большого объема данных (справочник номенклатура)
	И Я запоминаю значение выражения '0' в переменную "Шаг"
	И я делаю 10 раз
		И Я запоминаю значение выражения '$Шаг$ + 1' в переменную "Шаг"
		И Я запоминаю значение выражения '"Номенклатура" + $Шаг$' в переменную "Наименование"
		И я проверяю или создаю для справочника "Items" объекты:
			| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'ItemType' | 'Unit' | 'MainPricture' | 'Vendor' | 'ItemID' | 'PackageUnit' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
			| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | ''             |        | ''         | ''     | ''             | ''       | ''       | ''            | '$Наименование$' | ''                 | '$Наименование$' | ''               |          |          |          |          |         |

Сценарий: Условие. Заполнение поля Организация
	И я закрываю все окна клиентского приложения
	И Я устанавливаю в константу "UseCompanies" значение "True"
	Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
	Когда открылось окно 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Заказ покупателя (создание)'
	И я нажимаю кнопку выбора у поля с именем "Agreement"
	Тогда открылось окно 'Соглашения'
	И в таблице "List" я перехожу к строке:
		| 'Вид'    | 'Вид взаиморасчетов'         | 'Вид мультивалютной аналитики' | 'Вид цены' | 'Дата начала действия' | 'Использовать лимит суммы взаиморасчетов' | 'Код' | 'Наименование'                                         | 'Организация'            | 'Склад'                         | 'Стандартное соглашение'   | 'Цена включает НДС' |
		| 'Клиент' | 'По стандартным соглашениям' | 'Валюта соглашения, USD'       | 'Опт'      | '01.01.2021'           | 'Нет'                                     | '5'   | 'Общее соглашение (расчет по стандартным соглашениям)' | 'Собственная компания 1' | 'Склад 1 (с контролем остатка)' | 'Стандартное соглашение 1' | 'Да'                |
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Заказ покупателя (создание) *'
	Если поле с именем "Company" заполнено Тогда
		И я закрываю все окна клиентского приложения
	Иначе
		и я нажимаю кнопку выбора у поля с именем "Company"
		Тогда открылось окно 'Организации'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'           | 'Партнер' |
			| '1'   | 'Собственная компания 1' | ''        |
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Заказ покупателя (создание) *'
		И я закрываю все окна клиентского приложения
		
		
	
		

