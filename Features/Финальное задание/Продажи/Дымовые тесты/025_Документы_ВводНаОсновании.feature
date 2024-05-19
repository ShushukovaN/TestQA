﻿
#language: ru

@tree

Функциональность: Дымовые тесты - Документы - ВводНаОсновании
# Конфигурация: Демонстрационное приложение
# Версия: 1.0.38.2

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: ВводНаОсновании элемента документа "Расход товара" (РасходТовара)

	* Ищем ссылку на существующий элемент
		И я выполняю код встроенного языка на сервере
		"""bsl
			Объект.ЗначениеНаСервере = НЕОПРЕДЕЛЕНО;
			Запрос = Новый Запрос(
				"ВЫБРАТЬ ПЕРВЫЕ 1
				|	ТекДанныеИсточник.Ссылка КАК Ссылка
				|ИЗ
				|	Документ.РасходТовара КАК ТекДанныеИсточник
				|ГДЕ
				|	НЕ ТекДанныеИсточник.ПометкаУдаления
				|	И ТекДанныеИсточник.Проведен");
			ВыборкаЗапроса = Запрос.Выполнить().Выбрать();
			Если ВыборкаЗапроса.Следующий() Тогда
				Объект.ЗначениеНаСервере = ПолучитьНавигационнуюСсылку(ВыборкаЗапроса.Ссылка);
			КонецЕсли;
		"""
		И Я запоминаю значение выражения 'Объект.ЗначениеНаСервере' в переменную 'НавигационнаяСсылка'

	Если 'ЗначениеЗаполнено($НавигационнаяСсылка$)' Тогда

		* Отрываем форму существующего элемента
			И Я открываю навигационную ссылку '$НавигационнаяСсылка$'
			Если появилось предупреждение Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа РасходТовара"
			Если имя текущей формы "ErrorWindow" Тогда
				Тогда я вызываю исключение "Не удалось открыть существующий элемент документа РасходТовара"
			И я запоминаю заголовок формы в переменную 'ЗаголовокФормы'

		* Введем на основании Документ ПоступлениеДенег
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаДокументПоступлениеДенегСоздатьНаОсновании' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаДокументПоступлениеДенегСоздатьНаОсновании'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПоступлениеДенег на основании документа РасходТовара
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось ввести Документ ПоступлениеДенег на основании документа РасходТовара
				Тогда открылось окно '* (создание)'
				И Я закрываю окно '* (создание)'
