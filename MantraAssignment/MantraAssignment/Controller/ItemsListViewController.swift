//
//  ItemsListViewController.swift
//  MantraAssignment
//
//  Created by ATLOGYS on 16/03/21.
//

import UIKit

class ItemsListViewController: UITableViewController {
    
    //MARK:- Variables
    var data = [CategoryResponse]()
    let categoryCellIdentifier = "categoryCell"
    let subCategoryCellIdentifier = "subCategoryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: categoryCellIdentifier)
        self.tableView.register(UINib(nibName: "SubCategoryCell", bundle: nil), forCellReuseIdentifier: subCategoryCellIdentifier)
        tableView.tableFooterView = UIView()
        
        getDataFromJson()
    }
    
    //MARK:- Method to get data from json
    func getDataFromJson() {
        
        if let path = Bundle.main.path(forResource: "menu", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                guard let loaded = try? decoder.decode([CategoryResponse].self, from: data) else {
                    fatalError("Failed to decode from bundle.")
                }
                self.data = loaded
                self.tableView.reloadData()
            } catch {
                // handle error
                print("Unexpected error: \(error).")
            }
        }
    }
    
    
    //MARK:- Tableview Delegate and Data Source methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data[section].opened == true {
            return data[section].sub_category!.count + 1
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: categoryCellIdentifier) as! CategoryCell
            cell.categoryLabel.text = data[indexPath.section].name
            if data[indexPath.section].opened == true {
                cell.accessoryImage.image = UIImage(systemName: "chevron.up")
            } else {
                cell.accessoryImage.image = UIImage(systemName: "chevron.down")
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: subCategoryCellIdentifier) as! SubCategoryCell
            cell.lblSubCategory.text = data[indexPath.section].sub_category?[dataIndex].name
            cell.lblDetails.text = data[indexPath.section].sub_category?[dataIndex].display_name
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if data[indexPath.section].opened == true {
                data[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            } else {
                data[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

