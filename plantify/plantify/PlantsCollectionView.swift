//
//  PlantsCollectionView.swift
//  plantify
//
//  Created by Екатерина Алейник on 18.05.25.
//

import UIKit

var downLoads = 0
class PlantsCollectionView: UIViewController {
    @objc  func loadNew(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let secondVC = storyboard.instantiateViewController(identifier: "ProfileView")
                    
                    secondVC.modalPresentationStyle = .fullScreen
                    secondVC.modalTransitionStyle = .crossDissolve
                    
                    present(secondVC, animated: true, completion: nil)
    }
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(loadNew), name: NSNotification.Name("loadNew"), object: nil)
        let imageView = UIImageView()
            let magnifyingGlassImage = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
            imageView.image = magnifyingGlassImage
            //arrange the frame according to your textfield height and image aspect
        imageView.frame = CGRect(x: 50, y: 5, width: 45, height: 20)
            imageView.contentMode = .scaleAspectFit

        searchBarField.leftViewMode = .always
        searchBarField.leftView = imageView
     
        view.addSubview(galleryCollectionView)
        galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        galleryCollectionView.topAnchor.constraint(equalTo: searchBarField.bottomAnchor, constant: 10).isActive = true
        galleryCollectionView.heightAnchor.constraint(equalToConstant: 600).isActive = true
        galleryCollectionView.set(cells: PlantModel.fetchPlants())
        // Do any additional setup after loading the view.
        pageSwitcher.setTitle(NSLocalizedString("my plants", comment: ""), forSegmentAt: 0)
        pageSwitcher.setTitle(NSLocalizedString("add plant", comment: ""), forSegmentAt: 1)
        titleLabel.text = NSLocalizedString("Plants", comment: "")
        searchBarField.placeholder = NSLocalizedString("search plants", comment: "")
    }
   
     
    
    @IBOutlet weak var searchBarField: UITextField!
    @IBAction func searcBar(_ sender: Any) {
    }
    
    @IBOutlet weak var pageSwitcher: UISegmentedControl!
    @IBAction func switchPage(_ sender: Any) {
        if pageSwitcher.selectedSegmentIndex == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let secondVC = storyboard.instantiateViewController(identifier: "ProfileView")
                        
                        secondVC.modalPresentationStyle = .fullScreen
                        secondVC.modalTransitionStyle = .crossDissolve
                        
                        present(secondVC, animated: true, completion: nil)
        }
    }
    private var galleryCollectionView = GalleryCollectionView()
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
