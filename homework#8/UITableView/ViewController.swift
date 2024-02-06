//
//  ViewController.swift
//  UITableView
//
//  Created by Sergey Kurgansky on 20.01.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    let mainStoryboardName = "Main"
    let secondVCId = "SecondVC"
    
    private var data = [String]()
    private var keys = [Character]()
    private var values = [[String]]()
    private var contacts = [Character: [String]]()
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate =  self
        
    }
    
    @IBAction func addDidTap(_ sender: UIBarButtonItem) {
        
        let mainStoryboard = UIStoryboard(name: mainStoryboardName, bundle: nil)
        guard let secondVC = mainStoryboard.instantiateViewController(withIdentifier: secondVCId) as? SecondVC
            else {return}
        secondVC.saveDataDelegate = self
        present(secondVC, animated: true)
    }
    
    @IBAction func editDidTap(_ sender: UIBarButtonItem) {
        self.tableView.isEditing = !self.tableView.isEditing
        sender.title = (self.tableView.isEditing) ? "Done" : "Edit"
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate, SaveDataDelegate {
    func addPersonToArray(name: String, surname: String) {
        contacts = [Character: [String]]()
        keys = [Character]()
        values = [[String]]()
        data.append("\(name) \(surname)")
        for entry in data {
            if contacts[entry[entry.startIndex]] == nil {
                contacts[entry[entry.startIndex]] = [String]()
            }
            contacts[entry[entry.startIndex]]!.append(entry)
        }
        let sortedContactsArray = contacts.sorted( by: { $0.0 < $1.0 })
        for (key,value) in sortedContactsArray {
            keys.append(key)
            values.append(value)
        }
        self.tableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return values.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values[section].count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(keys[section])

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifire) as? PersonTableViewCell
            else {return UITableViewCell() }
        cell.textLabel?.text = values[indexPath.section][indexPath.row]
            return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let remopvedElement = values[indexPath.section].remove(at: indexPath.row)
            let dataIndex = data.firstIndex(where: {$0 == remopvedElement})
            data.remove(at: dataIndex!)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            if values[indexPath.section].isEmpty {
                values.remove(at: indexPath.section)
                tableView.deleteSections(.init(integer: indexPath.section), with: .automatic)
            }
        }
    }
}

protocol SaveDataDelegate: AnyObject {
    func addPersonToArray(name: String, surname: String)
}

