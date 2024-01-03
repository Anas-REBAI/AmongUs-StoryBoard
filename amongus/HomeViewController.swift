//
//  HomeViewController.swift
//  amongus
//
//  Created by Apple Esprit on 30/12/2023.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    // Recuperi fih nom user jey ml page loula bch tabaatho
    var avatarName:String?
    
    
    var players = ["Hu5tl3r", "MC_Killer", "CR7", "Not_Impostor", "BabyShark", "AKINFENWA","DR'Who"]
    var playerColors = ["Red", "Yellow", "Light-blue", "Brown", "Rose", "Orange","Purple"]
    
    
    //widgets
    @IBOutlet weak var HelloLabel: UILabel!
    @IBOutlet weak var HomeViewTV: UITableView!
    
    
    // Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
        let cv = cell?.contentView
        
        let playerImg = cv?.viewWithTag(1) as! UIImageView
        let playername = cv?.viewWithTag(2) as! UILabel
        let playerColor = cv?.viewWithTag(3) as! UILabel
        
        playerImg.image = UIImage(named: playerColors[indexPath.row])
        playername.text = players[indexPath.row]
        playerColor.text = playerColors[indexPath.row]
        
        return cell!
        
    }
    
    
    // // Recharger table view  : Cell select : ki nenzel ala wahda thezni details
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "secondSegue", sender: indexPath)
    }
    
    
    
    //life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // recupera nom f label edheka
        HelloLabel.text = "Hello " + avatarName!
    }
    
    
    //methods
    
    // fonction hedhi bch thez maaha les données
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondSegue" {
            let indexPath = sender as! IndexPath
            let destination = segue.destination as! DetailsViewController
            destination.playerName = players[indexPath.row]
            destination.playerColor = playerColors[indexPath.row]
            
        }
    }
    
  
    
    
    //IBActions
    
    @IBAction func emergencyMeetingAction(_ sender: Any) {
        performSegue(withIdentifier: "thirdSegue", sender: sender)
    }
    
    
    
    
}
