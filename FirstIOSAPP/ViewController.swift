//
//  ViewController.swift
//  FirstIOSAPP
//
//  Created by dentall01 on 2019/3/23.
//  Copyright © 2019 wendeehsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen:Double = 0
    var secondNum:Double = 0
    var now_operator:String = ""
    let operators = ["/","x","-","+"]
    
    @IBOutlet weak var currentOperation: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBAction func Numbers(_ sender: UIButton) {
        if(label.text == String(0))
        {
            label.text = String(sender.tag - 1)
        }
        else if (operators.contains(label.text!))
        {
            now_operator = label.text!
            label.text = String(sender.tag - 1)
        }
        else
        {
            label.text! += String(sender.tag - 1)
        }
        currentOperation.text = currentOperation.text! + String(sender.tag - 1)
    }
    
    @IBAction func Operators(_ sender: UIButton) {
        let operater:Int = Int(sender.tag)
        if(operater != 11 && operater != 16)
        {
            currentOperation.text! += " " + operators[operater-12] + " "
            numberOnScreen = Double(label.text!)!
        }
        switch operater {
            case 11:
                label.text = ""
                Init()
            case 16:
                secondNum = Double(label.text!)!
                if(now_operator != "")
                {
                    var result:Double = 0
                    switch now_operator
                    {
                        case "+":
                         result = numberOnScreen + secondNum
                        case "-":
                            result = numberOnScreen - secondNum
                        case "x":
                            result = numberOnScreen * secondNum
                        case "/":
                            result = numberOnScreen / secondNum
                        default:
                            return
                    }
                    print(numberOnScreen,now_operator,secondNum)
                    label.text = String(result)
                    Init()
                }
            default:
                label.text = operators[operater-12]
        }
    }
    
    func Init()
    {
        numberOnScreen = 0
        secondNum = 0
        now_operator = ""
        currentOperation.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

