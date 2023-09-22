//
//  ViewController.swift
//  Counter
//
//  Created by Олег Серебрянский on 21.09.2023.
//

import UIKit

 class ViewController: UIViewController {
    
    @IBOutlet private var backViewColor: UIView! // Добавил и переименовал стандартный View для изменения фонового цвета, но по итогу передумал. Оставил для возможности все таки менять цвет
    @IBOutlet weak private var countLabel: UILabel! // лейбл для счетчика
    @IBOutlet weak private var plusButton: UIButton! // кнопка +1
    @IBOutlet weak private var minusButton: UIButton! // кнопка -1
    @IBOutlet weak private var resetButton: UIButton! // кнопка сброса
    @IBOutlet weak private var actionHistory: UITextView! // UITextView для логов
    private var countNumber: Int = 0 // переменная для записи значений счетчика
    private func currentDate () -> String { // функция для определения и форматирования даты
        let dateFormatter = DateFormatter()
        let date = Date()
        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm:ss"
        let newData = dateFormatter.string(from: date)
        return newData
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.text = "\(countNumber)" // установил в лейбл текст и переменную с счетчиком
        countLabel.backgroundColor = .white // покрасил лейбл в белый
        countLabel.textColor = .black // покрасил текст в лейбле в черный
        plusButton.backgroundColor = .red // покрасил кнопку "+" в красный
        plusButton.tintColor = .white // покрасил знак "+" в белый
        minusButton.backgroundColor = .blue // покрасил кнопку "-" в синий
        minusButton.tintColor = .white //покрасил знак "-" в белый
        actionHistory.backgroundColor = .black // покрасил фон UItextView в черный
        actionHistory.textColor = .white // покрасил текст в UItextView в белый
        actionHistory.text = "История изменений: \n" // указал заголовок в UItextView
        actionHistory.isEditable = false // запредил редактирование для пользователя в UItextView
    }
    
    @IBAction private func increaseButton(_ sender: Any) { // +1 к счетчику и запись логов с датой
        countNumber += 1
        countLabel.text = "Значение счётчика: \(countNumber)"
        
        actionHistory.insertText("\(currentDate()) значение изменено на +1 \n")
        
    }
    @IBAction private func decreaseButton(_ sender: Any) { // -1 к счетчику и запись логов с датой
        if countNumber > 0 {
            countNumber -= 1
            actionHistory.insertText("\(currentDate()) значение изменено на -1 \n")
        }
        else{
            actionHistory.insertText("\(currentDate()) попытка уменьшить значение счётчика ниже 0 \n")
        }
        countLabel.text = "Значение счётчика: \(countNumber)"
    }
    @IBAction private func resetButton(_ sender: Any) { // сброс счетчика до 0 и запись логов с датой
        countNumber = 0
        countLabel.text = "Значение счётчика: \(countNumber)"
        actionHistory.insertText("\(currentDate()) значение сброшено \n")
        
    }
}
