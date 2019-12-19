//
//  File.swift
//  Concentration
//
//  Created by Oussama Messaoudi on 12/17/19.
//  Copyright © 2019 Oussama Messaoudi. All rights reserved.
//

import Foundation
class Concentration{
    private(set) var cards: [Card]
    
    init(numberOfPairs: Int) {
        self.cards = [Card]();
        for index in 0..<numberOfPairs {
            let card = Card(identifier: index);
            cards.append(card)
            cards.append(card)
        }
        cards.shuffle();
    }
    
    private var firstChosenIndex : Int? {
        get {
            var oneAndOnlyIndex : Int?;
            for index in cards.indices {
                if(cards[index].isFaceUp){
                    if(oneAndOnlyIndex == nil){
                        oneAndOnlyIndex = index;
                    }
                    else {
                        return nil;
                    }
                }
            }
            return oneAndOnlyIndex;
        }
        set {
            for faceDownIndex in cards.indices{
                cards[faceDownIndex].isFaceUp = newValue == faceDownIndex;
            }
        }
    }
    func flipCard(index: Int){
        if(index == firstChosenIndex || cards[index].isMatched) {return;}

        if let firstChosenIndexNotNil = firstChosenIndex {
            cards[index].isFaceUp = true;
            if cards[index].identifier == cards[firstChosenIndexNotNil].identifier {
                cards[index].isMatched = true;
                cards[firstChosenIndexNotNil].isMatched = true;
            }
        }
        else {
            firstChosenIndex = index;
        }
    }
}
