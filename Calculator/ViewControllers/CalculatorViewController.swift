//
//  ViewController.swift
//  Calculator
//
//  Created by Dmitry Vorozhbicki on 14/10/2019.
//  Copyright © 2019 Dmitry Vorozhbicki. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    private var numberFromLabel: Double = 0
    private var firstNumber: Double = 0
    private var operation: Int = 0
    private var mathSign: Bool = false

    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
    
extension CalculatorViewController {
    @IBAction func controlButtons(_ sender: UIButton) {
        switch sender.tag {
        case 17: // =
            switch operation {
            case 13:// /
                 resultLabel.text = String(firstNumber / numberFromLabel)
             case 14:// x
                 resultLabel.text = String(firstNumber * numberFromLabel)
             case 15:// -
                 resultLabel.text = String(firstNumber - numberFromLabel)
             case 16:// +
                 resultLabel.text = String(firstNumber + numberFromLabel)
            default:
                break
            }
        case 10: // c
            resultLabel.text = ""
            firstNumber = 0
            numberFromLabel = 0
            operation = 0
        case 18: // ,
            resultLabel.text = (resultLabel.text ?? "") + "."
        case 11: // +/-
            if let number = Double(resultLabel.text ?? "") {
                numberFromLabel = -number
                resultLabel.text = String(numberFromLabel)
            }
        case 12: // %
            if let number = Double(resultLabel.text ?? "") {
                numberFromLabel = number / 100
                resultLabel.text = String(numberFromLabel)
            }
        default:
            guard resultLabel.text != "" else { break }
            if let number = Double(resultLabel.text ?? "") {
                firstNumber = number
            }
            switch sender.tag {
            case 13:// /
                resultLabel.text = "/"
            case 14:// x
                resultLabel.text = "x"
            case 15:// -
                resultLabel.text = "-"
            case 16:// +
                resultLabel.text = "+"
            default:
                break
            }
            mathSign = true
            operation = sender.tag
        }
    }
    
    @IBAction func numberClick(_ sender: UIButton) {
        if mathSign {
            resultLabel.text = String(sender.tag)
            mathSign = false
        } else {
            resultLabel.text = (resultLabel.text ?? "") + String(sender.tag)
        }
        
        if let number = Double(resultLabel.text ?? "") {
            numberFromLabel = number
        }
    }
    
}
