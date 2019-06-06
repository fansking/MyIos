//
//  AddViewController.swift
//  课程通讯录
//
//  Created by 漪简一繁 on 2019/6/6.
//  Copyright © 2019 吕若凡. All rights reserved.
//

import UIKit
import CoreData
class AddViewController: UIViewController {

    @IBOutlet weak var nameTXT: UITextField!
    
    @IBOutlet weak var stdTXT: UITextField!
    
    @IBOutlet weak var dpartTXT: UITextField!
    
    @IBOutlet weak var idenTXT: UITextField!
    
    @IBOutlet weak var birthTXT: UITextField!
    
    @IBOutlet weak var mobileTXT: UITextField!
    
    @IBOutlet weak var emailTXT: UITextField!
    
    var name:String = ""

    
    
    
    
    
    @IBAction func saveClick(_ sender: Any) {
        
        saveUser()
        
    }
    
    
    @IBAction func returnInfo(_ sender: Any) {
        self.performSegue(withIdentifier: "toInfo", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取管理的数据上下文 对象
        
        
        initUser()
        // Do any additional setup after loading the view.
    }
    
    //从SQLite加载数据
    func initUser() {
        if name != "" {
            
            nameTXT.isUserInteractionEnabled = false
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
        
            //声明数据的请求
            let fetchRequest = NSFetchRequest<Student>(entityName:"Student")
            let predicate = NSPredicate(format: "name= %@ ", name)
            fetchRequest.predicate = predicate
      
            do {
                let fetchedObjects = try context.fetch(fetchRequest)
                if (fetchedObjects.count>0){
                    let info=fetchedObjects[0]
                    
                    nameTXT.text = info.name
                    stdTXT.text = info.sno
                    dpartTXT.text = info.major
                    idenTXT.text = info.sid
                    birthTXT.text = info.place
                    mobileTXT.text = info.phone
                    emailTXT.text = info.email
                }else{
                    
                    
                }
                
            }
            catch {
              
            }
        
        }
        
    }
    
  
    func saveUser() {
        if name != ""{
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            
            //声明数据的请求
            let fetchRequest = NSFetchRequest<Student>(entityName:"Student")
            let predicate = NSPredicate(format: "name= %@ ", name)
            fetchRequest.predicate = predicate
            
            do {
                let fetchedObjects = try context.fetch(fetchRequest)
                if (fetchedObjects.count>0){
                    let student=fetchedObjects[0]
                    
                    student.name = self.nameTXT.text!
                    student.sno = self.stdTXT.text!
                    student.place = self.dpartTXT.text!
                    student.sid = self.idenTXT.text!
                    student.place = self.birthTXT.text!
                    student.phone = self.mobileTXT.text!
                    student.email = self.emailTXT.text!
                    
                }
                try! context.save()
                
            }
            catch {
                
            }
        }else{
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            
            //创建User对象
            let student = NSEntityDescription.insertNewObject(forEntityName: "Student",
                                                              into: context) as! Student
            
            
            
            student.name = self.nameTXT.text!
            student.sno = self.stdTXT.text!
            student.place = self.dpartTXT.text!
            student.sid = self.idenTXT.text!
            student.place = self.birthTXT.text!
            student.phone = self.mobileTXT.text!
            student.email = self.emailTXT.text!
            
            do {
                try context.save()
                let alertController = UIAlertController(title: "提示", message: "保存成功", preferredStyle:.alert)
                
                // 设置2个UIAlertAction
                let cancelAction = UIAlertAction(title: "好的", style: .cancel, handler: nil)
                
                
                
                // 添加
                alertController.addAction(cancelAction)
                
                
                // 弹出
                self.present(alertController, animated: true, completion: nil)
            } catch {
                fatalError("不能保存：\(error)")
            }

        }
        
        
    }
    
    @IBAction func remove(_ sender: Any) {
        if name != ""{
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            
            //声明数据的请求
            let fetchRequest = NSFetchRequest<Student>(entityName:"Student")
            let predicate = NSPredicate(format: "name= %@ ", name)
            fetchRequest.predicate = predicate
            
            do {
                let fetchedObjects = try context.fetch(fetchRequest)
                if (fetchedObjects.count>0){
                    let student=fetchedObjects[0]
                    
                    context.delete(student)

                    
                }
                try! context.save()
                let alertControl = UIAlertController(title: "提示消息", message: "删除成功！", preferredStyle: UIAlertController.Style.alert)
                let okAction  = UIAlertAction(title: "好的",
                                              style:UIAlertAction.Style.default, handler: nil)
                
                alertControl.addAction(okAction)
                
                self.present(alertControl, animated: true, completion: nil)
                
            }
            catch {
                
            }
        }else{
            let alertControl = UIAlertController(title: "提示消息", message: "需要在信息页面跳入才能删除", preferredStyle: UIAlertController.Style.alert)
            let okAction  = UIAlertAction(title: "好的",
                                          style:UIAlertAction.Style.default, handler: nil)
            
            alertControl.addAction(okAction)
            
            self.present(alertControl, animated: true, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
