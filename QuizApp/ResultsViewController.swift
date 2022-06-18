//
//  ResultsViewController.swift
//  QuizApp
//
//  Created by HARISH RAM BAGHAVATH stu on 28/2/22.
//

import UIKit

class ResultsViewController: UIViewController {
    var score:Int = 0
    var comment = [
        "Chase is so sad that he does not even want to look at you.",
        "Chase is happy and encourages you to try again.",
        "Chase is happy and gives you a limited hackathon '22 badge!",
        "Chase is happy and gives you a limited hackathon '22 badge and cool nutella!"
    ]
    let images = ["chaseHappy","c", "chasemedium", "chaseSad"]
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var iamge: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score: \(score)"
        commentLabel.text = comment[score]
        iamge.image = UIImage(named: images[score])
    }
    
    @IBAction func playAgain(_ sender: Any) {
        self.performSegue(withIdentifier: "unwind", sender: self)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
