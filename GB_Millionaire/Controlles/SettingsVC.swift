//
//  SettingsVC.swift
//  GB_Millionaire
//
//  Created by Vitaliy Talalay on 23.12.2021.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var orderSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderSwitch.addTarget(nil, action: #selector(orderDidChanged), for: .valueChanged)
        if Game.shared.questionsOrder == .hard {
            orderSwitch.isOn = false
        } else {
            orderSwitch.isOn = true
        }
    }
    
    @objc
    private func orderDidChanged(){
        Game.shared.questionsOrder.toggle()
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
