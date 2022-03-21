//
//  SettingsViewController.swift
//  Lesson12HomeworkTask2
//
//  Created by Виталий on 8.03.22.
//

import UIKit

public class SettingsViewController: UIViewController {
    
    @IBOutlet weak var transportControl: UISegmentedControl!
    @IBOutlet weak var levelControl: UISegmentedControl!
    @IBOutlet weak var abstractionControl: UISegmentedControl!
    
    @IBAction func absractionControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
             case 0:        // car
            UserDefaults.standard.set(0, forKey: "absraction")
            print("stone")
             case 1:        // truck
            UserDefaults.standard.set(1, forKey: "absraction")
            print("trash")
        default:
            break
        }
    }
    @IBAction func transportControlAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
             case 0:        // car
            UserDefaults.standard.set(0, forKey: "transport")
            print("car")
             case 1:        // truck
            UserDefaults.standard.set(1, forKey: "transport")
            print("truck")
        default:
            break
        }
    }
   
    
    @IBAction func levelControlAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
             case 0:        // Easy
            UserDefaults.standard.set(0, forKey: "level")
            print("easy")
             case 1:        // Med
            UserDefaults.standard.set(1, forKey: "level")
            print("Med")
             case 2:       // Hard
            UserDefaults.standard.set(2, forKey: "level")
            print("Hard")
        
            default:
                break
        }
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
//        if let value = UserDefaults.standard.value(forKey: "level"){
//            let selectedIndex = value as! Int
//            speedSegmentedControl.selectedSegmentIndex = selectedIndex
//        }
        levelControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "level")
        transportControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "transport")
    }
    
    
}
