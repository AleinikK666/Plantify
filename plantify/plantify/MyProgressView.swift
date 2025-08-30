//
//  MyProgressView.swift
//  plantify
//
//  Created by Екатерина Алейник on 18.05.25.
//


import UIKit


var collectedPlants = 0

class MyProgressView : UIViewController{
   
    @IBAction func swipeGo(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondVC = storyboard.instantiateViewController(identifier: "ProfileView") 
                    
                    secondVC.modalPresentationStyle = .fullScreen
                    secondVC.modalTransitionStyle = .crossDissolve
                    
                    present(secondVC, animated: true, completion: nil)
        
    }
    @IBOutlet var swipe: UISwipeGestureRecognizer!
    @IBOutlet weak var myLab: UILabel!
    @IBOutlet weak var lab: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var percent : Double = 100.0 * Double(collectedPlants) / 6
        lab.frame = CGRect(x:16, y:156, width: 370, height:620)
        myLab.frame = CGRect(x:16,y:230 + 600 - 600*(percent / 100),width: 370, height: 620*(percent / 100))
        if (percent < 1){
            lab.text = String(Int(percent)) + "%"
        }
        else{
        myLab.text = String(Int(percent)) + "%"
            lab.text = ""
        }
    }
}
