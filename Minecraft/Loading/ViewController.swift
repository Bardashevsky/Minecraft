//
//  ViewController.swift
//  Minecraft
//
//  Created by Oleksandr Bardashevskyi on 27.09.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var progressView: UIProgressView!
    
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.layer.borderWidth = 1
        progressView.layer.borderColor = UIColor.white.cgColor
        myTimerCreate()
    }


    private func myTimerCreate() {
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                       target: self,
                                       selector: #selector(updateProgressView),
                                       userInfo: nil,
                                       repeats: true)
    }
    //MARK: - Selectors
    @objc private func updateProgressView() {
        if progressView.progress != 1.0 {
            progressView.progress += 0.005
        } else if progressView.progress == 1.0 {
            UIView.animate(withDuration: 0.3, animations: {
                self.timer.invalidate()
            }) { (bool) in
                self.timer.invalidate()
                let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
                keyWindow?.rootViewController = TabBarViewController()
            }
        }
    }
}

