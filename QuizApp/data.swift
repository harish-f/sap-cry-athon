//
//  data.swift
//  QuizApp
//
//  Created by HARISH RAM BAGHAVATH stu on 21/2/22.
//

import Foundation
enum questionType {
    case mcq
    case openEnded
}

enum correctOption {
    case one
    case two
    case three
    case four
}

struct Question {
    var questionText:String
    var questionType:questionType
    var options:[String]?
    var correctOption:correctOption?
    var correctAnswer:String = ""
}
var questions: [Question] = [
    Question(questionText: "What is the best bread topping ", questionType: .mcq, options: ["Nutella", "Skippy", "Chips", "Bread"], correctOption: .one),
    Question(questionText: "What is the name of the paw patrol character that operates a police vehicle?", questionType: .mcq, options: ["Chase", "Rocky", "Rubble", "Marshall"], correctOption: .one),
    Question(questionText: "Best mode? Light/Dark", questionType: .openEnded, correctAnswer: "Light")
]
