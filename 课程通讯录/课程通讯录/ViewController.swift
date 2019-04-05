//
//  ViewController.swift
//  课程通讯录
//
//  Created by 客人用户 on 2019/4/5.
//  Copyright © 2019年 吕若凡. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    
    var allChildrenNames:[String]!
    var childrennameDict:[String:[(String,String)]]=[:]
    var keys:[String]!
    var searchController:UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url=Bundle.main.url(forResource: "children", withExtension: "plist")
        allChildrenNames=(NSArray(contentsOf: url!) as? [String])?.sorted()
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
}

