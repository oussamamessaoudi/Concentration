//
//  Card.swift
//  Concentration
//
//  Created by Oussama Messaoudi on 12/17/19.
//  Copyright © 2019 Oussama Messaoudi. All rights reserved.
//

import Foundation
struct Card: Hashable{
    var isFaceUp = false;
    var isMatched = false;
    private var identifier:Int;
    init(identifier: Int) {
        self.identifier = identifier;
    }
    
    //Mark: Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.identifier)
    }
    static func ==(lhs: Card, rhs: Card) -> Bool{
        return lhs.identifier == rhs.identifier;
    }
    
}
