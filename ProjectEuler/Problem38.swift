//
//  Problem38.swift
//  ProjectEuler
//
//  Created by Lukas Schramm on 02.06.16.
//  Copyright © 2016 Cappricorn. All rights reserved.
//

import Foundation

/*
 Take the number 192 and multiply it by each of 1, 2, and 3:
 
 192 × 1 = 192
 192 × 2 = 384
 192 × 3 = 576
 By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
 
 The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
 
 What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?
 */

class Problem38 {
    
    init() {
        print("Problem 38: \(problem38())")
    }
    
    func problem38() -> Int {
        var biggestPandigital = 0
        var biggestPandigitalNum = 0
        var biggestPandigitalN = 0
        for a in 1...100000 {
            label: for b in 1...9 {
                var strTemp = ""
                for c in 1...b {
                    let product = a*c
                    strTemp += String(product)
                    let strLength = strTemp.characters.count
                    if strLength > 9 {
                        continue label
                    }
                    let biggestPandigitalLength = String(biggestPandigital).characters.count
                    var len = 0
                    if biggestPandigitalLength > strLength {
                        len = strLength
                    } else {
                        len = biggestPandigitalLength
                    }
                    
                    let subStrBiggest = String(biggestPandigital).substringWithRange(String(biggestPandigital).startIndex.advancedBy(0)..<String(biggestPandigital).startIndex.advancedBy(len))
                    let subStrNew = strTemp.substringWithRange(strTemp.startIndex.advancedBy(0)..<strTemp.startIndex.advancedBy(len))
                    
                    if Int(subStrBiggest) > Int(subStrNew) {
                        continue label
                    }
                    
                    if strTemp.isPandigital {
                        if Int(strTemp) > biggestPandigital {
                            biggestPandigital = Int(strTemp)!
                            biggestPandigitalNum = a
                            biggestPandigitalN = b
                        }
                    }
                }
            }
        }
        print("Number: \(biggestPandigitalNum)")
        print("n: \(biggestPandigitalN)")
        return biggestPandigital
    }
}