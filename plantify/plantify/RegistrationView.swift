//
//  RegistrationView.swift
//  plantify
//
//  Created by Екатерина Алейник on 18.05.25.
//

import Foundation

import UIKit

var loginSave = String()
var passwordSave = String()
var rpasswordSave = String()
var citySave = String()

class RegistrationView: UIViewController{
    @IBOutlet weak var imageWelcome: UIImageView!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var rpassword: UITextField!
    @IBOutlet weak var viewMapButton: UIButton!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var pageSwitcher: UISegmentedControl!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "";
        imageWelcome.image = UIImage(named: "welcome")
        login.text = loginSave
        password.text = passwordSave
        rpassword.text = rpasswordSave
        address.text = citySave
            pageSwitcher.setTitle(NSLocalizedString("sign in", comment: ""), forSegmentAt: 0)
            pageSwitcher.setTitle(NSLocalizedString("sign up", comment: ""), forSegmentAt: 1)
            signUpButton.setTitle(NSLocalizedString("sign up", comment: ""), for: .normal)
            signUpButton.layer.cornerRadius = 10
            viewMapButton.setTitle(NSLocalizedString("view map", comment: ""), for: .normal)
            viewMapButton.layer.cornerRadius = 7
            login.placeholder = NSLocalizedString("login", comment: "")
            password.placeholder = NSLocalizedString("password", comment: "")
            rpassword.placeholder = NSLocalizedString("repeat password", comment: "")
    }
    @IBAction func viewMap(_ sender: Any) {
        loginSave = login.text ?? ""
        passwordSave = password.text ?? ""
        rpasswordSave = rpassword.text ?? ""
        citySave = address.text ?? ""
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondVC = storyboard.instantiateViewController(identifier: "MapViewController") as MapViewController
                    
                    secondVC.modalPresentationStyle = .fullScreen
                    secondVC.modalTransitionStyle = .crossDissolve
                    
                    present(secondVC, animated: true, completion: nil)
    }
    @IBAction func switchPage(_ sender: Any) {
        if pageSwitcher.selectedSegmentIndex == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let secondVC = storyboard.instantiateViewController(identifier: "ViewController")
                        
                        secondVC.modalPresentationStyle = .fullScreen
                        secondVC.modalTransitionStyle = .crossDissolve
                        
                        present(secondVC, animated: true, completion: nil)
            // zagruzka
        }
    }
    @IBAction func signUpClick(_ sender: Any) {
        let path = Bundle.main.path(forResource: "userData", ofType: "plist")

        let plist = NSMutableDictionary(contentsOfFile: path!)
        
        let pass = plist?.value(forKey: login.text!)

        if pass != nil {
            resultLabel.text = NSLocalizedString("Login unavailable!", comment: "")
        }
        else if login.text == "" || password.text == "" || rpassword.text != password.text || address.text == "" {
            resultLabel.text = NSLocalizedString("Incorrect data!", comment: "")
        }
        else{
                    let plist = NSMutableDictionary(contentsOfFile: path!)
                    plist?.setObject(password.text, forKey: login.text as! NSCopying)
                    plist?.write(toFile: path!, atomically: true)
            
            let path_city = Bundle.main.path(forResource: "userCity", ofType: "plist")!
                        let plist2 = NSMutableDictionary(contentsOfFile: path_city)
                        plist2?.setObject(address.text, forKey: login.text as! NSCopying)
                        plist2?.write(toFile: path_city, atomically: true)
            
            resultLabel.text = "Registrate succesfully!"
            loginSave = ""
            passwordSave = ""
            rpasswordSave = ""
            citySave = ""
        
            let path_plants = Bundle.main.path(forResource: "usersPlants", ofType: "plist")!

            let dictionary = NSMutableDictionary(contentsOfFile: path_plants)
            let arr = [String]()
            dictionary?.setObject(arr, forKey: "plants_\(login.text!)" as NSCopying)
            dictionary?.write(toFile: path_plants, atomically: true)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let secondVC = storyboard.instantiateViewController(identifier: "ViewController")
                        
                        secondVC.modalPresentationStyle = .fullScreen
                        secondVC.modalTransitionStyle = .crossDissolve
                        
                        present(secondVC, animated: true, completion: nil)
        }
    }
}
