//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Darianne Salinas on 6/1/22.
//

import UIKit

class EntryDetailViewController: UIViewController {

    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var bodyTextView: UITextView!
    
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func clearAllButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextView.text, !body.isEmpty else { return }
        //check if the optional entry property holds an entry.
        //add a print statement that says “to be implemented tomorrow”.
        if let entry = entry {
            print("to be implemented tomorrow")
            
            //call the createEntryWith() function that lives on the EntryController
        } else {
            EntryController.shared.createEntryWith(title: title, body: body)
        }
        navigationController?.popViewController(animated: true)
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    //Add an updateViews() function that checks if the optional entry property holds an entry (hint: use a guard statement to do this). If it does, implement the function to update all view elements that reflect details about the model object entry (in this case, the titleTextField and bodyTextView)
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.body
    }
    
}
