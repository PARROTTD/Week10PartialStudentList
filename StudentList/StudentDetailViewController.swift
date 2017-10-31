//
//  StudentDetailViewController.swift
//  StudentList
//
//  Created by John Gallaugher on 10/17/17.
//  Copyright © 2017 Gallaugher. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {

    @IBOutlet weak var studentField: UITextField!
    
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    var student: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let student = student {
            studentField.text = student
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        student = studentField.text
    }

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
