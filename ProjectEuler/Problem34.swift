//
//  Problem34.swift
//  ProjectEuler
//
//  Created by Lukas Schramm on 02.06.16.
//  Copyright © 2016 Cappricorn. All rights reserved.
//

import Foundation

/*
 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
 
 Find the sum of all numbers which are equal to the sum of the factorial of their digits.
 
 Note: as 1! = 1 and 2! = 2 are not sums they are not included.
 */
class Problem34 {
    
    init() {
        print("Problem 34: \(problem34())")
    }
    
    func problem34() -> Int {
        var sumOfDigitFactorials = 0
        for a in 10...100000 {
            var sumTemp = 0
            for digit in a.digits {
                sumTemp += digit.factorial
            }
            if sumTemp == a {
                sumOfDigitFactorials += a
            }
        }
        return sumOfDigitFactorials
    }
}