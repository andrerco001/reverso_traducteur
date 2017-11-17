// ViewController.swift
// reverso_traducteur
// Created by Andre Oliveira on 17-11-15.
// Copyright © 2017 andre. All rights reserved.
//--------------------
import UIKit
//-------------------- Section class - partie plus important du code
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //---- Section variables aux boutons
    @IBOutlet weak var butfrench: UIButton!
    @IBOutlet weak var butenglish: UIButton!
    @IBOutlet weak var tabview: UITableView!
    @IBOutlet weak var result: UILabel!
    //----
    
    // ---- Variable boutons Français et Anglais
    var buttons: [UIButton]! //action aux butons français et anglais
    
    //---- Section des variables - deuxième View Controller
    var arrFrench: [String]!
    var arrEnglish: [String]!
    var dict: [String: String]!
    var keys: [String]!
    //----
    
    //-------------------- Section viewDidLoad
        override func viewDidLoad() {
        super.viewDidLoad()
        managerUser()
        dict = Dictionary(uniqueKeysWithValues: zip(arrFrench, arrEnglish))
        buttons = [butfrench, butenglish]
    }
    //--------------------
    
    // ---- Functions première action que va ajouter les mots français et anglais
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFrench.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        keys = [String](dict.keys)
        cell.textLabel?.text = keys[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        result.text = dict[keys[indexPath.row]]
    }
    
    //------------------------ managerUser fera la conversion aux mots françias et anglais
    
    func managerUser() {
        // UserDefaults.standard.removeObject(forKey: "french")
        // UserDefaults.standard.removeObject(forKey: "english")
        if UserDefaults.standard.object(forKey: "french") != nil {
            arrFrench = UserDefaults.standard.object(forKey: "french") as! [String]
            arrEnglish = UserDefaults.standard.object(forKey: "english") as! [String]
        } else {
            arrFrench = [String]()
            arrEnglish = [String]()
        }
    }
    //-------------------
    
    //------------------- Section de la deuxieme action pour montrer les mots du tableau dans la table view
    // ------------------ Bouton action for buttons est responsable pour la ativation aux boutons français et anglais
    @IBAction func actionForButtons(_ sender: UIButton) {
        if sender.alpha == 1.0 {
            return
        }
        for button in buttons {
            if button.alpha == 1.0 {
                button.alpha = 0.5
            } else {
                button.alpha = 1.0
                displayEnglishOrFrench(englishOrFrench: sender.currentTitle!)
            }
        }
    }
    
    //-------------------
    func displayEnglishOrFrench(englishOrFrench: String) {
        if englishOrFrench == "Français" {
            dict = Dictionary(uniqueKeysWithValues: zip(arrFrench, arrEnglish))
            
        } else {
            dict = Dictionary(uniqueKeysWithValues: zip(arrEnglish, arrFrench))
            
        }
        tabview.reloadData()
    }
    //-------------------
}
