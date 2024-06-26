﻿
#language: ru

@tree

Функциональность: Дымовые тесты - Документы - Запись
# Конфигурация: Демонстрационное приложение
# Версия: 1.0.38.2

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Запись элемента документа "Расход товара" (РасходТовара)

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

		* Записываем существующий элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаЗаписать' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаЗаписать'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось записать существующий элемент документа РасходТовара"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось записать существующий элемент документа РасходТовара"

		* Пересчитаем существующий элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаПеречитать' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаПеречитать'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось перечитать существующий элемент документа РасходТовара"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось перечитать существующий элемент документа РасходТовара"

		* Помечаем на удаление существующий элемент
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаУстановитьПометкуУдаления' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
				Если открылось окно '1С:Предприятие' Тогда
					И я нажимаю на кнопку с именем 'Button0'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось пометить на удаление элемент документа РасходТовара"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось пометить на удаление элемент документа РасходТовара"

		* Снимаем пометку на удаление с существующего элемента
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаУстановитьПометкуУдаления' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаУстановитьПометкуУдаления'
				Если открылось окно '1С:Предприятие' Тогда
					И я нажимаю на кнопку с именем 'Button0'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось снять пометку на удаление с элемента документа РасходТовара"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось снять пометку на удаление с элемента документа РасходТовара"

		* Проведем документ
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаПровести' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаПровести'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось провести элемент документа РасходТовара"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось провести элемент документа РасходТовара"

		* Отменим проведение документа
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаОтменаПроведения' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаОтменаПроведения'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось отменить проведение документа РасходТовара"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось отменить проведение документа РасходТовара"

		* Проведем и закроем документ
			Когда открылось окно '$ЗаголовокФормы$'
			Если элемент формы с именем 'ФормаПровестиИЗакрыть' присутствует на форме Тогда
				И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
				Если появилось предупреждение Тогда
					Тогда я вызываю исключение "Не удалось провести и закрыть элемент документа РасходТовара"
				Если имя текущей формы "ErrorWindow" Тогда
					Тогда я вызываю исключение "Не удалось провести и закрыть элемент документа РасходТовара
