//
//  ViewController.swift
//  QuizApp
//
//  Created by HARISH RAM BAGHAVATH stu on 21/2/22.
//

import UIKit

class ViewController: UIViewController {

    var currentQuestion = 0
    var currentScore = 0


    @IBOutlet weak var qnNumberLabel: UILabel!
    @IBOutlet weak var submitText: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var qnlabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.cornerRadius = 20
        button2.layer.cornerRadius = 20
        button3.layer.cornerRadius = 20
        button4.layer.cornerRadius = 20
        button1.clipsToBounds = true
        button2.clipsToBounds = true
        button3.clipsToBounds = true
        button4.clipsToBounds = true
        qnlabel.adjustsFontSizeToFitWidth = true
        button1.titleLabel?.adjustsFontSizeToFitWidth = true
        button2.titleLabel?.adjustsFontSizeToFitWidth = true
        button3.titleLabel?.adjustsFontSizeToFitWidth = true
        button4.titleLabel?.adjustsFontSizeToFitWidth = true
        button1.titleLabel?.numberOfLines = 0
        button1.titleLabel?.numberOfLines = 0
        button1.titleLabel?.numberOfLines = 0
        button1.titleLabel?.numberOfLines = 0
        qnlabel.font = .systemFont(ofSize: 30)
        updateQuestion()
        currentScore = 0
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            let destinationViewController = segue.destination as! ResultsViewController
            destinationViewController.score = currentScore
            
        }
    }
    @IBAction func button1Press(_ sender: Any) {
        checkAnswer(option: .one)
    }
    @IBAction func button2Press(_ sender: Any) {
        checkAnswer(option: .two)
    }
    @IBAction func button3Press(_ sender: Any) {
        checkAnswer(option: .three)
    }
    @IBAction func button4Press(_ sender: Any) {
        checkAnswer(option: .four)
    }
    @IBAction func answerFinished(_ sender: Any) {
    }
    @IBAction func submitText(_ sender: Any) {
        checkAnswer(answerText: textField.text)
    }


    
    func checkAnswer(option: correctOption? = nil, answerText: String? = nil){
        if questions[currentQuestion].questionType == .mcq {
            if questions[currentQuestion].correctOption == option {
                correctAnswer()
            } else {
                wrongAnswer()
            }
        } else {
            if let answerText = answerText {
                if questions[currentQuestion].correctAnswer.lowercased() == answerText.lowercased() {
                    correctAnswer()
                } else {
                    wrongAnswer()
                }
            }
        }

    }
    
    func correctAnswer() {
        self.view.backgroundColor = .green
        let alert = UIAlertController(title: "CORECT", message: "YJ LOVES YOU WOOHOO", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: {_ in
            self.nextQuestion()
            self.currentScore += 1
            self.scoreLabel.text = "Score: \(self.currentScore)"

        }))
        self.present(alert, animated: true)
        print("correct")
    }
    func wrongAnswer() {
        self.view.backgroundColor = .red

        var answer = ""
        var index = 0
        if questions[currentQuestion].questionType == .mcq {
            switch questions[currentQuestion].correctOption! {
            case .one:
                index = 0
            case .two:
                index = 1
            case .three:
                index = 2
            case .four:
                index = 3
            }
            answer = questions[currentQuestion].options![index]
        } else {

        }

        let alert = UIAlertController(title: "WRONG", message: "YJ HATES YOU 😭", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: {_ in
            self.nextQuestion()

        }))
        self.present(alert, animated: true)

    }
    
    
    
    func nextQuestion() {
        self.view.backgroundColor = .white
        if currentQuestion < questions.count - 1 {
            currentQuestion += 1
            updateQuestion()
        }
        else {
            performSegue(withIdentifier: "showResults", sender: self)
        }
    }
    
    func updateQuestion() {
        qnlabel.text = "\(questions[currentQuestion].questionText)"
        qnNumberLabel.text = "QUESTION \(currentQuestion + 1)"
        if questions[currentQuestion].questionType == .mcq {
            button1.setTitle(questions[currentQuestion].options![0], for: .normal)
            button2.setTitle(questions[currentQuestion].options![1], for: .normal)
            button3.setTitle(questions[currentQuestion].options![2], for: .normal)
            button4.setTitle(questions[currentQuestion].options![3], for: .normal)

            button1.isHidden = false
            button2.isHidden = false
            button3.isHidden = false
            button4.isHidden = false
            textField.isHidden = true
            submitText.isHidden = true
        } else {
            textField.isHidden = false
            submitText.isHidden = false
            button1.isHidden = true
            button2.isHidden = true
            button3.isHidden = true
            button4.isHidden = true
        }

    }
    
    
    @IBAction func goBack(_ segue: UIStoryboardSegue) {
        currentScore = 0
        currentQuestion = 0
        updateQuestion()
        scoreLabel.text = "Score: \(currentScore)"
    }
    
}


