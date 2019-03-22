//
//  DatePickerViewController.swift
//  Pickers
//
//  Created by user on 2019/3/22.
//  Copyright © 2019年 lrf. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let date=NSDate()
        datePicker.setDate(date as Date, animated: false)

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var datePicker: UIDatePicker!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onButtonPressed(_ sender: UIButton) {
        let date=datePicker.date
        let message="The date and time you selected is \(date)"
        let alert=UIAlertController(
            title:"Date and Time Selected",
            message:message,
            preferredStyle:.alert
        )
        let action = UIAlertAction(
            title:"That's so true!",
            style:.default,
            handler:nil
        )
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
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
