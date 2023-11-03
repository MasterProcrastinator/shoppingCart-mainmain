//
//  ViewController.swift
//  shoppingCart
//
//  Created by ALVIN CHEN on 11/2/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var checker = false
    
    let alert = UIAlertController(title: "Error", message: "Duplicate Found", preferredStyle: .alert)
    
    let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    
    let defaults = UserDefaults.standard
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

            list.remove(at: indexPath.row)

            tableViewOutlet.reloadData()
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
//blah
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    var list = ["Item", "Item2", "Item3"]
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        list = defaults.stringArray(forKey: "theList") ?? ["Item", "Item2", "Item3"]
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        alert.addAction(alertAction)
    }

    
    @IBAction func addAction(_ sender: UIButton) {
        for item in list{
            if (item == textFieldOutlet.text!){
                checker = true
            }
        }
        
        if(checker == false){ list.append(textFieldOutlet.text!)
        }
        else{
            present(alert, animated: true, completion: nil)
        }
        checker = false
        tableViewOutlet.reloadData()
    }
    
    
    @IBAction func saveAction(_ sender: UIButton) {
        defaults.set(list, forKey: "theList")
        
    }
    
    @IBAction func sortAction(_ sender: UIButton) {
        list = list.sorted{$0.localizedCompare($1) == .orderedAscending}
        print(list)
        tableViewOutlet.reloadData()
        
    }
    
    
    
    
    
    

}

