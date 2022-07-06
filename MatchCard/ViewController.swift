//
//  ViewController.swift
//  MatchCard
//
//  Created by Adit Chawla on 13/05/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    
    let model=CardModel()
    var cardsArray=[Card]()
    var firstFlippedCardIndex:IndexPath?

    
    @IBOutlet weak var collectionview: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cardsArray=model.getCards()
        
        //set the view controller as the data source and the delegate of the collection view
        collectionview.dataSource=self
        collectionview.delegate=self 
    }
    
    //MARK:-Collection View Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //return number of cards
       
        return cardsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //get a cell
        
        let cell=collectionview.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        //configure the cell
        cell.configureCell(card: cardsArray[indexPath.row])
        

        //return it
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //get a reference to the cell that was tapped
        let cell=collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        
        //check the status of the card to determine how to flip it
        if cell?.card?.isFlipped==false{
            
            cell?.flipUp()
            
            //cehck if this is the first card flipped
            if firstFlippedCardIndex==nil{
                
                //this is the first card flipped over
                
                firstFlippedCardIndex=indexPath
            }
            else{
                //second card that is flipped
                
                
                //run the comparison logic
                checkForMatch(indexPath)
            }
            
        }
       
       

    }
    // MARK- game logic methods
    
    func checkForMatch(_ secondFlippedCardIndex:IndexPath){
        //get the two card objects for the two indices and see if they match
        let cardOne=cardsArray[firstFlippedCardIndex!.row]
        let cardTwo=cardsArray[secondFlippedCardIndex.row]
        
        //get the two collection view cells that represent card one and two
        let cardCellOne=collectionview.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        let cardCellTwo=collectionview.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
        //compare the two cards
        if cardOne.imageName==cardTwo.imageName{
            //its a match
            
            //set the status and remove them
            cardOne.isMatched=true
            cardTwo.isMatched=true
            
            cardCellOne?.remove()
            cardCellTwo?.remove()
            
        }
        else{
            //its not a match
            
            //flip them back over
            cardCellOne?.flipDown()
            cardCellTwo?.flipDown()
            //the code above gets flipped too fast so you need to add a delay to it
            
        }
        //reset the first flipped card index property
        firstFlippedCardIndex=nil
    }
        
}

