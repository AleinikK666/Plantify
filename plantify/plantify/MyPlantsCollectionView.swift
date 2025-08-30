//
//  GalleryCollectionViewViewController.swift
//  plantify
//
//   Created by Екатерина Алейник on 18.05.25.
//

import UIKit

var selectedPlant = String()

class MyPlantsCollectionView:   UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var cells = [PlantModel]()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.reuseId, for: indexPath) as! GalleryCollectionViewCell
        cell.mainImageView.image = cells[indexPath.row].mainImage
        cell.nameLabel.text = NSLocalizedString(cells[indexPath.row].plantName, comment: "")
        return cell
        
    }
    func collectionView(_ collectionView : UICollectionView, layout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: 400, height: 100)
    }
     
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("hello2")
        myPlants.insert(cells[indexPath.row].plantName)
        let path_plants = Bundle.main.path(forResource: "usersPlants", ofType: "plist")

        let dictionary = NSMutableDictionary(contentsOfFile: path_plants!)
        var arr = dictionary?.object(forKey: "plants_\(current_user)") as? [String]
        arr?.append(cells[indexPath.row].plantName)
        selectedPlant = cells[indexPath.row].plantName
        dictionary?.setObject(arr, forKey: "plants_\(current_user)" as NSCopying)
        dictionary?.write(toFile: path_plants!, atomically: true)
        
        NotificationCenter.default.post(name: NSNotification.Name("loadInfo"), object: nil)
      
   }
   
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseId)
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 5
        contentInset = UIEdgeInsets(top: 10, left: 5, bottom: 0, right: 5)

    }
    
    func set(cells: [PlantModel]){
        self.cells = cells
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
