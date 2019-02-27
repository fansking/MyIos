//
//  ViewController.swift
//  calculate
//
//  Created by 客人用户 on 2019/2/27.
//  Copyright © 2019年 吕若凡. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isInputDigit=false
    var lastData:Double=0
    var optStr:String=" "
    var curData:Double
    {
        get{
            return Double.init(lbDisplayData.text!)!
        }
        set{
            lbDisplayData.text="\(newValue)"
        }
        
    }
    @IBOutlet weak var lbDisplayData: UILabel!
    @IBAction func appendDigit(_ sender: UIButton) {
        
        let digit=sender.currentTitle!
        if digit.contains(".")&&lbDisplayData.text!.contains("."){
            return
        }else{
            if isInputDigit{
                lbDisplayData.text=lbDisplayData.text!+digit
                
            }else{
                lbDisplayData.text=digit
                isInputDigit=true
            }
        }
        
    }
    @IBAction func appendOpt(_ sender: UIButton) {
        lastData=curData
        optStr=sender.currentTitle!
        isInputDigit=false
    }
    
    @IBAction func doOpt(_ sender: UIButton) {
        switch optStr {
        case "+":
            curData=curData+lastData
        case "-":
            curData=lastData-curData
        case "*":
            curData=lastData*curData
        case "/":
            curData=lastData/curData
        default:
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

