#language: ru

@tree

Функционал: Проверка отображения возвратов в отчете D2001 Продажи

Как Тестировщик я хочу
Протестировать отчет Продажи 
чтобы проверить отображение возвратов в отчете D2001 Продажи   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка отображения возвратов в отчете D2001 Продажи
* Открываем отчет
	И я закрываю все окна клиентского приложения	
	Дано Я открываю навигационную ссылку "e1cib/app/Report.D2001_Sales"
	Тогда открылось окно 'D2001 Продажи'
* Выбираем период	
	И я нажимаю на кнопку с именем 'FormChangeVariant'
	Тогда открылось окно 'Вариант "Default" отчета "D2001 Продажи"'
	И в таблице "SettingsComposerSettingsDataParameters" я перехожу к строке:
		| 'Дата начала'        | 'Дата окончания'      | 'Значение'   | 'Использование' | 'Параметр' |
		| '01.04.2024 0:00:00' | '30.04.2024 23:59:59' | 'Этот месяц' | 'Да'            | 'Период'   |
	И в таблице "SettingsComposerSettingsDataParameters" я активизирую поле с именем "SettingsComposerSettingsDataParametersStartDate"
	И в таблице "SettingsComposerSettingsDataParameters" я выбираю текущую строку
	И в таблице "SettingsComposerSettingsDataParameters" в поле с именем 'SettingsComposerSettingsDataParametersStartDate' я ввожу текст '01.04.2024  0:00:00'
	И в таблице "SettingsComposerSettingsDataParameters" я завершаю редактирование строки
	И в таблице "SettingsComposerSettingsDataParameters" я активизирую поле с именем "SettingsComposerSettingsDataParametersEndDate"
	И в таблице "SettingsComposerSettingsDataParameters" я выбираю текущую строку
	И в таблице "SettingsComposerSettingsDataParameters" в поле с именем 'SettingsComposerSettingsDataParametersEndDate' я ввожу текст '30.04.2024  0:00:00'
	И в таблице "SettingsComposerSettingsDataParameters" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'FormEndEdit'
	Тогда открылось окно 'D2001 Продажи'
* Генерация отчета	
	И я нажимаю на кнопку с именем 'FormGenerate'
	И табличный документ "Result" содержит строки:
   	| 'Характеристика'          | 'Количество' | 'Сумма'   | 'Сумма без налогов' | 'Сумма скидки' |
   	| 'S/Красный'               | '-1,000'     | '-190,00' | '-158,33'           | ''             |
   	| 'Товар без характеристик' | '-1,000'     | '-490,00' | '-408,33'           | ''             |
	И я закрываю все окна клиентского приложения