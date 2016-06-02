//
//  Problem32.swift
//  ProjectEuler
//
//  Created by Lukas Schramm on 02.06.16.
//  Copyright © 2016 Cappricorn. All rights reserved.
//

import Foundation

/*
 We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
 
 The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
 
 Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
 */
class Problem32 {
    
    init() {
        print("Problem 32: \(problem32())")
    }
    
    func problem32() -> Int {
        var productArr = [Int]()
        for a in 1..<10000 {
            for b in 1..<10000 where String(a).characters.count+String(b).characters.count < 9 {
                let product = a*b
                let str = String(a)+String(b)+String(product)
                if str.characters.count == 9 {
                    if str.isPandigital {
                        if !productArr.contains(product) {
                            productArr.append(product)
                        }
                    }
                }
            }
        }
        var sum = 0
        for a in productArr {
            sum += a
        }
        return sum
    }
}