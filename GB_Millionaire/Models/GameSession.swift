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
    var currentQuestion: Observable<Int> { get set }
    var rightAnswersPercent: Observable<Int> { get }
    func appendRightAnswer()
    func calcPercent()
}

class GameSession: GameSessionProtocol {
    
    var currentQuestion = Observable<Int>(0)
    var rightAnswersPercent = Observable<Int>(0)
    var questionCount: Int { self.questions.count }
    var rightAnswers : Int = 0
    var isRandomStrategy: IsRandomStrategyProtocol
    let questions: [Question]
    
    func appendRightAnswer() {
        rightAnswers += 1
    }
    
    func calcPercent() {
        self.rightAnswersPercent.value = Int(
            Double(rightAnswers) / Double(currentQuestion.value+1) * 100)
    }
    
    init(questions: [Question], isRandomStrategy: IsRandomStrategyProtocol) {
        self.isRandomStrategy = isRandomStrategy
        self.questions = self.isRandomStrategy.prepareQuestions(questions)
    }

//    convenience init() {
//        self.init(questionCount: 0, questions: [])
//    }
}
