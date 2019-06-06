//
//  ViewController.swift
//  课程通讯录
//
//  Created by 客人用户 on 2019/4/5.
//  Copyright © 2019年 吕若凡. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    
    var allChildrenNames:[String]!=[]
    var childrennameDict:[String:[(String,String)]]=[:]
    var keys:[String]!
    var searchController:UISearchController!
   
   
    @IBAction func returnLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "toLogin", sender: self)
    }
    @IBAction func toAdd(_ sender: Any) {
        self.performSegue(withIdentifier: "toAdd", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

       
        // Do any additional setup after loading the view, typically from a nib.
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest = Student.fetchRequest()
        do {
            let fetchedObjects = try context.fetch(fetchRequest)
            if (fetchedObjects.count>0){
                for info in fetchedObjects{
                    if(info.name == nil){
                     
                    }else{
                        allChildrenNames.append(info.name!)
                    }
                    
                    
                }
                
            }else{
                let alertControl = UIAlertController(title: "提示消息", message: "现在还没有数据", preferredStyle: UIAlertController.Style.alert)
                let okAction  = UIAlertAction(title: "好的",
                                              style:UIAlertAction.Style.default, handler: nil)
                
                alertControl.addAction(okAction)
                
                self.present(alertControl, animated: true, completion: nil)
                
            }
            
        }
        catch {

        }

        allChildrenNames = allChildrenNames.sorted()
        for name in allChildrenNames{
            let pinyin=name.transformToPinyin()
            let sec=pinyin.getHead()
            let ar=childrennameDict[sec]
            if ar==nil {
                childrennameDict[sec]=[(name,pinyin)]
            }else{
                childrennameDict[sec]?.append((name, pinyin))
            }
        }
        keys=childrennameDict.keys.sorted()
        let resultController = SearchRseultsController()
        searchController = UISearchController(searchResultsController: resultController)
        tableView.tableHeaderView = searchController.searchBar
        resultController.childrennameDict=self.childrennameDict
        searchController.searchResultsUpdater = resultController
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        return childrennameDict[key]!.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell")
        let sec = keys[indexPath.section]
        let (name,pinyin)=childrennameDict[sec]![indexPath.row]
        cell?.textLabel?.text=name
        cell?.detailTextLabel?.text=pinyin
        return cell!
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "toAdd2", sender: self)
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toAdd2"  {
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            let name = allChildrenNames[indexPath.row]
            let destinationController = segue.destination as! AddViewController
            destinationController.name = name
            
        }
        
    }
  
}

