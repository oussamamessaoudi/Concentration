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
    private(set) var score : Int;
    private(set) var cardsThatBeenShowing :  Set<Int>
    
    init(numberOfPairs: Int) {
        self.cards = [Card]();
        self.score = 0;
        cardsThatBeenShowing = Set<Int>();
        for index in 0..<numberOfPairs {
            let card = Card(identifier: index);
            cards.append(card)
            cards.append(card)
        }
        cards.shuffle();
    }
    
    private var firstChosenIndex : Int? {
        get {
            return cards.indices.filter {cards[$0].isFaceUp}.oneAndOnly
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
            if cards[index] == cards[firstChosenIndexNotNil] {
                score += 2;
                cards[index].isMatched = true;
                cards[firstChosenIndexNotNil].isMatched = true;
            }
            else {
                if(cardsThatBeenShowing.contains(index)){
                    score += -1;
                }
            }
        }
        else {
            firstChosenIndex = index;
        }
        cardsThatBeenShowing.insert(index);
    }
}
extension Collection {
    var oneAndOnly : Element? {
        count == 1 ? first : nil
    }
}
