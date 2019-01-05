//
//  Question.swift
//  Quizzler
//
//  Created by Satish Kamatkar on 1/3/19.
//  Copyright © 2019 Trimbuck. All rights reserved.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
