﻿
#language: ru

@tree
@ДымовыеТесты

Функциональность: Дымовые тесты - Справочники - ФормаОбъекта
# Конфигурация: Демонстрационное приложение
# Версия: 1.0.38.2

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Открытие формы справочника "Входящие письма"

	Дано Я открываю основную форму справочника "ВходящиеПисьма"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника ВходящиеПисьма"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника ВходящиеПисьма"
	И Я закрываю текущее окно

Сценарий: Открытие формы справочника "Контрагенты"

	Дано Я открываю основную форму справочника "Контрагенты"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника Контрагенты"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника Контрагенты"
	И Я закрываю текущее окно

Сценарий: Открытие формы справочника "Товары"

	Дано Я открываю основную форму справочника "Товары"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника Товары"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника Товары"
	И Я закрываю текущее окно

Сценарий: Открытие формы справочника "Настройки торгового оборудования"

	Дано Я открываю основную форму справочника "НастройкиТорговогоОборудования"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника НастройкиТорговогоОборудования"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника НастройкиТорговогоОборудования"
	И Я закрываю текущее окно

Сценарий: Открытие формы справочника "Хранимые файлы"

	Дано Я открываю основную форму справочника "ХранимыеФайлы"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника ХранимыеФайлы"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника ХранимыеФайлы"
	И Я закрываю текущее окно

Сценарий: Открытие формы справочника "Валюты"

	Дано Я открываю основную форму справочника "Валюты"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника Валюты"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника Валюты"
	И Я закрываю текущее окно

Сценарий: Открытие формы справочника "Организации"

	Дано Я открываю основную форму справочника "Организации"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника Организации"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника Организации"
	И Я закрываю текущее окно

Сценарий: Открытие формы справочника "Пользователи"

	Дано Я открываю основную форму справочника "Пользователи"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника Пользователи"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника Пользователи"
	И Я закрываю текущее окно

Сценарий: Открытие формы справочника "Исходящие письма"

	Дано Я открываю основную форму справочника "ИсходящиеПисьма"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника ИсходящиеПисьма"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника ИсходящиеПисьма"
	И Я закрываю текущее окно

Сценарий: Открытие формы справочника "Встречи"

	Дано Я открываю основную форму справочника "Встречи"
	Если появилось предупреждение Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника Встречи"
	Если имя текущей формы "ErrorWindow" Тогда
		Тогда я вызываю исключение "Не удалось открыть основную форму справочника Встречи"
	И Я закрываю текущее окно
