//
//  Lion.swift
//  LionAndTiger
//
//  Created by nhat on 1/13/15.
//  Copyright (c) 2015 ___nhatmap___. All rights reserved.
//

import Foundation

import UIKit

class Lion {
    //declare som attribute
    var  age = 0
    var name = ""
    var isAlpaMale = false
    var image = UIImage(named: "")
    var subspecies = ""
    var breed = ""
    
    func roar(){
        println("Roar Roar Roar");
    }
    
    func randomFact() -> String{
        var randomFact:String
        if (isAlpaMale){
            randomFact = "abc xyz"
        }else{
            randomFact = "xyz abc"
        }
        return randomFact
    }
}