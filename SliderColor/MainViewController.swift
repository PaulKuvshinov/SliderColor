//
//  MainViewController.swift
//  SliderColor
//
//  Created by  Paul on 23.11.2021.
//

import UIKit

class MainViewController: UIViewController {

    // создаем объект экрана с настройками, в котором передаем объект текущего экрана, в котором будет реализован метод работы setColor
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorVC = segue.destination as! ViewController
        colorVC.delegate = self
        // передаем в параметр mainViewColor цвет текущего контролера
        colorVC.mainViewColor = view.backgroundColor
    }
    
}

// подписываем текущий класс на протокол делегата, в котором принимаем параметры реализованного метода
extension MainViewController: ViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}


