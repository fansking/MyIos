//
//  GradeViewController.swift
//  学生管理系统
//
//  Created by 漪简一繁 on 2019/6/6.
//  Copyright © 2019 吕若凡. All rights reserved.
//

import UIKit
import CoreData
class GradeViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var english: UITextField!
    @IBOutlet weak var chinese: UITextField!
    @IBOutlet weak var math: UITextField!
    @IBOutlet weak var computer: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text=""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func update(_ sender: Any) {
        if name.text! != ""{
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            
            //声明数据的请求
            let fetchRequest = NSFetchRequest<Grades>(entityName:"Grades")
            let predicate = NSPredicate(format: "sname= %@ ", name.text!)
            fetchRequest.predicate = predicate
            
            do {
                let fetchedObjects = try context.fetch(fetchRequest)
                if (fetchedObjects.count>0){
                    let grade=fetchedObjects[0]
                    grade.chinese = Int32(chinese.text!)!
                    grade.english = Int32(english.text!)!
                    grade.computer=Int32(computer.text!)!
                    grade.math = Int32(math.text!)!
                    try! context.save()
                }else{
                    let app = UIApplication.shared.delegate as! AppDelegate
                    let context = app.persistentContainer.viewContext
                    
                    //创建User对象
                    let grade = NSEntityDescription.insertNewObject(forEntityName: "Grades",
                                                                    into: context) as! Grades
                    grade.chinese = Int32(chinese.text!)!
                    grade.english = Int32(english.text!)!
                    grade.computer=Int32(computer.text!)!
                    grade.math = Int32(math.text!)!
                    grade.sname = name.text!
                    do {
                        try context.save()
                        let alertControl = UIAlertController(title: "提示消息", message: "保存成功", preferredStyle: UIAlertController.Style.alert)
                        let okAction  = UIAlertAction(title: "好的",
                                                      style:UIAlertAction.Style.default, handler: nil)
                        
                        alertControl.addAction(okAction)
                        
                        self.present(alertControl, animated: true, completion: nil)
                    } catch {
                        fatalError("不能保存：\(error)")
                    }
                }
                
                
            }
            catch {
                
            }
        }else{
            let alertControl = UIAlertController(title: "提示消息", message: "请先输入学生姓名", preferredStyle: UIAlertController.Style.alert)
            let okAction  = UIAlertAction(title: "好的",
                                          style:UIAlertAction.Style.default, handler: nil)
            
            alertControl.addAction(okAction)
            
            self.present(alertControl, animated: true, completion: nil)
            
        }
    }
    @IBAction func search(_ sender: Any) {
        if name.text! != "" {
            
            
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            
            //声明数据的请求
            let fetchRequest = NSFetchRequest<Grades>(entityName:"Grades")
            let predicate = NSPredicate(format: "sname= %@ ", name.text!)
            fetchRequest.predicate = predicate
            
            do {
                let fetchedObjects = try context.fetch(fetchRequest)
                if (fetchedObjects.count>0){
                    let grade=fetchedObjects[0]
                    chinese.text=String(grade.chinese)
                    english.text=String(grade.english)
                    math.text=String(grade.math)
                    computer.text=String(grade.computer)
                }else{
                    let alertControl = UIAlertController(title: "提示消息", message: "数据库无此学生成绩信息，请先保存数据", preferredStyle: UIAlertController.Style.alert)
                    let okAction  = UIAlertAction(title: "好的",
                                                  style:UIAlertAction.Style.default, handler: nil)
                    
                    alertControl.addAction(okAction)
                    
                    self.present(alertControl, animated: true, completion: nil)
                }
                
                
            }
            catch {
                
            }
        }else{
            let alertControl = UIAlertController(title: "提示消息", message: "请先输入学生姓名", preferredStyle: UIAlertController.Style.alert)
            let okAction  = UIAlertAction(title: "好的",
                                          style:UIAlertAction.Style.default, handler: nil)
            
            alertControl.addAction(okAction)
            
            self.present(alertControl, animated: true, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
