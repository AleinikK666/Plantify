//
//  ViewController.swift
//  plantify
//
//  Created by Екатерина Алейник on 18.05.25.
//

import UIKit

var current_user = String()


class ViewController: UIViewController {

    @IBOutlet weak var login_scene1: UITextField!
    @IBOutlet weak var switcherLabel: UISegmentedControl!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var password_scene1: UITextField!
    @IBOutlet weak var imageStart: UIImageView!
    @IBAction func movePage(_ sender: Any) {
        if switcherLabel.selectedSegmentIndex == 1 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let secondVC = storyboard.instantiateViewController(identifier: "RegistrationView")
                        
                        secondVC.modalPresentationStyle = .fullScreen
                        secondVC.modalTransitionStyle = .crossDissolve
                        
                        present(secondVC, animated: true, completion: nil)
            // zagruzka
        }
    }
    @IBOutlet weak var signButton: UIButton!
    @IBAction func buttonSignIn(_ sender: Any) {
        let path = Bundle.main.path(forResource: "userData", ofType: "plist")
        
                let plist = NSMutableDictionary(contentsOfFile: path!)
                
                let pass = plist?.value(forKey: login_scene1.text!)

                if (pass == nil){
                    labelResult.text = "No such user!"
                 
                }
                else if (pass as! String != password_scene1.text){
                    labelResult.text = "Incorrect login or password!"
                }
                else{
                    current_user = login_scene1.text ?? "user"
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let secondVC = storyboard.instantiateViewController(identifier: "ProfileView")
                                
                                secondVC.modalPresentationStyle = .fullScreen
                                secondVC.modalTransitionStyle = .crossDissolve
                                
                                present(secondVC, animated: true, completion: nil)
                   
                }
       
    }
    @IBAction func signButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        labelResult.text = "";
        imageStart.image = UIImage(named: "welcome")
        // Do any additional setup after loading the view.
        switcherLabel.setTitle(NSLocalizedString("sign in", comment: ""), forSegmentAt: 0)
        switcherLabel.setTitle(NSLocalizedString("sign up", comment: ""), forSegmentAt: 1)
        signButton.setTitle(NSLocalizedString("sign in", comment: ""), for: .normal)
        signButton.layer.cornerRadius = 10
        login_scene1.placeholder = NSLocalizedString("login", comment: "")
        password_scene1.placeholder = NSLocalizedString("password", comment: "")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }

}

