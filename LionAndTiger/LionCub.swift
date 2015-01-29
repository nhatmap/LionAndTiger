//
//  LionCub.swift
//  LionAndTiger
//
//  Created by nhat on 1/29/15.
//  Copyright (c) 2015 ___nhatmap___. All rights reserved.
//

import Foundation
class LionCub:Lion {
    
    func rubLionCubsBelly () {
        println("LionCub: Snuggle and be happy")
    }
    
    override func roar () {
        println("LionCub: Growl Growl")
    }
    
    override func randomFact() -> String{
        var randomFact:String
        if isAlpaMale {
            randomFact = "Cubs are usually hidden in the dense bush for approximately six weeks."
        }else{
            randomFact = "Cubs begin eating meat at about the age of six weeks"
        }
        return randomFact
    }
}