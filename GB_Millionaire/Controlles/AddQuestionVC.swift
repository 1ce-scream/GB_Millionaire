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
    
    @objc
    private func addPressed() {
        textFields.forEach { textField in
            if textField.text == "" {
                isTextFieldEmpty = true
            }
        }
        if isTextFieldEmpty {
            isTextFieldEmpty = false
            let alert = UIAlertController(
                title: "Ошибка",
                message: "Заполните все поля",
                preferredStyle: .alert)
            let alertAction = UIAlertAction(
                title: "ОК",
                style: .cancel)
            alert.addAction(alertAction)
            present(alert, animated: true)
        } else if numberOfRightAnswer.text == "" {
            let alert = UIAlertController(
                title: "Ошибка",
                message: "Введите номер правильного ответа",
                preferredStyle: .alert)
            let alertAction = UIAlertAction(
                title: "ОК",
                style: .cancel)
            alert.addAction(alertAction)
            present(alert, animated: true)
        } else {
            
            var answerOptions = [
                Answers(title: answer1Textfield.text!, isRight: false),
                Answers(title: answer2TextField.text!, isRight: false),
                Answers(title: answer3TextField.text!, isRight: false),
                Answers(title: answer4TextField.text!, isRight: false),
            ]
            let isTrue = Int(numberOfRightAnswer.text!)
            switch isTrue {
            case 1:
                answerOptions[0].isRight = true
            case 2:
                answerOptions[0].isRight = true
            case 3:
                answerOptions[0].isRight = true
            case 4:
                answerOptions[0].isRight = true
            default:
                let alert = UIAlertController(
                    title: "Ошибка",
                    message: "Введите корректый номер правильного ответа",
                    preferredStyle: .alert)
                let alertAction = UIAlertAction(
                    title: "ОК",
                    style: .cancel)
                alert.addAction(alertAction)
                present(alert, animated: true)
            }
            
            let question = Question(
                question: questionTextField.text!,
                answerOptions: answerOptions
            )
            
            questionCaretaker.saveUserQuestion(userQuestion: question)
            self.dismiss(animated: true, completion: nil)
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
