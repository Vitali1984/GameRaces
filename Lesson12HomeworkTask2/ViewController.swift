//
//  ViewController.swift
//  Lesson12HomeworkTask2
//
//  Created by Виталий on 12.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewRoad:   UIView!
    private var viewRoad1:  UIView!
    private var viewRoadWeight: CGFloat = 10
    private var viewRoadHeight: CGFloat = 300
    
    private var imageStone: UIImageView!
    private var imageStone1: UIImageView!
    private var imageStone2: UIImageView!
    private var imageStone3: UIImageView!
    private var imageStone4: UIImageView!
    private var imageCar: UIImageView!
    private var imageBoom: UIImageView!
    
    private var timer0: Timer?
    private var timer1: Timer?
    private var timer2: Timer?
    private var timer3: Timer?
    private var timer4: Timer?
    private var intersectionCheckTimer: Timer?
    private var timerRoad1: Timer?
    private var timerRoad2: Timer?
    private var gameOver: Timer?
    private var timerTimeOfGame: Timer?
    
    private var buttonLeft: UIButton!
    private var buttonRihgt: UIButton!
    private var imageRight: UIImageView!
    private var imageLeft: UIImageView!
    
    private var labelLeft: UILabel!
    var userName: String!
    var userAge: String!
    private var labelRight: UILabel!
    var userDistace: String! = "0"
    var userTime: String! = "0"
    var countSec: Int = 0

    // MARK: - ViewControllerLifeCycle
    // MARK: -
    
    override func loadView() {
        super.loadView()
        
        setupImage()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray
        
        setupImageFrame()
        
        setLevelTimer()
        
        intersectionCheckTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(intersectionCheck), userInfo: nil, repeats: true)
        timerTimeOfGame = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTimeOfGame), userInfo: nil, repeats: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        invalidateTimers()
    }
    
    // MARK: - PrivateMetods
    // MARK: -
    private func setupImage() {
        let customView = UIView(frame: UIScreen.main.bounds)
        
        viewRoad = UIView()
        viewRoad.backgroundColor = .white
        customView.addSubview(viewRoad)
        
        viewRoad1 = UIView()
        viewRoad1.backgroundColor = .white
        customView.addSubview(viewRoad1)
       
        imageBoom = UIImageView()
        let imageBoomString = UIImage(named: "boom")
        imageBoom.image = imageBoomString
        customView.addSubview(imageBoom)
        
        imageCar = UIImageView()
        imageCar.image = setTransport()
        customView.addSubview(imageCar)
        
        imageStone = UIImageView()
        imageStone1 = UIImageView()
        imageStone2 = UIImageView()
        imageStone3 = UIImageView()
        imageStone4 = UIImageView()
        
        let imageSt = setAbstraction()
        imageStone.image = imageSt
        imageStone1.image = imageSt
        imageStone2.image = imageSt
        imageStone3.image = imageSt
        imageStone4.image = imageSt
        
        customView.addSubview(imageStone)
        customView.addSubview(imageStone1)
        customView.addSubview(imageStone2)
        customView.addSubview(imageStone3)
        customView.addSubview(imageStone4)
        
        buttonLeft = UIButton()
        buttonLeft.backgroundColor = .green
        buttonLeft.addTarget(self, action: #selector(moveCarLeft), for: .touchUpInside)
        buttonLeft.layer.cornerRadius = 20
        buttonLeft.clipsToBounds = true
        buttonLeft.titleLabel?.font = UIFont(name: "Roboto-Italic", size: 24)
        buttonLeft.setTitle("left", for:.normal)
        buttonLeft.setTitleColor(.black, for: .normal)
        imageLeft = UIImageView()
        let imageLeftString = UIImage(named: "left")
        imageLeft.image = imageLeftString
        
        customView.addSubview(buttonLeft)
        customView.addSubview(imageLeft)
        
        buttonRihgt = UIButton()
        buttonRihgt.backgroundColor = .green
        buttonRihgt.addTarget(self, action: #selector(moveCarRight), for: .touchUpInside)
        buttonRihgt.layer.cornerRadius = 20
        buttonRihgt.clipsToBounds = true
        buttonRihgt.titleLabel?.font = UIFont(name: "Roboto-Italic", size: 24)
        buttonRihgt.setTitle("right", for:.normal)
        buttonRihgt.setTitleColor(.black, for: .normal)
        imageRight = UIImageView()
        let imageRightString = UIImage(named: "right")
        imageRight.image = imageRightString
        
        customView.addSubview(buttonRihgt)
        customView.addSubview(imageRight)
        
        labelLeft = UILabel()
        labelLeft.text = "USER:" + userName + String(userAge)
        labelLeft.textAlignment = .left
        customView.addSubview(labelLeft)
        
        labelRight = UILabel()
        labelRight.textAlignment = .left
        customView.addSubview(labelRight)
        
        view = customView
    }

    private func setupImageFrame() {
        viewRoad.frame = CGRect(x: view.bounds.midX - viewRoadWeight/2,
                                 y: view.bounds.minY - viewRoadHeight,
                                 width: viewRoadWeight,
                                 height: viewRoadHeight)
        viewRoad1.frame = CGRect(x: view.bounds.midX - viewRoadWeight/2,
                                 y: view.bounds.minY - viewRoadHeight,
                                 width: viewRoadWeight,
                                 height: viewRoadHeight)
        imageStone.frame = CGRect(x: view.bounds.minX + 220,
                                 y: view.bounds.minY - 111,
                                 width: 100,
                                 height: 80)
        imageStone1.frame = CGRect(x: view.bounds.minX,
                                 y: view.bounds.minY - 111,
                                 width: 100,
                                 height: 80)
        imageStone2.frame = CGRect(x: view.bounds.minX + 40,
                                 y: view.bounds.minY - 111,
                                 width: 100,
                                 height: 80)
        imageStone3.frame = CGRect(x: view.bounds.minX + 80,
                                 y: view.bounds.minY - 111,
                                 width: 100,
                                 height: 80)
        imageStone4.frame = CGRect(x: view.bounds.minX + 320,
                                 y: view.bounds.minY - 111,
                                 width: 100,
                                 height: 80)
        imageCar.frame = CGRect(x: view.bounds.midX - 50,
                                 y: view.bounds.maxY - 200,
                                 width: 100,
                                 height: 100)
        buttonLeft.frame = CGRect(x: view.bounds.minX + 50,
                                  y: view.bounds.maxY - 80,
                                  width: 120, height: 50)
        imageLeft.frame = CGRect(x: view.bounds.minX + 50,
                                 y: view.bounds.maxY - 80,
                                 width: 60,
                                 height: 50)
        buttonRihgt.frame = CGRect(x: view.bounds.maxX - 50 - 120,
                                   y: view.bounds.maxY - 80,
                                   width: 120,
                                   height: 50)
        imageRight.frame = CGRect(x: view.bounds.maxX - 50 - 60,
                                  y: view.bounds.maxY - 80,
                                  width: 60,
                                  height: 50)
        labelLeft.frame = CGRect(x: view.bounds.minX + 30,
                                 y: view.bounds.minY + 50,
                                 width: 140,
                                 height: 100)
        labelRight.frame = CGRect(x: view.bounds.minX + 230,
                                 y: view.bounds.minY + 50,
                                 width: 140,
                                 height: 100)
    }
    
    @objc private func viewRoadAnimation(viewAnimation: UIView, delay: TimeInterval) {
        UIView.animate(withDuration: 4, delay: 0, options: [.repeat, .curveLinear]) {
            self.viewRoad.frame = CGRect(
                x: self.view.bounds.midX - self.viewRoadWeight,
                y: self.view.bounds.maxY + self.viewRoadHeight,
                width: self.viewRoadWeight,
                height: self.viewRoadHeight)
        }
    }
    
    @objc private func viewRoadAnimation1(viewAnimation: UIView, delay: TimeInterval) {
        UIView.animate(withDuration: 4, delay: 0, options: [.repeat, .curveLinear]) {
            self.viewRoad1.frame = CGRect(
                x: self.view.bounds.midX - self.viewRoadWeight,
                y: self.view.bounds.maxY + self.viewRoadHeight,
                width: self.viewRoadWeight,
                height: self.viewRoadHeight)
        }
    }
    
    @objc private func moveCarLeft() {
        
        if !imageCar.frame.origin.x.isLess(than: view.frame.minX) {
            UIView.animate(withDuration: 0.3, delay: 0) {
                self.imageCar.center.x -= self.imageCar.bounds.width/3
            }
        } else {
            self.imageCar.center.x = self.imageCar.center.x
        }
    }
    
    @objc private func moveCarRight() {
        if imageCar.frame.origin.x.isLess(than: view.frame.maxX - imageCar.frame.width) {
            UIView.animate(withDuration: 0.3, delay: 0) {
                self.imageCar.center.x += self.imageCar.bounds.width/3
            }
        } else {
            self.imageCar.center.x = self.imageCar.center.x
        }
    }
    
    func setLevelTimer() {
        let speedSegmentedControl = UserDefaults.standard.integer(forKey: "level")
           switch speedSegmentedControl {
           case 0:                              // easy
               setupTimerEasy()
           case 1:                              // medium
               setupTimerMedium()
           case 2:                              // hard
               setupTimerHard()
           default:
               break
           }
       }
    
    func setTransport() -> UIImage {
        var imageTransport = UIImage()
        let speedSegmentedControl = UserDefaults.standard.integer(forKey: "transport")
           switch speedSegmentedControl {
           case 0:                              // car
               let image = UIImage(named: "car")
               imageTransport = image!
           case 1:                              // truck
               let image = UIImage(named: "truck")
               imageTransport = image!
           default:
               break
           }
        return imageTransport
       }
    
    func setAbstraction() -> UIImage {
        var imageAbsraction = UIImage()
        let speedSegmentedControl = UserDefaults.standard.integer(forKey: "absraction")
           switch speedSegmentedControl {
           case 0:                              // stone
               let image = UIImage(named: "stone")
               imageAbsraction = image!
           case 1:                              // trash
               let image = UIImage(named: "trash")
               imageAbsraction = image!
           default:
               break
           }
        return imageAbsraction
       }
    
    // MARK: - Timers
    // MARK: -
    private func invalidateTimers(){
        gameOver?.invalidate()
        timerRoad1?.invalidate()
        timerRoad2?.invalidate()
    }
    
    private func setupTimerEasy(){
    timer0 = Timer.scheduledTimer(timeInterval: 3.7, target: self, selector: #selector(changeCoordinate), userInfo: nil, repeats: true)
    timer2 = Timer.scheduledTimer(timeInterval: 7.3, target: self, selector: #selector(changeCoordinate2), userInfo: nil, repeats: true)
    timerRoad1 = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(viewRoadAnimation), userInfo: nil, repeats: false)
    timerRoad2 = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(viewRoadAnimation1), userInfo: nil, repeats: false)
    }
    private func setupTimerMedium(){
    timer0 = Timer.scheduledTimer(timeInterval: 3.7, target: self, selector: #selector(changeCoordinate), userInfo: nil, repeats: true)
    timer1 = Timer.scheduledTimer(timeInterval: 4.8, target: self, selector: #selector(changeCoordinate1), userInfo: nil, repeats: true)
    timer2 = Timer.scheduledTimer(timeInterval: 7.3, target: self, selector: #selector(changeCoordinate2), userInfo: nil, repeats: true)
    
    timerRoad1 = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(viewRoadAnimation), userInfo: nil, repeats: false)
    timerRoad2 = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(viewRoadAnimation1), userInfo: nil, repeats: false)
    }
        
    private func setupTimerHard(){
    timer0 = Timer.scheduledTimer(timeInterval: 3.7, target: self, selector: #selector(changeCoordinate), userInfo: nil, repeats: true)
    timer1 = Timer.scheduledTimer(timeInterval: 4.8, target: self, selector: #selector(changeCoordinate1), userInfo: nil, repeats: true)
    timer2 = Timer.scheduledTimer(timeInterval: 7.3, target: self, selector: #selector(changeCoordinate2), userInfo: nil, repeats: true)
    timer3 = Timer.scheduledTimer(timeInterval: 6.3, target: self, selector: #selector(changeCoordinate3), userInfo: nil, repeats: true)
    timer4 = Timer.scheduledTimer(timeInterval: 4.3, target: self, selector: #selector(changeCoordinate4), userInfo: nil, repeats: true)
    
    timerRoad1 = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(viewRoadAnimation), userInfo: nil, repeats: false)
    timerRoad2 = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(viewRoadAnimation1), userInfo: nil, repeats: false)
    }
    
    // MARK: - TimerMetods
    // MARK: -
    
    @objc private func disMissAction () {
        self.dismiss(animated: true)
        timerRoad1?.invalidate()
        timerRoad2?.invalidate()
    }
    
    @objc private func changeCoordinate() {
        UIView.animate(withDuration: 3, delay: 0, options: [ .curveLinear]) {
            self.imageStone.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.maxY + 111)
        } completion: { _ in
            self.imageStone.transform = .identity
        }
    }
    
    @objc private func changeCoordinate1() {
        UIView.animate(withDuration: 3, delay: 1, options: [ .curveLinear]) {
            self.imageStone1.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.maxY + 111)
        } completion: { _ in
            self.imageStone1.transform = .identity
        }
    }
    
    @objc private func changeCoordinate2() {
        UIView.animate(withDuration: 3, delay: 1, options: [ .curveLinear]) {
            self.imageStone2.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.maxY + 111)
        } completion: { _ in
            self.imageStone2.transform = .identity
        }
    }
    
    @objc private func changeCoordinate3() {
        UIView.animate(withDuration: 3, delay: 1, options: [ .curveLinear]) {
            self.imageStone3.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.maxY + 111)
        } completion: { _ in
            self.imageStone3.transform = .identity
        }
    }
    
    @objc private func changeCoordinate4() {
        UIView.animate(withDuration: 3, delay: 0, options: [ .curveLinear]) {
            self.imageStone4.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.maxY + 111)
        } completion: { _ in
            self.imageStone4.transform = .identity
        }
    }
    
    @objc private func countTimeOfGame() {
        countSec += 1
        userTime = String(countSec)
        userDistace = String(countSec * 25)
        
        guard let time = userTime,
              let distance = userDistace
        else {
                  return
              }
        labelRight.text = time + "sec.," + distance + "met."
    }
    
    @objc private func intersectionCheck() {
        guard   let imageCarView = self.imageCar.layer.presentation(),
                let imageStoneView = self.imageStone.layer.presentation(),
                let imageStone1View = self.imageStone1.layer.presentation(),
                let imageStone2View = self.imageStone2.layer.presentation(),
                let imageStone3View = self.imageStone3.layer.presentation(),
                let imageStone4View = self.imageStone4.layer.presentation()
        else {return
        }
        
        if  imageStoneView.frame.intersects(imageCarView.frame.insetBy(dx: 20, dy: 5)) || imageStone1View.frame.intersects(imageCarView.frame.insetBy(dx: 20, dy: 5)) || imageStone2View.frame.intersects(imageCarView.frame.insetBy(dx: 20, dy: 5)) ||
            imageStone3View.frame.intersects(imageCarView.frame.insetBy(dx: 20, dy: 5)) ||
            imageStone4View.frame.intersects(imageCarView.frame.insetBy(dx: 20, dy: 5)) {
            
            imageBoom.frame = CGRect(x: imageCar.frame.origin.x,
                                     y: imageCar.frame.origin.y ,
                                     width: self.imageCar.frame.width + 60,
                                     height: self.imageCar.frame.height + 80)
            
            imageCar.removeFromSuperview()
            imageStone.removeFromSuperview()
            imageStone1.removeFromSuperview()
            imageStone2.removeFromSuperview()
            imageStone3.removeFromSuperview()
            imageStone4.removeFromSuperview()
            
            intersectionCheckTimer?.invalidate()
            timerTimeOfGame?.invalidate()
            timer0?.invalidate()
            timer1?.invalidate()
            timer2?.invalidate()
            timer3?.invalidate()
            timer4?.invalidate()
            
            gameOver = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(disMissAction), userInfo: nil, repeats: false)
        }
    }
}

