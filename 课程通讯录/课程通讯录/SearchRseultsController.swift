//
//  SearchRseultsController.swift
//  课程通讯录
//
//  Created by 客人用户 on 2019/4/5.
//  Copyright © 2019年 吕若凡. All rights reserved.
//

import UIKit

class SearchRseultsController: UITableViewController ,UISearchResultsUpdating{
    
    
var childrennameDict:[String:[(String,String)]]=[:]
    var filterNames:[String]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "result")
        
    }
    func updateSearchResults(for searchController: UISearchController) {
        let searchText=searchController.searchBar.text
        filterNames.removeAll()
        for pairs in childrennameDict.values{
            for (name,pinyin) in pairs{
                if (pinyin.range(of: searchText!, options: String.CompareOptions.caseInsensitive, range: nil, locale: nil) != nil) {
                    filterNames.append(name)
                }
            }
        }
        tableView.reloadData()
        
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filterNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "result")
        cell!.textLabel?.text = filterNames[indexPath.row]
        return cell!
    }
}
