//
//  loginController.swift
//  课程通讯录
//
//  Created by 漪简一繁 on 2019/6/6.
//  Copyright © 2019 吕若凡. All rights reserved.
//

import UIKit
import CoreData
class loginController:  UIViewController {
    
    @IBOutlet weak var nameTXT: UILabel!
    
    @IBOutlet weak var passTXT: UILabel!
    
    @IBOutlet weak var nameEnter: UITextField!
    
    @IBOutlet weak var passEnter: UITextField!
    
    
    @IBAction func LoginButton(_ sender: Any) {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        
        if nameEnter.text == "" || passEnter.text == ""{
            let alertControl = UIAlertController(title: "提示消息", message: "账号或密码不能为空 ", preferredStyle: UIAlertController.Style.alert)
            let okAction  = UIAlertAction(title: "好的",
                                          style:UIAlertAction.Style.default, handler: nil)
            
            alertControl.addAction(okAction)
            self.present(alertControl, animated: true, completion: nil)
        }
        else{

            do {
                let fetchRequest = NSFetchRequest<User>(entityName:"User")
                 let predicate = NSPredicate(format: "account= %@ ", nameEnter.text!)
                fetchRequest.predicate = predicate
                let fetchedObjects = try context.fetch(fetchRequest)
                if (fetchedObjects.count > 0){
                    if fetchedObjects[0].password==passEnter.text{
                        
                        self.performSegue(withIdentifier: "toInfo", sender: self)
                        
                    }else{
                        let alertControl = UIAlertController(title: "提示消息", message: "用户名或密码错误", preferredStyle: UIAlertController.Style.alert)
                        let okAction  = UIAlertAction(title: "好的",
                                                      style:UIAlertAction.Style.default, handler: nil)
                        
                        alertControl.addAction(okAction)
                        
                        self.present(alertControl, animated: true, completion: nil)
                    }
                   
                    
                }else{
                    let alertControl = UIAlertController(title: "提示消息", message: "此用户不存在", preferredStyle: UIAlertController.Style.alert)
                    let okAction  = UIAlertAction(title: "好的",
                                                  style:UIAlertAction.Style.default, handler: nil)
                    
                    alertControl.addAction(okAction)
                    
                    self.present(alertControl, animated: true, completion: nil)
                    
                }
                
            }
            catch {
                let alertController = UIAlertController(title: "提示", message: "访问数据库出错", preferredStyle:.alert)

                let cancelAction = UIAlertAction(title: "好的", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)

                self.present(alertController, animated: true, completion: nil)
            }
        }

    }
    
    
    @IBAction func register(_ sender: Any) {
        if nameEnter.text == "" || passEnter.text == ""
        {
            let alertControl = UIAlertController(title: "提示消息", message: "账号或密码不能为空 ", preferredStyle: UIAlertController.Style.alert)
            let okAction  = UIAlertAction(title: "好的",
                                                                       style:UIAlertAction.Style.default, handler: nil)

            alertControl.addAction(okAction)
            self.present(alertControl, animated: true, completion: nil)
            
       
        }else{
            // Do any additional setup after loading the view, typically from a nib.
            let app = UIApplication.shared.delegate as! AppDelegate
            let context = app.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<User>(entityName:"User")
            let predicate = NSPredicate(format: "account= %@ ", nameEnter.text!)
            fetchRequest.predicate = predicate
            do{
            let fetchedObjects = try context.fetch(fetchRequest)
                if fetchedObjects.count>0{
                    let alertControl = UIAlertController(title: "提示消息", message: "该用户已存在", preferredStyle: UIAlertController.Style.alert)
                    let okAction  = UIAlertAction(title: "好的",
                                                  style:UIAlertAction.Style.default, handler: nil)
                    
                    alertControl.addAction(okAction)
                    
                    self.present(alertControl, animated: true, completion: nil)
                    
                }else{
                    let user = NSEntityDescription.insertNewObject(forEntityName: "User",
                                                                   into: context) as! User

                    
                    user.account=nameEnter.text!
                    user.password=passEnter.text!
                    //保存
                    do {
                        try context.save()
                        print("保存成功！")
                        let alertControl = UIAlertController(title: "提示消息", message: "保存成功！", preferredStyle: UIAlertController.Style.alert)
                        let okAction  = UIAlertAction(title: "好的",
                                                      style:UIAlertAction.Style.default, handler: nil)
                        
                        alertControl.addAction(okAction)
                        
                        self.present(alertControl, animated: true, completion: nil)
                    } catch {
                        fatalError("不能保存：\(error)")
                    }
                }
            }catch{
                
            }
            //        //创建User对象
            
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

