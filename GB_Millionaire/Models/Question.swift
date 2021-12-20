//
//  Question.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 19.12.2021.
//

import Foundation

struct Question {
    let question: String
    let answerOptions: [Answers]
}

struct Answers {
    var title: String
    var isRight: Bool
}

struct Questions {
    static let questions: [Question] = [
        Question(
            question: "На каком инструменте, как считается, играл древнерусский певец и сказитель Боян?",
            answerOptions: [
                Answers (title: "На виолончели", isRight: false),
                Answers (title: "На баяне", isRight: false),
                Answers (title: "На гуслях", isRight: true),
                Answers (title: "На гитаре", isRight: false),
            ]
        ),
        Question(
            question: "Кто автор музыки к детской песенке Чунга-Чанга?",
            answerOptions: [
                Answers (title: "Дербенёв", isRight: false),
                Answers (title: "Зацепин", isRight: false),
                Answers (title: "Шаинский", isRight: true),
                Answers (title: "Шпиц", isRight: false),
            ]
        ),
        Question(
            question: "В каком году произошла Куликовская битва?",
            answerOptions: [
                Answers (title: "1616", isRight: false),
                Answers (title: "1569", isRight: false),
                Answers (title: "1380", isRight: true),
                Answers (title: "1773", isRight: false),
            ]
        ),
        Question(
            question: "Какой титул имел Дон Кихот?",
            answerOptions: [
                Answers (title: "Барон", isRight: false),
                Answers (title: "Маркиз", isRight: false),
                Answers (title: "Идальго", isRight: true),
                Answers (title: "Вождь", isRight: false),
            ]
        ),
        Question(
            question: "Какая картина Малевича находится в Русском музее?",
            answerOptions: [
                Answers (title: "Чёрный квадрат", isRight: false),
                Answers (title: "\"Точильщик\"", isRight: false),
                Answers (title: "Красный квадрат", isRight: true),
                Answers (title: "Белый квадрат", isRight: false),
            ]
        ),
        Question(
            question: "Какую часть тела также называют «атлант»?",
            answerOptions: [
                Answers (title: "Головной мозг", isRight: false),
                Answers (title: "Шестая пара ребер", isRight: false),
                Answers (title: "Шейный позвонок", isRight: true),
                Answers (title: "Часть плеча", isRight: false),
            ]
        ),
        Question(
            question: "Что изображено на заднем плане картины Леонардо да Винчи «Мона Лиза»?",
            answerOptions: [
                Answers (title: "Драпировка", isRight: true),
                Answers (title: "Пейзаж", isRight: false),
                Answers (title: "Город", isRight: false),
                Answers (title: "Стадо овец", isRight: false),
            ]
        ),
    ]
}
