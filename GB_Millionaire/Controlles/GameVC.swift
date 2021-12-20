//
//  GameVC.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 19.12.2021.
//

import UIKit

class GameVC: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    let gameSession = GameSession()
    let questions = Questions.questions
    var buttonsArray = [UIButton]()
    var questionNumber = 0
    var isRight = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Game.shared.gameSession = gameSession
        gameSession.allQuestions = questions.count
        makeButtonsArray()
        setActionForButtons()
        setQuestionText(questionNumber)
        setAnswersText(questionNumber)
        setIsRightAnswer(questionNumber)
    }
    
    private func makeButtonsArray() {
        buttonsArray.append(answerButton1)
        buttonsArray.append(answerButton2)
        buttonsArray.append(answerButton3)
        buttonsArray.append(answerButton4)
    }
    private func setQuestionText(_ questionNumber: Int) {
        let question = questions[questionNumber]
        questionLabel.text = question.question
    }
    
    private func setAnswersText(_ questionNumber: Int) {
        let question = questions[questionNumber]
        var answerNumber = 0
        
        buttonsArray.forEach { button in
            button.setTitle(
                question.answerOptions[answerNumber].title,
                for: .normal)
            answerNumber += 1
        }
    }
    
    private func setIsRightAnswer(_ questionNumber: Int) {
        let answers = questions[questionNumber].answerOptions
        answers.forEach { answer in
            if answer.isRight {
                isRight = answer.title
            }
        }
    }
    
    private func setActionForButtons() {
        buttonsArray.forEach { button in
            button.addTarget(self,
                             action: #selector(buttonAction),
                             for: .touchUpInside)
        }
    }
    
    private func nextQuestions() {
        questionNumber += 1
        guard
            questionNumber < questions.count
        else {
            Game.shared.gameEnd()
            self.dismiss(animated: true, completion: nil)
            return
        }
        setQuestionText(questionNumber)
        setAnswersText(questionNumber)
        setIsRightAnswer(questionNumber)
    }
    
    @objc private func buttonAction(_ sender: UIButton) {
        guard let text = sender.currentTitle else { return }
        if isRight == text {
            gameSession.appendRightAnswer()
            nextQuestions()
        } else {
            Game.shared.gameEnd()
            self.dismiss(animated: true, completion: nil)
        }
    }
}
