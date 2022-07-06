//
//  CardCollectionViewCell.swift
//  MatchCard
//
//  Created by Adit Chawla on 13/05/22.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var frontimageview: UIImageView!
    
    @IBOutlet weak var backimageview: UIImageView!
    
    var card:Card?
    
    func configureCell(card:Card){
        
        //set the front view to the image to the image that represents the card
        frontimageview.image=UIImage(named: card.imageName)
        
        //Reset the state of the cell by chekcing the flipped status of the card and then showing the front or the back imageview accordingly
        
        if card.isFlipped==true{
            //show the front image view
            UIView.transition(from: backimageview, to: frontimageview, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
            
            
            
        }
        else{
            //show the backimage view
            UIView.transition(from: frontimageview, to: backimageview, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews] , completion: nil)
        }
        
        
    }
    
    func flipUp(){
        
        //flip up animation
        UIView.transition(from: backimageview, to: frontimageview, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        
        //set the status of the card
        card?.isFlipped=true
        
    }
    
    func flipDown(){
        
        //flip down animation
        UIView.transition(from: frontimageview, to: backimageview, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews] , completion: nil)
        
        //set the status of the card
        card?.isFlipped=false
    }
    
    func remove(){
        
        //make the image views invisible
        backimageview.alpha=0
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.frontimageview.alpha=0
        }, completion: nil)
    }
    
}
