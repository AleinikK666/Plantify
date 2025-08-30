//
//  PlantInfoView.swift
//  plantify
//
//  Created by Екатерина Алейник on 18.05.25.
//

import UIKit
var plantName = String()
class PlantInfoView : UIViewController{
    
    @IBOutlet weak var plantNameLabel: UILabel!
    @IBAction func swipe(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondVC = storyboard.instantiateViewController(identifier: "ProfileView")
                    
                    secondVC.modalPresentationStyle = .fullScreen
                    secondVC.modalTransitionStyle = .crossDissolve
                    
                    present(secondVC, animated: true, completion: nil)
    }
   
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var careGuide: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var water: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var size: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        plantName = selectedPlant
        plantNameLabel.text = NSLocalizedString(plantName, comment: "")
        let path = Bundle.main.path(forResource: "plantsData", ofType: "plist")
        let dictionary = NSDictionary(contentsOfFile: path!)
        let data = dictionary?.object(forKey: "plantInfo") as? NSDictionary
        let dictPlant = data?.value(forKey: plantName) as? NSDictionary
        print(plantName)
        let imgName = dictPlant?.object(forKey:     "image") as! String
        let dscr = dictPlant?.object(forKey:     "description") as! String
        let waterText =  dictPlant?.object(forKey:     "water") as! String
        let humidityText =  dictPlant?.object(forKey:     "humidity") as! String
        let sizeText =  dictPlant?.object(forKey:     "size") as! String
        let locationText =  dictPlant?.object(forKey:     "location") as! String
        
        img.image = UIImage(named: imgName )
        descriptionLabel.text = NSLocalizedString(dscr, comment: "")
        descriptionLabel.frame = CGRect(x: 16, y: 415, width: 370, height: 230)
        waterReq.text = NSLocalizedString(waterText, comment: "")
        humidityReq.text = NSLocalizedString(humidityText, comment: "")
        sizeReq.text = NSLocalizedString(sizeText, comment: "")
        locationReq.text = NSLocalizedString(locationText, comment: "")
        
        water.layer.masksToBounds = true
        water.text = ""
        water.layer.cornerRadius = 10
        
        humidity.layer.masksToBounds = true
        humidity.text = ""
        humidity.layer.cornerRadius = 10
        
        location.layer.masksToBounds = true
        location.text = ""
        location.layer.cornerRadius = 10
        
        size.layer.masksToBounds = true
        size.text = ""
        size.layer.cornerRadius = 10
        
        careGuide.text = NSLocalizedString("Care guide", comment: "")
        waterLabel.text = NSLocalizedString("Water", comment: "")
        humidityLabel.text = NSLocalizedString("Humidity", comment: "")
        sizeLabel.text = NSLocalizedString("Size", comment: "")
        locationLabel.text = NSLocalizedString("Location", comment: "")
    }
    @IBOutlet weak var locationReq: UILabel!
    @IBOutlet weak var sizeReq: UILabel!
    @IBOutlet weak var humidityReq: UILabel!
    @IBOutlet weak var waterReq: UILabel!
}
