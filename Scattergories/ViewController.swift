//
//  ViewController.swift
//  Scattergories
//
//  Created by MuSpork on 2/01/19.
//  Copyright © 2019 Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Declare Timer Button and Variables.
    var timerButton = UIButton();
    var timer = Timer();
    var timerTextView = UITextView();
    var timerModification = "Start";
    var seconds = 120;

    //Declare categories
    var categories: [String] = ["Toys", "Cars", "Boy's Names", "Spicy Foods", "Things in the sky", "Places to hang out", "Footwear", "Wireless Things", "Reasons to Take Out a Loan", "Car Parts", "Personality Traits", "Sports", "Countries", "Singers", "Tools", "Fruits", "Vegetables", "Drinks", "Songs", "Girl's Names", "Furniture", "Appliances", "Movies", "Clothes", "Weather", "Emotions", "Movie Actors", "Cities", "Jobs", "Desserts", "Colours", "Animals", "Animal Parts", "Body Parts", "Software", "Kinds of words", "Breakfast Foods", "Musical Instruments", "School Subjects", "Things that grow", "TV Shows", "Insects", "Cartoon Characters", "Bodies of Water", "Holidays or Festivals", "Things that are square", "Games", "Athletes", "Relative or Family Member", "Camping Supplies", "Horror Films", "Capital of a Country", "Verb", "Hobbies", "Things in the kitchen", "Flowers or Plants", "Sandwiches", "Presidents", "Things in a park", "Pizza Toppings", "Terms of endearment", "Drugs", "Colleges/Universities", "Crimes", "Items in a suitcase", "Magazines", "Menu Items", "Candy/Confectionery", "Spices/Herbs", "Bad Habits", "Cosmetics/Toiletries", "Leisure Activities", "Common Allergies", "Restaurants", "Weapons", "Things that are round", "Words associated with exercise", "Villains", "Things you replace", "Baby Foods", "Vacation Spots", "Diseases", "Things you wear", "Things at a circus", "Items in a vending Machine", "Famous duos or trios", "Things found in a desk", "Vegetables", "Things you throw away", "Store names", "Trees", "Musical Groups", "Card Games", "Computer Parts", "Websites", "Game terms", "Internet Lingo", "Electronic Gadgets", "Reasons to quit your job", "Things that have stripes", "Tourist Attractions", "Things found in a hospital", "Food/Drink that is green", "Weekend Activities", "Fish", "Land Animal", "Mammal", "Reptile", "Acronym", "Christmas Songs", "Words ending with -n", "Words with double letters", "Children's books", "Olympic Sports", "Things to see at the Zoo", "Math terms", "Animals in books or movies", "Foods you eat raw", "Names used in songs", "Things found at a bar", "Things to do at a party", "Things you make", "Animal noises", "Computer programs", "Things that can kill you", "Words associated with winter", "Historic events", "Things you get in the mail", "Things you do everyday", "Reasons to call the Police", "Reasons to call the Fire Service", "Reasons to call an Ambulance", "Ways to kill time", "Things that have buttons", "Items to take on a road trip", "Car Manufacturer/Brand", "Fast Food", "Birds", "Flying Animal", "Things on a Beach", "Nicknames", "Things that a cold", "Tropical Locations", "Something you are afraid of", "Ethnic Foods", "Things that are Black", "Things that are Blue", "Things that are Green", "Things that are Orange", "Things that are Red", "Things that are Yellow", "Things that are loud", "Things that are quiet", "Things ending with -e", "Sports played indoors", "Things you shout", "Things associated with Christmas", "Stones/Gems", "Street Names"];
    
    //Declaration of variables
    let alphabet: [Character] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

    let number: String = "";
    
    var letterTextView = UITextView();
    var categoryTextView = UITextView();
    
    // Get Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Get Screen height.
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialise categories
        randomizeCategories()
        
        //Create Timer TextView and assign attributes.
        timerTextView = UITextView(frame: CGRect(x: (screenWidth/10+(screenWidth/2)-(screenWidth/8)+screenWidth/82),y: screenWidth/10, width: screenWidth/2,//(screenWidth/2)-(screenWidth/8),
                                                     height: ((screenHeight/2)/2)-screenHeight/16));
        timerTextView.layer.borderWidth = 3;
        timerTextView.layer.borderColor = UIColor.black.cgColor;
        timerTextView.isEditable = false;
        timerTextView.isSelectable = false;
        timerTextView.textColor = UIColor.black;
        timerTextView.textAlignment = NSTextAlignment.center;
        timerTextView.font = .systemFont(ofSize: screenHeight/8);
        timerTextView.backgroundColor = UIColor.clear;
        
        timerTextView.text = String(seconds);
        self.view.addSubview(timerTextView);
        
        
        //Edit TextView for displaying the letter of the Alphabet
        letterTextView = UITextView(frame: CGRect(x:screenWidth/60,
                                                  y:screenWidth/10,
                                                  width: (screenWidth/2)-(screenWidth/8),
                                                  height: ((screenHeight/2)/2)-screenHeight/16));
        
        letterTextView.isEditable = false;
        letterTextView.isSelectable = false;
        letterTextView.textColor = UIColor.black;
        letterTextView.textAlignment = NSTextAlignment.center;
        letterTextView.font = .systemFont(ofSize: screenHeight/8);
        letterTextView.backgroundColor = UIColor.black;
        self.view.addSubview(letterTextView);
        letterTextView.text =  randomizeAlphabet();
        letterTextView.layer.borderWidth = 3;
        letterTextView.layer.borderColor = UIColor.black.cgColor
        
        //New Button for Starting the timer
        timerButton = UIButton();
        timerButton.backgroundColor = UIColor.clear
        timerButton.tintColor = UIColor.black
        timerButton.frame = CGRect(x:((screenWidth/2)+(screenWidth/4))-20-screenWidth/3,y:(screenHeight/2)+(screenHeight/2)-70,width: (screenWidth/4), height: (screenHeight/32));
        timerButton.setTitle("Start", for: .normal)
        timerButton.layer.borderWidth = 3;
        timerButton.layer.borderColor = UIColor.black.cgColor
        timerButton.setTitleColor(UIColor.black, for: .normal)
        self.view.addSubview(timerButton);
        
        //Timer Button onClickListener
        timerButton.addTarget(self, action: #selector(ViewController.timerButtonClicked(_:)), for: .touchUpInside)
        
        
        //New Button for shuffling the categories and letter.
        let shuffleButton = UIButton()
        shuffleButton.backgroundColor = UIColor.clear
        shuffleButton.tintColor = UIColor.black
        shuffleButton.frame = CGRect(x:((screenWidth/2)+(screenWidth/4))-20,y:(screenHeight/2)+(screenHeight/2)-70,width: (screenWidth/4), height: (screenHeight/32));
        shuffleButton.setTitle("Shuffle", for: .normal)
        shuffleButton.layer.borderWidth = 3;
        shuffleButton.layer.borderColor = UIColor.black.cgColor
        shuffleButton.setTitleColor(UIColor.black, for: .normal)
        
        self.view.addSubview(shuffleButton);
        
        //Shuffle Button onClickListener
        shuffleButton.addTarget(self, action: #selector(ViewController.shuffleButtonClicked(_:)) , for: .touchUpInside)
        
        //Testing Playground
        //print(screenWidth);
        //print(screenHeight)
        //print(number);
        //print(catagory);
        //print(randomizerAlphabetNumber);
        //dump(alphabet);
        //dump(catagories);
        
    }
    
    //Function called when Shuffle Button is clicked.
    //***Resets the Stop button to Start and Resets the timer.
    //***Hides the letter of the Alphabet.
    @objc func shuffleButtonClicked(_ sender:UIButton!){
        letterTextView.text = randomizeAlphabet();
        randomizeCategories();
        timerButton.setTitle("Start", for: .normal);
        timerModification = "Start";
        seconds = 120;
        timer.invalidate();
        timerTextView.text = String(seconds);
        letterTextView.backgroundColor = UIColor.black;
    }

    //Function called when Timer Button is clicked
    //***Starts timer when Start button is triggered. Set button Title to stop.
    //***Stops timer when Stop Button is triggered. Set button Title to start.
    @objc func timerButtonClicked(_ sender:UIButton!){
        if(timerModification=="Start"){
            timerButton.setTitle("Stop", for: .normal);
            timerModification = "Stop";
            letterTextView.backgroundColor = UIColor.clear;
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
            
        }else if(timerModification=="Stop"){
            timerButton.setTitle("Start", for: .normal);
            timerModification = "Start";
            seconds = 120;
            timer.invalidate();
            timerTextView.text = String(seconds);
            letterTextView.backgroundColor = UIColor.black;
            
        }
        
    }

    //Start the Timer Countdown.
    //When the timer reaches 0. An AlertDialog is called with the message: Time's Up.
    @objc func counter()
    {
        seconds -= 1;
        timerTextView.text = String(seconds);
        if(seconds == 0){
            timer.invalidate();
            let alert = UIAlertController(title: "", message: "Time's Up", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    //This function returns a random Alphabet
    func randomizeAlphabet() -> String{
        let randomizerAlphabetNumber = Int.random(in: 0 ... alphabet.count-1);
        let number = String(alphabet[randomizerAlphabetNumber]);
        return number;
    }
    
    /*This function is responsible for drawing and assigning random categories to the Frame.
     //Assigns a different value depending on the model of device. i.e Smaller screens require different x,y values.
     */
    func randomizeCategories() {
        
        if(screenHeight <= 700){
        }
        
        let numberOfCategories = 12;
        
        var numberisAvailable: [Bool] = [Bool](repeating: true, count: numberOfCategories);
        var categoriesToShow: [String] = [String](repeating: "", count: numberOfCategories);
        
        for n in 0 ..< numberOfCategories{
            let categoryRandomizer = Int.random(in: 0 ... categories.count-1);
            if(numberisAvailable[n]==true){
                
                let category = String(categories[categoryRandomizer]);
                categoriesToShow[n] = category;
                for n in 0..<n{
                    if(category == categoriesToShow[n]){
                        print("duplicate");
                        categories.shuffle()
                        categoriesToShow[n] = category;
                    }
                }
                
                let calculateY = Int(screenWidth/10 + screenHeight/2/2-screenHeight/16+5);
                
                if(screenHeight <= 700){
                    categoryTextView = UITextView(frame: CGRect(x: screenWidth/60,
                                                                y: CGFloat(calculateY+(n*30)),
                                                                width: screenWidth/2,
                                                                height: screenHeight/28
                        
                        
                    ));
                    categoryTextView.text = String(n+1) + ". " + categoriesToShow[n];
                    categoryTextView.layer.borderColor = UIColor.black.cgColor;
                    categoryTextView.layer.borderWidth = 3;
                    categoryTextView.isEditable = false;
                    categoryTextView.isSelectable = false;
                    
                    self.view.addSubview(categoryTextView);
                    
                    numberisAvailable[n]=false;
                    
                }else if(screenHeight <= 1000){
                    categoryTextView = UITextView(frame: CGRect(x: screenWidth/60,
                                                                y: CGFloat(calculateY+(n*40)),
                                                                width: screenWidth/2,
                                                                height: screenHeight/20
                        
                        
                    ));
                    categoryTextView.text = String(n+1) + ". " + categoriesToShow[n];
                    categoryTextView.layer.borderColor = UIColor.black.cgColor;
                    categoryTextView.layer.borderWidth = 3;
                    categoryTextView.font = .systemFont(ofSize: screenHeight/40);
                    categoryTextView.isEditable = false;
                    categoryTextView.isSelectable = false;
                    
                    
                    self.view.addSubview(categoryTextView);
                    
                    numberisAvailable[n]=false;
                }
                else{
                    
                    categoryTextView = UITextView(frame: CGRect(x: screenWidth/60,
                                                                y: CGFloat(calculateY+(n*30)),
                                                                width: screenWidth/2,
                                                                height: screenHeight/32
                    ));
                    
                    categoryTextView.text = String(n+1) + ". " + categoriesToShow[n];
                    categoryTextView.layer.borderColor = UIColor.black.cgColor;
                    categoryTextView.layer.borderWidth = 3;
                    categoryTextView.isEditable = false;
                    categoryTextView.isSelectable = false;
                    
                    self.view.addSubview(categoryTextView);
                    
                    numberisAvailable[n]=false;
                    //print(category);
                    
                }
            }else if(numberisAvailable[n]==false){
                numberisAvailable[n]=true;
            }
            
        }
        
        dump(categoriesToShow)
        dump(numberisAvailable)
        
    }
    
    
    
}

