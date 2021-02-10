//
//  SettingsTableViewController.swift
//  AutoApplication
//
//  Created by Zhoomartov Erbolot on 09.02.2021.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var soundSwtich: UISwitch!
    @IBOutlet weak var volumeSlider: UISlider!
   
    
    // Mark: - Constants
    let nameKey = "nameKey"
    let cityKey = "cityKey"
    let soundKey = "soundKey"
    let volumeKey = "volumeKey"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSettings()
        
    }
    
    private func setupSettings() {
        
        if let name = UserDefaults.standard.string(forKey: nameKey) {
            nameField.text = name
        }
        
        if let city = UserDefaults.standard.string(forKey: cityKey) {
            cityField.text = city
        }
        
        soundSwtich.isOn = UserDefaults.standard.bool(forKey: soundKey)
        volumeSlider.value = UserDefaults.standard.float(forKey: volumeKey)
        
    }
    
    
    @IBAction func changeNameAction(_ sender: UITextField) {
        if sender.text != nil {
            UserDefaults.standard.set(sender.text, forKey: nameKey)
        }
    }
    
    @IBAction func changeCityAction(_ sender: UITextField) {
        if sender.text != nil {
            UserDefaults.standard.set(sender.text, forKey: cityKey)
        }
        
    }
    
    
    @IBAction func changeSoundAcion(_ sender: UISwitch) {
        UserDefaults.standard.set(soundSwtich.isOn, forKey: soundKey)
    }
    
    @IBAction func changeVolumeAction(_ sender: UISlider) {
        UserDefaults.standard.set(sender.value, forKey: volumeKey)
    }
}
