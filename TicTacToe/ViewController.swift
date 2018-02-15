//
//  ViewController.swift
//  TicTacToe
//
//  Created by Christian Liefeldt on 15.02.18.
//  Copyright © 2018 CL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var vKlicksCount = 0
    var vActivePlayer = 1
    var vActiceGame = true
    var vGameStat = [ 0, 0, 0,
                      0, 0, 0,
                      0, 0, 0]
    
    let vWinningCombination = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6], [0, 3, 6], [1, 4, 7], [2, 5, 8]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeItem()
    }
    
    @IBAction func btnAgain(_ sender: Any) {
        removeItem()
    }
    
    @IBOutlet weak var btnAgain: UIButton!
    @IBOutlet weak var lblAusgabe: UILabel!
    @IBAction func btnPress(_ sender: UIButton) {
        
        let activePosition = sender.tag - 1
        if vGameStat[activePosition] == 0 && vActiceGame {
            vKlicksCount = vKlicksCount + 1
            vGameStat[activePosition] = vActivePlayer
            print(vGameStat)
            if vActivePlayer == 1 {
                sender.setImage(UIImage(named: "Kreis.png"), for: [])
                vActivePlayer = 2
            } else {
                sender.setImage(UIImage(named: "Kreuz.png"), for: [])
                vActivePlayer = 1
            }
            
            for combination in vWinningCombination {
                if vGameStat[combination[0]] != 0 && vGameStat[combination[0]] == vGameStat[combination[1]] && vGameStat[combination[1]] ==
                    vGameStat[combination[2]] {
                    if vActivePlayer == 1 {
                        lblAusgabe.text = "Glückwunsch Spieler 2"
                    } else {
                        lblAusgabe.text = "Glückwunsch Spieler 1"
                    }
                    UIView.animate(withDuration: 0.6, animations: {
                        self.setItem()
                    })
                } else if vKlicksCount == 9 {
                    lblAusgabe.text = "Unentschieden"
                    setItem()
                }
            }
        }
    }
    func removeItem(){
        for i in 1...9 {
            if let vButton = view.viewWithTag(i) as? UIButton{
                vButton.setImage((nil), for: [])
            }
        }
        vKlicksCount = 0
        lblAusgabe.text = "Viel Spaß"
        vGameStat = [ 0, 0, 0,
                      0, 0, 0,
                      0, 0, 0]
        vActiceGame = true
        lblAusgabe.isHidden = true
        btnAgain.isHidden = true
        lblAusgabe.center = CGPoint(x: lblAusgabe.center.x - 500, y: lblAusgabe.center.y)
        btnAgain.center = CGPoint(x: btnAgain.center.x - 500, y: btnAgain.center.y)
    }
    
    func setItem(){
        vActiceGame = false
        btnAgain.isHidden = false
        lblAusgabe.isHidden = false
        self.lblAusgabe.center = CGPoint(x: self.lblAusgabe.center.x + 500, y: self.lblAusgabe.center.y)
        self.btnAgain.center = CGPoint(x: self.btnAgain.center.x + 500, y: self.btnAgain.center.y)
    }
}
