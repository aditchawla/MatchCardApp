//
//  CardModel.swift
//  MatchCard
//
//  Created by Adit Chawla on 13/05/22.
//

import Foundation
class CardModel{
    
    func getCards()->[Card]{
        
        //Declare an empty array
        var generatedCards=[Card]()
        
        // randomly generate 8 pairs of cards
        for  _ in 1...8{
            
            //generate a random number
            let randomNumber=Int.random(in: 1...13)
            //create 2 new card objects
            let cardOne=Card()
            let cardTwo=Card()
            //set their image name
            cardOne.imageName="card\(randomNumber)"
            cardTwo.imageName="card\(randomNumber)"
            
            //add them to the array
            generatedCards += [cardOne, cardTwo]
        }
        //randomize the cards within the array
        generatedCards.shuffle()
        //return the array
        return generatedCards
        
    }
}
