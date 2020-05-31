//
//  AddToDoViewController.swift
//  ToDoListPractice
//
//  Created by Kamryn Ohly on 5/31/20.
//  Copyright © 2020 Kamryn Ohly. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    var previousVC = ToDoListController()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    
    }
    

    @IBAction func addTapped(_ sender: UIButton) {
        
//        let toDo = ToDo()
//        if let textTitle = titleTextField.text {
//            toDo.name = textTitle
//            toDo.important = importantSwitch.isOn
//        }
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)
            
            if let titleText = titleTextField.text {
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }
            
            
            try? context.save()
                   
            navigationController?.popViewController(animated: true)
        }
       
        
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
