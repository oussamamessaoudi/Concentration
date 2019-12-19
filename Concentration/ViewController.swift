//
//  ViewController.swift
//  Concentration
//
//  Created by Oussama Messaoudi on 12/17/19.
//  Copyright © 2019 Oussama Messaoudi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    private var game : Concentration! {
        didSet {
            rebuildUI();
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        game = Concentration(numberOfPairs: buttons.count/2);
    }
    
    //Mark: UI
    @IBOutlet private var buttons: [UIButton]!
    @IBAction private func chooseCard(_ sender: UIButton) {
        let index = buttons.firstIndex(of: sender)!;
        game.flipCard(index: index);
        rebuildUI()
    }
    @IBAction private func RestartGame(_ sender: UIButton) {
        game = Concentration(numberOfPairs: buttons.count/2);
    }
    func rebuildUI(){
        for index in buttons.indices {
            let card = game.cards[index];
            let button = buttons[index];
            if(card.isMatched){
                button.setTitle(emoji(indentifier: card.identifier), for: UIControl.State.normal);
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
                button.alpha = 0.5
            }
            else if(card.isFaceUp || card.isMatched){
                button.setTitle(emoji(indentifier: card.identifier), for: UIControl.State.normal);
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
                button.alpha = 1
            }
            else {
                button.setTitle(nil, for: UIControl.State.normal);
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1);
                button.alpha = 1
            }
        }
    }
    
    //Mark: emojies
    private var emojiChoices = ["☠️", "👽", "👻", "💩", "😸", "👾"];
    private var emojies = [Int: String]();
    private func emoji(indentifier : Int) -> String{
        if(emojies[indentifier] == nil){
            emojies[indentifier] = emojiChoices.remove(at: 0);
        }
        return emojies[indentifier] ?? "?";
    }

}



