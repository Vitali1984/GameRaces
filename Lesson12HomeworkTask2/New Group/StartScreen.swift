//
//  StartScreen.swift
//  Lesson12HomeworkTask2
//
//  Created by Виталий on 22.02.22.
//

import UIKit

class StartScreen: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func onStartScreenButton(_ sender: Any) {
        let vc = ViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startButton.layer.cornerRadius = 30
        startButton.center = view.center
    }
}
