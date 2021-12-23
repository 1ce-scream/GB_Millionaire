//
//  AddQuestionVC.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 23.12.2021.
//

import UIKit

class AddQuestionVC: UIViewController {
    
    @IBOutlet weak var numberOfRightAnswer: UITextField!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answer1Textfield: UITextField!
    @IBOutlet weak var answer2TextField: UITextField!
    @IBOutlet weak var answer3TextField: UITextField!
    @IBOutlet weak var answer4TextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    let questionCaretaker = QuestionsCaretaker()
    let questionBuilder = QuestionsBuilder()
    var textFields: [UITextField] = []
    var isTextFieldEmpty = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFields()
        addButton.addTarget(nil, action: #selector(addPressed), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    private func setTextFields() {
        textFields.append(questionTextField)
        textFields.append(answer1Textfield)
        textFields.append(answer2TextField)
        textFields.append(answer3TextField)
        textFields.append(answer4TextField)
    }
    
    private func inputError() {
        let alert = UIAlertController(
            title: "Ошибка",
            message: "Некорректно введенные данные",
            preferredStyle: .alert)
        let alertAction = UIAlertAction(
            title: "ОК",
            style: .cancel)
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
    
    @objc
    private func addPressed() {
        textFields.forEach { textField in
            if textField.text == "" {
                isTextFieldEmpty = true
            }
        }
        if isTextFieldEmpty {
            isTextFieldEmpty = false
            inputError()
        } else if numberOfRightAnswer.text == "" {
            inputError()
        } else {
            let questionText = questionTextField.text!
            let answerText = [
                answer1Textfield.text!,
                answer2TextField.text!,
                answer3TextField.text!,
                answer4TextField.text!,
            ]
            
            questionBuilder.setQuestionText(questionText)
            answerText.forEach { answerText in
                questionBuilder.setAnswerText(answerText)
            }

            guard
                let rightNumber = Int(numberOfRightAnswer.text!)
            else {
                inputError()
                return
            }
            
            if rightNumber < 5 && rightNumber > 0 {
                questionBuilder.setRightAnswer(rightNumber)
                let question = questionBuilder.build()
                questionCaretaker.saveUserQuestion(userQuestion: question)
                self.dismiss(animated: true, completion: nil)
            } else {
                inputError()
            }
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
