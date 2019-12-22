//
//  ViewController.swift
//  Concentration
//
//  Created by Oussama Messaoudi on 12/17/19.
//  Copyright © 2019 Oussama Messaoudi. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {

    
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
    @IBOutlet weak var labelScore: UILabel!
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
        if(buttons == nil) {return;}
        for index in buttons.indices {
            let card = game.cards[index];
            let button = buttons[index];
            if(card.isMatched){
                button.setTitle(emoji(card: card), for: UIControl.State.normal);
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
                button.alpha = 0.5
            }
            else if(card.isFaceUp || card.isMatched){
                button.setTitle(emoji(card: card), for: UIControl.State.normal);
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0);
                button.alpha = 1
            }
            else {
                button.setTitle(nil, for: UIControl.State.normal);
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1);
                button.alpha = 1
            }
        }
        labelScore.text = "Score : \(game.score)";
    }
    
    //Mark: theme && emojies
    var theme : [String]? {
        didSet {
            emojiChoices = theme ?? []
            emojies = [Card: String]()
            rebuildUI()
        }
    }
    private var emojiChoices = ConcentrationThemeChooserViewController.themes[._default]!;
    private var emojies = [Card: String]();
    private func emoji(card : Card) -> String{
        if emojies[card] == nil ,  emojiChoices.count > 0 {
            emojies[card] = emojiChoices.remove(at: 0);
        }
        return emojies[card] ?? "?";
    }

}



