//
//  ViewController.swift
//  Scattergories
//
//  Created by MuSpork on 2/01/19.
//  Copyright © 2019 Santos. All rights reserved.
//

import UIKit

extension UITextView {
    
    /// Modifies the top content inset to center the text vertically.
    ///
    /// Use KVO on the UITextView contentSize and call this method inside observeValue(forKeyPath:of:change:context:)
    func alignTextVerticallyInContainer() {
        var topCorrect = (self.bounds.size.height - self.contentSize.height * self.zoomScale) / 2
        topCorrect = topCorrect < 0.0 ? 0.0 : topCorrect;
        self.contentInset.top = topCorrect
    }
}

class ViewController: UIViewController {
    
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

    let categories: [String] = ["Toys", "Cars", "Boy's Names", "Spicy Foods", "Things in the sky", "Places to hang out", "Footwear", "Wireless Things", "Reasons to Take Out a Loan", "Car Parts", "Personality Traits", "Sports", "Countries", "Singers", "Tools", "Fruits", "Vegetables", "Drinks", "Songs", "Girl's Names", "Furniture", "Appliance", "Movies", "Clothes", "Weather", "Emotions", "Movie Actors", "Cities", "Jobs", "Desserts", "Colours"];
    
    let alphabet: [Character] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

    let number: String = "";
    
    var textView = UITextView();
    
    func randomizeAlphabet() -> String{
        let randomizerAlphabetNumber = Int.random(in: 0 ... alphabet.count-1);
        let number = String(alphabet[randomizerAlphabetNumber]);
        return number;
    }
    
    func randomizeCategories() -> String {
        let numberOfCategories = Int.random(in: 10 ... 13);
        
        var numberisAvailable: [Bool] = [Bool](repeating: true, count: numberOfCategories);
        var categoriesToShow: [String] = [String](repeating: "", count: numberOfCategories);
        
        for n in 0 ..< numberOfCategories{
            let categoryRandomizer = Int.random(in: 0 ... categories.count-1);
            if(numberisAvailable[n]==true){
                let category = String(categories[categoryRandomizer]);
                
                
                
                numberisAvailable[n]=false;
                print(category);
            }else if(numberisAvailable[n]==false){
                numberisAvailable[n]=true;
            }
 
        }
        
        dump(numberisAvailable)
        
        //dump(categories)
        return "true";
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomizeCategories()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //let categoryRandomizer = Int.random(in: 0 ... categories.count-1);
        /*let numberOfCategories = Int.random(in: 10 ... 13);
        
        var numberisAvailable: [Bool] = [Bool](repeating: false, count: numberOfCategories);
        

        for n in 0 ... numberOfCategories{
            let categoryRandomizer = Int.random(in: 0 ... categories.count-1);
            if(numberisAvailable[n-1]){
                let category = String(categories[categoryRandomizer]);
                numberisAvailable[n-1] = false;
                //print(category)
            }else{
                
            }
            
        }
 
        
        dump(numberisAvailable)
        */
        
        
        //Edit TextView for displaying the letter of the Alphabet
        textView = UITextView(frame: CGRect(x:50,
                                            y:50,
                                            width: (screenWidth/2)-50,
                                            height: ((screenHeight/2)/2)-80));
        
        self.automaticallyAdjustsScrollViewInsets = false;
        textView.isEditable = false;
        textView.isSelectable = false;
        //textView.alignTextVerticallyInContainer()
        //textView.textAlignment = NSTextAlignment.justified;
        textView.textColor = UIColor.black;
        textView.textAlignment = NSTextAlignment.center;
        textView.font = .systemFont(ofSize: 100);
        textView.backgroundColor = UIColor.clear;
        self.view.addSubview(textView);
        textView.text =  randomizeAlphabet();
        textView.layer.borderWidth = 3;
        textView.layer.borderColor = UIColor.black.cgColor
        
        //New Button for shuffling.
        let shuffleButton = UIButton()
        shuffleButton.backgroundColor = UIColor.clear
        shuffleButton.tintColor = UIColor.black
        shuffleButton.frame = CGRect(x:((screenWidth/2)+(screenWidth/4))-20,y:(screenHeight/2)+(screenHeight/2)-70,width: (screenWidth/4), height: (screenHeight/32));
        shuffleButton.setTitle("Shuffle", for: .normal)
        shuffleButton.layer.borderWidth = 3;
        shuffleButton.layer.borderColor = UIColor.black.cgColor
        shuffleButton.setTitleColor(UIColor.black, for: .normal)
        
        self.view.addSubview(shuffleButton);
        
        shuffleButton.addTarget(self, action: #selector(ViewController.shuffleButtonClicked(_:)) , for: .touchUpInside)
        
        
        
        //print(screenWidth);
        //print(screenHeight)
        //print(number);
        //print(catagory);
        //print(randomizerAlphabetNumber);
        //dump(alphabet);
        //dump(catagories);
        
    }
    
    @objc func shuffleButtonClicked(_ sender:UIButton!){
        textView.text = randomizeAlphabet();
        randomizeCategories()
        
    }


    
}

