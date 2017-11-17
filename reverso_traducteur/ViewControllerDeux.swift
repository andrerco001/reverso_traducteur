// ViewControllerDeux.swift
//--------------------
import UIKit
//-------------------- - Section View Controller Deux
class ViewControllerDeux: UIViewController {

    // ---- Variables aux Text Field

    @IBOutlet weak var fr: UITextField!
    @IBOutlet weak var en: UITextField!

    // ---- Variables aux tableaus de String arrFrench et arrEnglish
    var arrFrench: [String]!
    var arrEnglish: [String]!

    //-------------------- - Section viewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        managerUser()
    }

    //-------------------- Bouton pour ajouter tous les mots français et anglais
    @IBAction func add(_ sender: UIButton) {
        arrFrench.append(fr.text!)
        arrEnglish.append(en.text!)
        UserDefaults.standard.set(arrFrench, forKey: "french")
        UserDefaults.standard.set(arrEnglish, forKey: "english")
    }

    //------------------------- Manager User va changer les mots
    func managerUser() {
        if UserDefaults.standard.object(forKey: "french") != nil {
            arrFrench = UserDefaults.standard.object(forKey: "french") as! [String]
            arrEnglish = UserDefaults.standard.object(forKey: "english") as! [String]
        } else {
            arrFrench = [String]()
            arrEnglish = [String]()
            
        }
    }
    //---------------------
}

