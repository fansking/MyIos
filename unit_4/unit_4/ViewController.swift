//
//  ViewController.swift
//  unit_4
//
//  Created by user on 2019/3/8.
//  Copyright © 2019年 lrf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderLabel.text="50"
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBOutlet weak var doSomethingButton: UIButton!
    @IBAction func textFieldDoneEditing(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    /*@IBAction func onTapGestureRecongnized(_ sender: AnyObject) {
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }*/
    @IBAction func sliderChanged(_ sender: UISlider) {
        sliderLabel.text="\(lroundf(sender.value))"
    }
    
    @IBAction func togleControls(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex==0{
            leftSwitch.isHidden=false
            rightSwitch.isHidden=false
            doSomethingButton.isHidden=true
        }else{
            leftSwitch.isHidden=true
            rightSwitch.isHidden=true
            doSomethingButton.isHidden=false
        }
    }
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let controller=UIAlertController(title:"Are You Sure?",message:nil,preferredStyle: .actionSheet)
        let yesAction=UIAlertAction(title:"Yes,I'm sure! Sure?",style: .destructive,handler:{
            action in
            let msg=self.nameField.text!.isEmpty
                ?"you can breathe easy,everything went ok."
                :"you can breathe easy,\(self.nameField.text ?? ""),"+"everything went ok."
            let controller2=UIAlertController(
                title:"Something was Done",
                message:msg,preferredStyle: .alert)
            let cancelAction=UIAlertAction(
                title:"Phew!",
                style:.cancel,
                handler:nil)
            controller2.addAction(cancelAction)
            
            self.present(controller2,animated: true,completion: nil)
        })
        
        let noAction=UIAlertAction(
            title:"no way!",
            style:.cancel,
            handler:nil)
        controller.addAction(yesAction)
        controller.addAction(noAction)
        if let ppc=controller.popoverPresentationController{
            ppc.sourceView=sender
            ppc.sourceRect=sender.bounds
        }
        present(controller,animated: true,completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        let setting=sender.isOn
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    
}

