//
//  Problem3.swift
//  ProjectEuler
//
//  Created by Lukas Schramm on 03.01.16.
//  Copyright © 2016 Cappricorn. All rights reserved.
//

import Foundation

class Problem3 {
    
    init() {
        print("Problem 3: \(problem3())")
    }
    
    func problem3() -> Int {
        let number = 600851475143
        var actPrimeNumber = 1
        var highestPrime = 1
        var rest = number
        
        actPrimeNumber = actPrimeNumber.nextPrime
        var faktor = actPrimeNumber
        while faktor <= rest {
            if rest%faktor==0 {
                highestPrime = faktor
                rest /= faktor
            } else {
                actPrimeNumber = actPrimeNumber.nextPrime
                faktor = actPrimeNumber
            }
        }
        return highestPrime
    }
}