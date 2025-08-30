//
//  ProfileView.swift
//  plantify
//
//  Created by Екатерина Алейник on 18.05.25.
//

import Foundation
import UIKit


var userCity = String()
class ProfileView : UIViewController{
    @IBOutlet weak var checkProgress: UIButton!
    @IBAction func checkIt(_ sender: Any) {
        collectedPlants = myPlants.count
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondVC = storyboard.instantiateViewController(identifier: "MyProgressView")
                    
                    secondVC.modalPresentationStyle = .fullScreen
                    secondVC.modalTransitionStyle = .crossDissolve
                    
                    present(secondVC, animated: true, completion: nil)
        
    }
    
    private var weatherVM = WeatherViewModel()
    @objc  func loadInfo(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondVC = storyboard.instantiateViewController(identifier: "PlantInfoView") as PlantInfoView
       
                    secondVC.modalPresentationStyle = .fullScreen
                    secondVC.modalTransitionStyle = .crossDissolve
                    
                    present(secondVC, animated: true, completion: nil)
    }
    private var galleryCollectionView = MyPlantsCollectionView()

    @IBOutlet weak var titleLabel1: UILabel!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        pageSwitcher.selectedSegmentIndex = 0
        
        let path_plants = Bundle.main.path(forResource: "usersPlants", ofType: "plist")

        let dictionary = NSMutableDictionary(contentsOfFile: path_plants!)
        let arr = dictionary?.object(forKey: "plants_\(current_user)") as? [String]
        var i = 0
        while(i < arr?.count ?? 0){
            myPlants.insert(arr![i])
            i += 1
        }
        
       
        let path_city = Bundle.main.path(forResource: "userCity", ofType: "plist")

                    let plist2 = NSMutableDictionary(contentsOfFile: path_city!)
        userCity = plist2?.object(forKey: current_user) as! String
        
        self.weatherVM.fetchWeather(city: userCity)
        sleep(1)
        print(userCity)
        weather.text  = "Temperature in the city: " + String(Int(weatherVM.temperature)) + "ºC"
        
        view.addSubview(galleryCollectionView)
        galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        galleryCollectionView.topAnchor.constraint(equalTo: weather.bottomAnchor, constant: 10).isActive = true
        galleryCollectionView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        galleryCollectionView.set(cells: PlantModel.unfetchPlants())
        NotificationCenter.default.addObserver(self, selector: #selector(loadInfo), name: NSNotification.Name("loadInfo"), object: nil)
        //dictionary?.setObject(arr, forKey: "plants_\(current_user)" as NSCopying)
       // dictionary?.write(toFile: path_plants, atomically: true)
        
       // Do any additional setup after loading the view.
        pageSwitcher.setTitle(NSLocalizedString("my plants", comment: ""), forSegmentAt: 0)
        pageSwitcher.setTitle(NSLocalizedString("add plant", comment: ""), forSegmentAt: 1)
        
        titleLabel1.text = NSLocalizedString("My plants", comment: "")
        
        checkButton.setTitle(NSLocalizedString("Check progress!", comment: ""), for: .normal)
    }
    
    @IBOutlet weak var pageSwitcher: UISegmentedControl!
    @IBAction func switchPage(_ sender: Any) {
        if pageSwitcher.selectedSegmentIndex == 1 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let secondVC = storyboard.instantiateViewController(identifier: "PlantsCollectionView")
                        
                        secondVC.modalPresentationStyle = .fullScreen
                        secondVC.modalTransitionStyle = .crossDissolve
                        
                        present(secondVC, animated: true, completion: nil)
        }
    }
}
