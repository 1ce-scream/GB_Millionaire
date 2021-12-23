//
//  QuestionsOrderStrategy.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 23.12.2021.
//

import Foundation

protocol IsRandomStrategyProtocol: AnyObject{
    func prepareQuestions(_ questions: [Question]) -> [Question]
}

class RandomStrategy: IsRandomStrategyProtocol {
    func prepareQuestions(_ questions: [Question]) -> [Question] {
        return questions.shuffled()
    }
}

class HardStrategy: IsRandomStrategyProtocol {
    func prepareQuestions(_ questions: [Question]) -> [Question] {
        return questions
    }
}
