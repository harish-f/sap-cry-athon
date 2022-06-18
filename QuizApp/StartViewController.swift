//
//  StartViewController.swift
//  QuizApp
//
//  Created by HARISH RAM BAGHAVATH stu on 15/6/22.
//

import UIKit

class StartViewController: UIViewController {
//    @IBAction func unwindHere(segue:UIStoryboardSegue) {}


    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.yellow.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
    }

}
