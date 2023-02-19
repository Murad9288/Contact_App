//
//  AddContact.swift
//  ContactList
//
// Created by MD Murad Hossain on 16/10/22.
//

import UIKit
import ContactsUI

protocol AddContactDelegate {           //For Data Sharing to another viewcontroller
    func newContact(contact: Contact)
}

class AddContactController: UIViewController {

    @IBOutlet weak var contactNameTxt: UITextField!
    @IBOutlet weak var phoneNumberTxt: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func BackButton(_ sender: UIBarButtonItem) {
		self.dismiss(animated: true)
    }
    
    
    var delegate: AddContactDelegate?       //sharing type var, due to protocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //saveButton.backgroundColor = .blue
        saveButton.tintColor = .cyan
        
        print(contactNameTxt ?? contactNameTxt!)
        print(phoneNumberTxt ?? phoneNumberTxt!)
    }
    
    @IBAction func saveActionBtn(_ sender: UIButton) {
        
        if let delegate = delegate {
            delegate.newContact(
                contact: Contact(                     //Contact has name&num both
                    name: contactNameTxt.text ?? "",
                    number: phoneNumberTxt.text ?? ""
                )
            )
        }
        self.dismiss(animated: true)
        
//        ViewController.shared?.nmes.append(contactNameTxt)
    }

}
