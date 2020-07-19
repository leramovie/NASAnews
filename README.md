Реализовать экран списком отобразить на нем данные библиотеки Nasa Image and Video Library
При тапе на один из элементов реализовать переход на детальную информацию об элементе.
Ссылка на апи https://api.nasa.gov/

Сделано IOS приложение: NASA news

- Только портретная ориентация
- Главный экран реализован в UITableView управляемый ListViewController.swift
- Список отсортирован по дате (самые свежие - самые первые)
- Каждая строка содержит 3 элемента: UIImageView, UILabel для title, UILabel для даты оутлеты которых хранятся в UITableViewCell классе NASAdataCell.swift
- Данные поступают из запроса: https://images-api.nasa.gov/search?q=space&media_type=image&year_start=2019&year_end=2019 
- Для удобной работы со многовложенной структурой использовала библиотеку SwiftyJSON
- Для удобной работы с изображением использовала библиотеку sd_image
- При нажатии на строку открывается экран детализации, где расположены 3 элемента: UILabel для title, UIImageView, UITextView (скролл только текста), управляется DetailViewController.swift
- В сториборде каждый элемент имеет constraint
