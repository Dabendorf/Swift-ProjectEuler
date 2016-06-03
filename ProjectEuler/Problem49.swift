//
//  Problem49.swift
//  ProjectEuler
//
//  Created by Lukas Schramm on 03.06.16.
//  Copyright © 2016 Cappricorn. All rights reserved.
//

import Foundation

/*
 The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
 
 There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
 
 What 12-digit number do you form by concatenating the three terms in this sequence?
 */
class Problem49 {
    
    init() {
        print("Problem 49: \(problem49())")
    }
    
    func problem49() -> Int {
        var primes = [Int]()
        for i in 1000..<10000 {
            if i.isPrime && i != 1487 {
                primes.append(i)
            }
        }
        
        var primePermutations = [(Int,Int,Int)]()
        
        afor:for a in primes {
            for b in primes {
                if a != b && a.isPermutation(b) {
                    for c in primes {
                        if a != c && b != c && a.isPermutation(c) {
                            let abc = [a,b,c].sort()
                            if c-b == b-a {
                                primePermutations.append(abc[0], abc[1], abc[2])
                                break afor
                            }
                        }
                    }
                }
            }
        }
        let str = String(primePermutations[0].0) + String(primePermutations[0].1) + String(primePermutations[0].2)
        return Int(str)!
    }
}