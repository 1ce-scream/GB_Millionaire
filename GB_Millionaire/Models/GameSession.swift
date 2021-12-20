//
//  GameSession.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 20.12.2021.
//

import Foundation

protocol GameSessionProtocol {
    var allQuestions: Int { get set }
    func appendRightAnswer()
}

class GameSession: GameSessionProtocol {

    var allQuestions: Int = 0
    var rightAnswers : Int = 0
    
    func appendRightAnswer() {
        rightAnswers += 1
    }
    
    init(question: Int) {
        allQuestions = question
    }

    convenience init() {
        self.init(question: 0)
    }
}
