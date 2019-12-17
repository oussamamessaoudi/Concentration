//
//  File.swift
//  Concentration
//
//  Created by Oussama Messaoudi on 12/17/19.
//  Copyright © 2019 Oussama Messaoudi. All rights reserved.
//

import Foundation
class Concentration{
    var cards: [Card];
    
    init(numberOfPairs: Int) {
        cards = [Card]();
        for index in 0..<numberOfPairs {
            let card = Card(identifier: index);
            cards.append(card)
            cards.append(card)
        }
        cards.shuffle();
    }
    
    var firstChosenIndex : Int?;
    func flipCard(index: Int){
        if(index == firstChosenIndex || cards[index].isMatched) {return;}

        if let firstChosenIndexNotNil = firstChosenIndex {
            if cards[index].identifier == cards[firstChosenIndexNotNil].identifier {
                cards[index].isMatched = true;
                cards[firstChosenIndexNotNil].isMatched = true;
            }
            else {
                cards[index].isFaceUp = true;
            }
            firstChosenIndex = nil;
        }
        else {
            for index in cards.indices{
                cards[index].isFaceUp = false;
            }
            firstChosenIndex = index;
            cards[index].isFaceUp = true;
        }
    }
}
