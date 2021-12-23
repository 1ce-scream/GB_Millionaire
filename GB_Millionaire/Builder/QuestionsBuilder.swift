//
//  QuestionsBuilder.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 23.12.2021.
//

import Foundation

class QuestionsBuilder {
    private(set) var questionText: String = ""
    private(set) var answerOptions: [Answers] = []

    func build() -> Question {
        return Question(question: questionText, answerOptions: answerOptions)
    }

    func setQuestionText(_ questionText: String) {
        self.questionText = questionText
    }

    func setAnswerText(_ answerText: String) {
        let answer = Answers(title: answerText, isRight: false)
        self.answerOptions.append(answer)
    }
    
    func setRightAnswer(_ rightNumber: Int) {
        let isTrue = rightNumber - 1
        switch isTrue {
        case 0:
            answerOptions[0].isRight = true
        case 1:
            answerOptions[1].isRight = true
        case 2:
            answerOptions[2].isRight = true
        case 3:
            answerOptions[3].isRight = true
        default:
            answerOptions[0].isRight = true
        }
    }
}
