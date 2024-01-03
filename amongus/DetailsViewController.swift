//
//  DetailsViewController.swift
//  amongus
//
//  Created by Apple Esprit on 30/12/2023.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController {
    
    
    // hedhom bch ijiw ml page Home
    var playerName:String?
    var playerColor:String?
    
    //widgets
    
    @IBOutlet weak var playerImageView: UIImageView!
    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    
    //life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sabithom f blasethom eli bch yjiwni
        playerImageView.image = UIImage(named: playerColor!)
        playerNameLabel.text = playerName
    }
    
    // methods
    func ifExistMethod() -> Bool {
        
        var mBoolean = false
        
        let appDelagte = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelagte.persistentContainer
        let managedContext = persistentContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Player")
        
        let predicate = NSPredicate(format: "name = %@", playerName!)
        
        request.predicate = predicate
        
        do{
            
            let result = try managedContext.fetch(request)
            
            // si = 0 donc il n'a pas trouvé des player
            if result.count > 0  {
                
                mBoolean = true
                
            }
        }catch{
            print("Player fetching error")
            
        }
        return mBoolean
    }

    //..
    func addPlayer(){
        
        let appDelagte = UIApplication.shared.delegate as! AppDelegate
        let persistentContainer = appDelagte.persistentContainer
        let managedContext = persistentContainer.viewContext
        
        // Accés lel Entity
        let entityDesscription = NSEntityDescription.entity(forEntityName: "Player", in: managedContext)
        
        // objet eli bch ajouta
        let object = NSManagedObject(entity: entityDesscription!, insertInto: managedContext)
        object.setValue(playerName, forKey: "name")      // attribut dans entity
        object.setValue(playerColor, forKey: "color")
        
        do{
            try managedContext.save()
            self .alertMethod(titre: "Succes", message: "Player is marked as suspect ")
        }catch {
            print(" suspect Adding error")
        }
    }
    
    
    // methode taamel les alert
    
    func alertMethod(titre: String , message: String ){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default , handler: nil)
        alert.addAction(action)
        self.present(alert , animated: true , completion: nil)
    }

    
    //IBActions
    
    @IBAction func markAsSuspectAction(_ sender: Any) {
        
        if !ifExistMethod(){
          
            addPlayer()
            
            
            
        }else{
            self .alertMethod(titre: "warning", message: "Player is already marked as suspect ")
            
        }
    }
}
