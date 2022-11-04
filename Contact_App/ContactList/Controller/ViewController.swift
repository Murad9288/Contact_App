//
//  ViewController.swift
//  CustomTableView
//
// Created by MD Murad Hossain on 16/10/22.

// MARK: Email: murahossaim01@gmail.com
//

import UIKit
import ContactsUI

struct Contact {
    
    var name: String
    var number: String
    
}

struct ContactsGroup {
    
    var head: String
    var contacts: [Contact]
}


class ViewController: UIViewController {
    
    var contacts = [
        Contact(name: "Engr Mohammad Selim", number: "+880 1748573920"),
        Contact(name: "Engr Sajedul Islam", number: "+880 1648573920"),
        Contact(name: "Al-Amin Mridha", number: "+880 1848573921"),
        Contact(name: "Marufur Rahman", number: "+880 1948573922"),
        Contact(name: "Halal Uddin", number: "+880 1648573923"),
        Contact(name: "Hosne Mobarok", number: "+880 1548573924"),
        Contact(name: "Chinmoy Biswas", number: "+880 1748573925"),
        Contact(name: "Tarif Khan", number: "+880 1748573926"),
        Contact(name: "Muhammad Yasin", number: "+880 1348573927"),
        Contact(name: "Murad Hossain", number: "+880 1448573928"),
        Contact(name: "Abul Kashem", number: "+880 1548573929"),
        Contact(name: "Monir Hossain", number: "+880 1648573930"),
        Contact(name: "Prithom Das", number: "+880 1848573931"),
        Contact(name: "Faysal Ahmed", number: "+880 1948573932"),
        Contact(name: "", number: "+880 1234593804"),
        Contact(name: "Diploma Engineer", number : "")
        
    ]
    
    var contactsGroups = [
        ContactsGroup(head: "A", contacts: []),
        ContactsGroup(head: "B", contacts: []),
        ContactsGroup(head: "C", contacts: []),
        ContactsGroup(head: "D", contacts: []),
        ContactsGroup(head: "E", contacts: []),
        ContactsGroup(head: "F", contacts: []),
        ContactsGroup(head: "G", contacts: []),
        ContactsGroup(head: "H", contacts: []),
        ContactsGroup(head: "I", contacts: []),
        ContactsGroup(head: "J", contacts: []),
        ContactsGroup(head: "K", contacts: []),
        ContactsGroup(head: "L", contacts: []),
        ContactsGroup(head: "M", contacts: []),
        ContactsGroup(head: "N", contacts: []),
        ContactsGroup(head: "O", contacts: []),
        ContactsGroup(head: "P", contacts: []),
        ContactsGroup(head: "Q", contacts: []),
        ContactsGroup(head: "R", contacts: []),
        ContactsGroup(head: "S", contacts: []),
        ContactsGroup(head: "T", contacts: []),
        ContactsGroup(head: "U", contacts: []),
        ContactsGroup(head: "V", contacts: []),
        ContactsGroup(head: "W", contacts: []),
        ContactsGroup(head: "X", contacts: []),
        ContactsGroup(head: "Y", contacts: []),
        ContactsGroup(head: "Z", contacts: [])
    ]

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        namesGrouping()
        
        /// setup add button ui
        addButton.layer.cornerRadius = addButton.frame.size.width/2
       

    }
    
    func namesGrouping() {
        for i in 0...contacts.count-1 {
            
            let ch: Character = (contacts[i].name.first) ?? " "
            let s = String(ch).unicodeScalars           //convert to Unicode
            var ind = Int(s[s.startIndex].value)       //unicode
            
            if (ind >= 97 && ind <= 122) {
                ind -= 97
            }
            else if ((ind < 65 && ind > 122) || (ind > 90 && ind < 97)) {
                ind = 0
            }
            else {
                ind -= 65
            }
            if (ind < 0 || ind > 25) {
                ind = 0
            }
            
            contactsGroups[ind].contacts.append(contacts[i])
        }
    }
    
    func tableViewSetup() {
        
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.separatorColor = .clear
    }
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.6, //button animation style with below 6lines
                       animations: {
            self.addButton.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },
                       completion: { _ in
            UIView.animate(withDuration: 0.6) {
                self.addButton.transform = CGAffineTransform.identity
            }
        })
        //pass to AddNewContact storyboard
        let storyboardName = UIStoryboard(name: "AddContact", bundle: nil)
        let vc = storyboardName.instantiateViewController(withIdentifier: "AddContactController") as! AddContactController
        vc.delegate = self                      //connection with AddContactContro..
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
    

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactsGroups.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsGroups[section].contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        //set corner radius here with below 3lines
        cell.borderView.layer.cornerRadius = 10
        cell.borderView.layer.borderColor = UIColor.black.cgColor
        cell.borderView.layer.borderWidth = 0.1
        cell.selectionStyle = .none
        
        cell.lbl.text = contactsGroups[indexPath.section].contacts[indexPath.row].name //(names[indexPath.section][indexPath.row] as! String)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if (contactsGroups[section].contacts.count == 0) {
            return nil
        }
        return contactsGroups[section].head
    }
    
    //Table view Data pass
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboardName = UIStoryboard(name: "DetailsView", bundle: nil)
        let vc = storyboardName.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        
        vc.modalPresentationStyle = .fullScreen
        
        vc.name = contactsGroups[indexPath.section].contacts[indexPath.row].name //(names[indexPath.section][indexPath.row] as! String)
        vc.number = contactsGroups[indexPath.section].contacts[indexPath.row].number //(numbers[indexPath.section][indexPath.row] as! String)
        
        self.present(vc, animated: true)
    }
    /// remove table view cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            self.contactsGroups[indexPath.section].contacts.remove(at: indexPath.row)
            self.tableView.deleteRows (at: [indexPath], with: .automatic)

//            self.numbers.remove(at: [indexPath.section][indexPath.row])
//            self.names.remove(at: [indexPath.section][indexPath.row])
//            self.tableView.deleteRows (at: [indexPath], with: .automatic)
        }
    }
}


extension ViewController: AddContactDelegate {      //protocol to inherited
    
    func newContact(contact: Contact) {
        
        let ch: Character = (contact.name.first) ?? "A"
        let s = String(ch).unicodeScalars           //convert to Unicode
        var ind = Int(s[s.startIndex].value)       //index
        
        if (ind >= 97 && ind <= 122) {         //For lower case letter
            ind -= 97
        }
        else if ((ind < 65 && ind > 122) || (ind > 90 && ind < 97)) {
            ind = 0
        }
        else {
            ind -= 65
        }
        if (ind < 0 || ind > 25) {
            ind = 0
        }
            
        contactsGroups[ind].contacts.append(contact) //name&numbers bth append

        tableView.reloadData()
    }
    
}
