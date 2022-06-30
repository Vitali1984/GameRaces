//
//  StartScreen.swift
//  Lesson12HomeworkTask2
//
//  Created by Виталий on 22.02.22.
//

import UIKit

class StartScreen: UIViewController {

    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userAgeTextField: UITextField!
    @IBOutlet weak var resultButton: UIButton!
    
    @IBAction func onResult(_ sender: UIButton) {
        let vcResult = UIStoryboard(name: "ResultViewController", bundle: Bundle.main).instantiateInitialViewController() as! ResultViewController
        present(vcResult, animated: true, completion: nil)
    }
    @IBAction func onSettings(_ sender: Any) {
        let vc = UIStoryboard(name: "SettingsViewController", bundle: Bundle.main).instantiateInitialViewController() as! SettingsViewController
        present(vc, animated: true, completion: nil)
    }
    @IBAction func onStartScreenButton(_ sender: Any) {
        let vc = ViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.userRacer.userName = userNameTextField.text ?? "No Name"
        vc.userRacer.userAge =  userAgeTextField.text ?? "No Age"
        present(vc, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startButton.layer.cornerRadius = 20
        startButton.center = view.center
        settingsButton.layer.cornerRadius = 30
        resultButton.layer.cornerRadius = 30
    }
}
