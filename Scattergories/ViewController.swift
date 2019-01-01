//
//  ViewController.swift
//  Scattergories
//
//  Created by MuSpork on 2/01/19.
//  Copyright © 2019 Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let catagories: [String] = ["Toys", "Cars", "Boy's Names", "Spicy Foods", "Things in the sky", "Places to hang out", "Footwear", "Wireless Things", "Reasons to Take Out a Loan", "Car Parts", "Personality Traits", "Sports", "Countries", "Singers", "Tools", "Fruits", "Vegetables", "Drinks", "Songs", "Girl's Names", "Furniture", "Appliance", "Movies", "Clothes", "Weather", "Emotions", "Movie Actors", "Cities", "Jobs", "Desserts", "Colours"];
        
        let alphabet: [Character] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
        
        let randomAlphabetNumber = Int.random(in: 0 ... 26)
        
        
        print(randomAlphabetNumber)
        dump(alphabet);
        dump(catagories);
        
    }


}

