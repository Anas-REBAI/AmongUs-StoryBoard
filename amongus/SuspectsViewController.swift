//
//  SuspectsViewController.swift
//  amongus
//
//  Created by Apple Esprit on 30/12/2023.
//

import UIKit
import CoreData
class SuspectsViewController: UIViewController, UICollectionViewDataSource {
  
    
    // hedha bch yjib fih les noms
    var suspects = [String]()
    // hedha bch yjib fih tsawer
    var suspectColors = [String]()
    
    //widgets
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    //Collection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suspects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mItem", for: indexPath)
        let cv = cell.contentView
        
        // ndeclari eli bch naffichi fehom o nansech naamlelhom tag
        let imageView = cv.viewWithTag(1) as! UIImageView
        let label = cv.viewWithTag(2) as! UILabel
        
        // y3abi fehom tawa
        imageView.image = UIImage(named: suspectColors[indexPath.row])
        label.text = suspects[indexPath.row]
        
        return cell
    }
    
    
    
    
    //life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchSuspects()
    }
    
    //methods
    func fetchSuspects(){
        let appDelagte = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelagte.persistentContainer
        let managedContext = persistentContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Player")
        
        do{
           let result = try managedContext.fetch(request)
            for item in result{
                suspects.append(item.value(forKey: "name") as! String)
                suspectColors.append(item.value(forKey: "color") as! String)
                mCollectionView.reloadData()
            }
        
        }catch{
            print("fetching all errors ! ")
        }
    }



}
