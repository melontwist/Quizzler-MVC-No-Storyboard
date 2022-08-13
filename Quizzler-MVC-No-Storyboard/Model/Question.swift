//
//  Question.swift
//  Quizzler-MVC-No-Storyboard
//
//  Created by Vianney Marcellin on 2022/08/13.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String){
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
