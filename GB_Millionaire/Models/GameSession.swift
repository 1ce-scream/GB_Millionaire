//
//  GameSession.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 20.12.2021.
//

import Foundation

protocol GameSessionProtocol {
    var questionCount: Int { get }
    var questions: [Question] { get }
    func appendRightAnswer()
}

class GameSession: GameSessionProtocol {

    var questionCount: Int { self.questions.count }
    var rightAnswers : Int = 0
    var isRandomStrategy: IsRandomStrategyProtocol
    let questions: [Question]
    
    func appendRightAnswer() {
        rightAnswers += 1
    }
    
    init(questions: [Question], isRandomStrategy: IsRandomStrategyProtocol) {
        self.isRandomStrategy = isRandomStrategy
        self.questions = self.isRandomStrategy.prepareQuestions(questions)
    }

//    convenience init() {
//        self.init(questionCount: 0, questions: [])
//    }
}
