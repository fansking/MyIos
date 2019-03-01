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
    var optStr2:String=" "
    var curData:Double
    {
        get{
            
            return Double.init(lbDisplayData.text!)!
        }
        set{
            lbDisplayData.text="\(newValue)"
        }
        
    }
    
    @IBOutlet weak var lbwarning: UILabel!
    @IBOutlet weak var lbop: UILabel!
    @IBOutlet weak var lbDisplayData: UILabel!
    @IBAction func clear(_ sender: UIButton) {
        curData=0
        isInputDigit=false
    }
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
    @IBAction func addOpt(_ sender: UIButton) {
        optStr2=sender.currentTitle!
        lbop.text=optStr2
        
    }
    @IBAction func appendOpt(_ sender: UIButton) {
        switch optStr2 {
        case "√":
            if curData<0{
                lbwarning.text="负数不能开根号,请更换其他数字"
            }else{
                curData=sqrt(curData)
                optStr2=" "
                lbop.text=" "
            }
            
        case "1/x":
            curData=1/curData
            optStr2=" "
            lbop.text=" "
        default:
            break
        }
        lastData=curData
        optStr=sender.currentTitle!
        isInputDigit=false
    }
    
    @IBAction func doOpt(_ sender: UIButton) {
        switch optStr2 {
        case "√":
            if curData<0{
                lbwarning.text="负数不能开根号,请更换其他数字"
            }else{
                curData=sqrt(curData)
            }
            
        case "1/x":
            if curData==0{
                lbwarning.text="除数不能为0,请更换其他数字"
            }else{
                curData=1/curData
                
            }
            
        default:
            break
        }
        switch optStr {
        case "+":
            curData=curData+lastData
        case "-":
            curData=lastData-curData
        case "*":
            curData=lastData*curData
        case "/":
            if curData==0{
                lbwarning.text="除数不能为0,请更换其他数字"
            }else{
                curData=lastData/curData
            }
        
        
        default:
            break
        }
        optStr=" "
        optStr2=" "
        lbop.text=" "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

