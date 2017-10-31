//
//  ViewController.swift
//  StudentList
//
//  Created by John Gallaugher on 10/17/17.
//  Copyright © 2017 Gallaugher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var students = ["Matthew A Batsinelas",
                    "Kelsey C Bishop",
                    "Erin E Boyle",
                    "Edward F Burns",
                    "Stephen L Casazza",
                    "Linda S Chen",
                    "Christopher G Chiang",
                    "Vlad I Chilom",
                    "Joshua Concepcion",
                    "Wilberne Dailey",
                    "Charles J Gamer",
                    "Matthew J Giovanniello",
                    "Katherine L Gold",
                    "Vincent S Huang",
                    "Michelle B Krameisen",
                    "Daniel Lu",
                    "Marc A Marlotte",
                    "Kevin P McCoy",
                    "James D McDermott",
                    "Patrick R Mulach",
                    "Arya K Murthi",
                    "Oliver Naser",
                    "Duncan E Parrott",
                    "Paul J Shalhoub",
                    "Kaining Shen",
                    "Mia N Tortolani",
                    "Kevin Wijendra",
                    "Zachary T Wilner",
                    "Dingnan Zhou"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditStudentDetail" {
            let destination = segue.destination as! StudentDetailViewController
            destination.student = students[tableView.indexPathForSelectedRow!.row]
        } else {
            if let selectedPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedPath, animated: true)
            }
        }
    }
    
    @IBAction func unwindFromStudentDetail(segue: UIStoryboardSegue) {
        let source = segue.source as! StudentDetailViewController
        if let selectedPath = tableView.indexPathForSelectedRow {
            students[selectedPath.row] = source.student
            tableView.reloadRows(at: [selectedPath], with: .automatic)
        } else {
            
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = students[indexPath.row]
        return cell
    }
}
