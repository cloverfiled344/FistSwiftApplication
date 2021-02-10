//
//  FriendsViewController.swift
//  AutoApplication
//
//  Created by Zhoomartov Erbolot on 09.02.2021.
//

import UIKit

class FriendsViewController: UIViewController {
    
    // Mark: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Mark: - Constants
    let cellID = "UserTableViewCell"
    let segueID = "goToProfile"
    
    var modelUser = ModelUser()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = modelUser.users[section]
        return section.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelUser.users.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Men"
        }
        else {
            return "Women"
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! UserTableViewCell
        let section = modelUser.users[indexPath.section]
        let user = section[indexPath.row]
        
        cell.userName.text = user.name
        cell.userImage.image = user.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = modelUser.users[indexPath.section]
        let user = section[indexPath.row]
        
        let alert = UIAlertController(title: user.name, message: user.city, preferredStyle: .actionSheet)
        
        let profileAction = UIAlertAction(title: "Profile", style: .default) { (alert) in
            self.performSegue(withIdentifier: self.segueID, sender: indexPath)
        }
        
        let deleteAction = UIAlertAction(title: "Remove from friends", style: .destructive) { (alert) in
            self.modelUser.users[indexPath.row].remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        
        alert.addAction(profileAction)
        alert.addAction(deleteAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segueID {
            let vc = segue.destination as! UserViewController
            let indexPath = sender as! IndexPath
            
            let section = modelUser.users[indexPath.section]
            let user = section[indexPath.row]
            
            vc.user = user
        }
    }
    
}
