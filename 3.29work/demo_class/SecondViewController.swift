//
//  SecondViewController.swift
//  zzz
//
//  Created by gjh on 2019/3/29.
//  Copyright © 2019 gjh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    let names = ["aaa","bbb","ccccc"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = XXTableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "id")
        cell.nameLabel?.text = names[indexPath.row]
        cell.colorLabel?.text = "color"+names[indexPath.row]
        if indexPath.row<2 {
            cell.detailTextLabel?.text="suck me"
        }else{
            cell.detailTextLabel?.text="fuck me"
        }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

