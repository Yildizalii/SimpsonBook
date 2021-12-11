//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Ali on 23.11.2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var chosenSimpson : simpson?

var mySimpsons = [simpson]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    
    
       
        
        let homer = simpson(nameInıt: "Homer Simpson", jobInıt: "Nuclear Safety", imageInıt: UIImage(named: "Homer Simpson")!)
        let bart = simpson(nameInıt: "Bart Simpson", jobInıt: "Student", imageInıt: UIImage(named: "Bart Simpson")!)
        let marge = simpson(nameInıt: "Marge Simpson", jobInıt: "Housewife", imageInıt: UIImage(named: "Marge Simpson")!)
        let lisa = simpson(nameInıt: "Lisa Simpson", jobInıt: "Student", imageInıt: UIImage(named: "lisa simpson")!)
        let maggie = simpson(nameInıt: "Maggie Simpson", jobInıt: "Nuclear Safety", imageInıt: UIImage(named: "maggie simpson")!)

        mySimpsons.append(homer)
        mySimpsons.append(bart)
        mySimpsons.append(marge)
        mySimpsons.append(lisa)
       mySimpsons.append(maggie)


    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            mySimpsons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
            
        }
        
    }
    
    
        }


