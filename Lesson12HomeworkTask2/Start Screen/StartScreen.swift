//
//  StartScreen.swift
//  Lesson12HomeworkTask2
//
//  Created by Виталий on 22.02.22.
//

import UIKit

struct User: Codable {
    var name: String
    var age: String
    var distance: String
    var time: String
}

class StartScreen: UIViewController {

    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var okUser: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userAgeTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    private var user: User!
    
    @IBAction func onSettings(_ sender: Any) {
        let vc = UIStoryboard(name: "SettingsViewController", bundle: Bundle.main).instantiateInitialViewController() as! SettingsViewController
        present(vc, animated: true, completion: nil)
    }
    @IBAction func onStartScreenButton(_ sender: Any) {
        let vc = ViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.userName = userNameTextField.text ?? "No Name"
        vc.userAge =  userAgeTextField.text ?? "No Age"
        present(vc, animated: false)
    }
    
    @IBAction func userDataButton(_ sender: UIButton) {
        let vc = ViewController()
        
        guard   let userName = userNameTextField.text,
                let userAge = userAgeTextField.text,
                let userDistance = vc.userDistace,
                let userTime = vc.userTime
        else { return }
        user = User(name: userName, age: userAge, distance: userDistance, time: userTime)

//        let data = try? JSONEncoder().encode(user1)
//        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let fileName = "tempUser"
//        let filePath = docs.appendingPathComponent(fileName).path
//
//        FileManager.default.createFile(atPath: filePath, contents: data, attributes: nil)
//
//        let saveDate = FileManager.default.contents(atPath: filePath)
//
//        if let saveDate = saveDate {
//                let saveUser = try? JSONDecoder().decode(User.self, from: saveDate)
//            guard   let userName = saveUser?.name,
//                    let userAge = saveUser?.age,
//                    let userDistance = saveUser?.distance,
//                    let userTime = saveUser?.time
//            else { return }
//
//            resultLabel.text = userName + userAge + userDistance + userTime
//        }
        resultLabel.text = "User: " + user.name + "-" + user.age + "jahrs. Result: " + user.distance + "m. " + user.time + "sec."
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startButton.layer.cornerRadius = 5
        startButton.center = view.center
        //startButton.layer.cornerRadius = 20
        settingsButton.layer.cornerRadius = 30
        okUser.layer.cornerRadius = 17

    }
}
