//
//  ViewController.swift
//  LionAndTiger
//
//  Created by nhat on 12/15/14.
//  Copyright (c) 2014 ___nhatmap___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var breedLabel: UILabel!
    
    @IBOutlet weak var labelTigerFact: UILabel!
    
    //create array Tiger
    
    var myTigers:[Tiger] = []
    
    //create array Lion
    
    var lions:[Lion] = []
    
    //create array LionCub
    
    var lionCubs:[LionCub] = []
    
    var currentAnimal = (species: "Tiger", index : 0)
    
    //avoid see same picture
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Create some instance for Tiger
        var myTiger = Tiger()
        
        myTiger.age = 10
        myTiger.name = "Ken"
        myTiger.breed = "meat"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTigers.append(myTiger)
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named:"IndochineseTiger.jpg")
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named:"MalayanTiger.jpg")
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named:"SiberianTiger.jpg")
        
        myTigers += [secondTiger,thirdTiger,fourthTiger]
        
        println("My tiger's name is: \(myTiger.name), its' age is \(myTiger.age),its' breed is \(myTiger.breed), its' image is \(myTiger.image) ")
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        labelTigerFact.text = myTiger.randomFact()
        currentIndex = 0
        
        //Create instanse For Lion
        
        var lion = Lion()
        lion.age = 4
        lion.isAlpaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name  = "Mutafa"
        lion.subspecies = "West Afican"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.name = "Luna"
        lioness.isAlpaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.subspecies = "Barbary"
        
        self.lions += [lion,lioness]
        
        //Create some instances for LionCub
        
        var lionCub = LionCub()
        
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.isAlpaMale = true
        
        var lionCub2 = LionCub();
        
        lionCub2.age = 1
        lionCub2.name = "Nala"
        lionCub2.image = UIImage(named: "LionCub2.jpeg")
        lionCub2.subspecies = "Transvaal"
        lionCub2.isAlpaMale = false
        
        lionCub2.rubLionCubsBelly()
        lionCub2.roar()
        self.lionCubs += [lionCub,lionCub2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPress(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()
    }
    
    func updateAnimal(){
        switch currentAnimal {
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
        case ("Lion", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
            currentAnimal = ("LionCub",randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }
    
    func updateView () {
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.nameLabel.text = tiger.name
                self.ageLabel.text = "\(tiger.age)"
                self.labelTigerFact.text = tiger.randomFact()
            }
            else if self.currentAnimal.species == "Lion"{
                let lion = self.lions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.nameLabel.text = lion.name
                self.ageLabel.text = "\(lion.age)"
                self.breedLabel.text = lion.subspecies
            }else if self.currentAnimal.species == "LionCub"{
                let lionCub = self.lionCubs[self.currentAnimal.index]
                self.myImageView.image = lionCub.image
                self.breedLabel.text = lionCub.subspecies
                self.ageLabel.text = "\(lionCub.age)"
                self.labelTigerFact.text = lionCub.randomFact()
                self.nameLabel.text = lionCub.name
            }
            
                self.labelTigerFact.hidden = false
            
            }, completion: {
                (finished: Bool) -> () in
        })
    }
}

