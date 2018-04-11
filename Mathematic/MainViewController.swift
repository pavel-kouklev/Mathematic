//
//  MainViewController.swift
//  Mathematic
//
//  Created by Pavel Kuklev on 06.10.2017.
//  Copyright © 2017 Pavel Kuklev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // создаём два outlet для ответа пользователя и поля с задачей для решения
    @IBOutlet weak var userData: UILabel!
    @IBOutlet weak var compData: UILabel!
    
    // объявляем и инициализируем переменные для ответа пользователя и правильного ответа
    var userAnswer: Int?
    var rightAnswer = 0
    
    // создаём метод для начала (старта) игры
    func start() {
        // объявляем и инициализируем переменные для двух операндов
        let a = Int(arc4random() % 40 + 1)
        let b = Int(arc4random() % 40 + 1)
        // объявляем и инициализируем переменную для генерации типа операции над числами
        let randomNumber = Int(arc4random() % 2)
        // определяем тип операции и выводим задание в compData
        switch randomNumber {
        case 0:
            rightAnswer = a + b
            compData.text = "\(a) + \(b)"
        case 1:
            rightAnswer = (a % 10 + 1) * (b % 10 + 1)
            compData.text = "\(a % 10 + 1) * \(b % 10 + 1)"
        default:
            print("Error")
        }
        userData.text? = ""
    }
    
    // задаём первоначальные значения для работы приложения
    override func viewDidLoad() {
        super.viewDidLoad()
        // запускаем игру
            start()
        
    }
    // реализуем функционал проверки ответа и вывода соответствующего alert
    @IBAction func doneButton(_ sender: UIButton) {
        userAnswer = Int(userData.text!)
        // реализация alertController
        let alertController = UIAlertController(title: userAnswer == rightAnswer ? "Правильно" : "Ошибка", message: userAnswer == rightAnswer ? "Умничка" : "Дурочка", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Дальше", style: .default, handler: {(action) -> Void in
            self.start()
            })
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // создаём action для каждой кнопки цифровой клавиатуры и добавления числе в "Ответ пользователя"
    @IBAction func null(_ sender: UIButton) {
        userData.text?.append(String(0))
    }
    @IBAction func one(_ sender: UIButton) {
        userData.text?.append(String(1))
    }
    @IBAction func two(_sender: UIButton) {
        userData.text?.append(String(2))
    }
    @IBAction func three(_sender: UIButton) {
        userData.text?.append(String(3))
    }
    @IBAction func four(_sender: UIButton) {
        userData.text?.append(String(4))
    }
    @IBAction func five(_sender: UIButton) {
        userData.text?.append(String(5))
    }
    @IBAction func six(_sender: UIButton) {
        userData.text?.append(String(6))
    }
    @IBAction func seven(_sender: UIButton) {
        userData.text?.append(String(7))
    }
    @IBAction func eight(_sender: UIButton) {
        userData.text?.append(String(8))
    }
    @IBAction func nine(_sender: UIButton) {
        userData.text?.append(String(9))
    }
    @IBAction func delButton(_ sender: UIButton) {
        userData.text? = ""
    }
}

