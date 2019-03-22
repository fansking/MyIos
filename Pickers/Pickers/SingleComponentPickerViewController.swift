//
//  SingleComponentPickerViewController.swift
//  Pickers
//
//  Created by user on 2019/3/22.
//  Copyright © 2019年 lrf. All rights reserved.
//

import UIKit

class SingleComponentPickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

   
    @IBOutlet weak var singlePicker: UIPickerView!
    private let characterNames=["Luke","Leia","Han","Chewbacca","Artoo","Threepio","Lando"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let row=singlePicker.selectedRow(inComponent:0)
        let selected=characterNames[row]
        let title="your aelected \(selected)!"
        let alert=UIAlertController(
            title:title,
            message:"Thank you for choosing",
            preferredStyle:.alert
        )
        let action = UIAlertAction(
            title:"You are welcom",
            style:.default,
            handler:nil
        )
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return characterNames.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int,forCompent component: Int) -> String {
        return characterNames[row]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
