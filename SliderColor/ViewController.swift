//
//  ViewController.swift
//  SliderColor
//
//  Created by  Paul on 11.10.2021.
//

import UIKit

// создаем протокол делегата
protocol ViewControllerDelegate: AnyObject {
    func setColor(_ color: UIColor)
}

class ViewController: UIViewController {

    @IBOutlet var viewColor: UIView!
    
    @IBOutlet var redColorLabel: UILabel!
    @IBOutlet var greenColorLabel: UILabel!
    @IBOutlet var blueColorLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // передаем делегат в параметр через подписание на протокол делегата
    weak var delegate: ViewControllerDelegate?
    var mainViewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColor.layer.cornerRadius = 10
        viewColor.backgroundColor = mainViewColor
        
        setSliders()
        setValue(for: redColorLabel, greenColorLabel, blueColorLabel)
    }

    @IBAction func allSlidersAction(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            setValue(for: redColorLabel)
        case 1:
            setValue(for: greenColorLabel)
        case 2:
            setValue(for: blueColorLabel)
        default: break
        }
        
        setColor()
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redColorLabel.text = string(from: redSlider)
            case 1: greenColorLabel.text = string(from: greenSlider)
            case 2: blueColorLabel.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        return String(format: "%.2f", slider.value)
    }
    
    // устанавливаем значения для слайдеров после настройки и перехода обратно на экран настроек
    private func setSliders() {
        let ciColor = CIColor(color: mainViewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }

    // реализуем метод делегата в экшене по нажатию кнопки
    @IBAction func goBackButtonAction(_ sender: UIButton) {
        delegate?.setColor(viewColor.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

extension ViewController {
    private func setColor() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}
