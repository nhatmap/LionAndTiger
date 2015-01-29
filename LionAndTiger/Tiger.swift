//
//  Tiger.swift
//  LionAndTiger
//
//  Created by nhat on 12/15/14.
//  Copyright (c) 2014 ___nhatmap___. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named: "")
    
    func chuff() {
        println("Tiger : Chuff  Chuff")
    }
    
    func chuffNumberOfTime (numberOfTime: Int){
        for var chuff = 0; chuff < numberOfTime; ++chuff {
            self.chuff()
        }
    }
    
    func chuffNumberOfTimes (numberOfTime: Int, isLoud : Bool){
        for var chuffTimes = 1; chuffTimes <= numberOfTime;chuffTimes++ {
            if isLoud {
                chuff()
            }else{
                println("Tiger: puff purr")
            }
        }
    }
    
    func ageInTigerYearsFromAge (regularAge: Int) -> Int {
        let newAge = regularAge * 3
        return newAge
    }
    
    func randomFact() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        
        var randomFact:String
        
        if randomNumber == 0 {
            randomFact = "The tiger is the lagest species in the cat family"
        }else if randomNumber == 1{
            randomFact = "tigers can rach a length 3.3 meters"
        }
        else{
            randomFact = "a group of tigers is known as an 'ambush' or 'streak'"
        }
        
        return randomFact
    }
}