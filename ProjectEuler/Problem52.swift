//
//  Problem52.swift
//  ProjectEuler
//
//  Created by Lukas Schramm on 04.06.16.
//  Copyright © 2016 Cappricorn. All rights reserved.
//

import Foundation

/*
 It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.
 
 Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
 */
class Problem52 {
    
    init() {
        print("Problem 52: \(problem52())")
    }
    
    func problem52() -> Int {
        var solved = false
        var counter = 1
        while !solved {
            if counter.isPermutation(2*counter) && counter.isPermutation(3*counter) &&
                counter.isPermutation(4*counter) && counter.isPermutation(5*counter) &&
                counter.isPermutation(6*counter) {
                solved = true
                return counter
            }
            counter += 1
        }
    }
}