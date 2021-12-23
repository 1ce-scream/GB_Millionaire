//
//  ViewController.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 18.12.2021.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet var startButton: UIView!
    @IBOutlet weak var resultButton: UIButton!
    
    var actualQuestions: [Question] = []
    
    override func viewDidAppear(_ animated: Bool) {
        actualQuestions = Questions.questions
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func configureGameSession(){
        let isRandomStrategy: IsRandomStrategyProtocol
        
        if Game.shared.questionsOrder == .random {
            isRandomStrategy = RandomStrategy()
        } else {
            isRandomStrategy = HardStrategy()
        }
        let gameSession = GameSession(
            questions: actualQuestions,
            isRandomStrategy: isRandomStrategy)
        Game.shared.gameSession = gameSession
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? GameVC else { return }
        configureGameSession()
        destination.gameSession = Game.shared.gameSession
    }
}

