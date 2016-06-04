//
//  Problem53.swift
//  ProjectEuler
//
//  Created by Lukas Schramm on 04.06.16.
//  Copyright © 2016 Cappricorn. All rights reserved.
//

import Foundation

/*
 There are exactly ten ways of selecting three from five, 12345:
 
 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
 
 In combinatorics, we use the notation, 5C3 = 10.
 
 In general, nCr = n! / r!(n−r)! ,where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
 It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.
 
 How many, not necessarily distinct, values of  nCr, for 1 ≤ n ≤ 100, are greater than one-million?
 */
class Problem53 {
    
    init() {
        print("Problem 53: \(problem53())")
    }
    
    func problem53() -> Int {
        var counter = 0
        
        for n in 1...100 {
            for k in 1...n {
                var numerator = [Int]()
                var denominator = [Int]()
                
                for i in 1...n {
                    numerator.append(i)
                }
                for i in 1...k {
                    denominator.append(i)
                }
                if n-k > 0 {
                    for i in 1...(n-k) {
                        denominator.append(i)
                    }
                }
                
                let numeratorCopy = numerator
                for i in numeratorCopy {
                    if denominator.contains(i) {
                        let ind1 = numerator.indexOf(i)
                        let ind2 = denominator.indexOf(i)
                        numerator.removeAtIndex(ind1!)
                        denominator.removeAtIndex(ind2!)
                    }
                }
                
                //var product = 1
                var product = BigInt(intNr: 1)
                for i in numerator {
                    product *= i
                }
                for i in denominator {
                    product /= i
                }
                
                print("\(n) über \(k)")
                
                /*if str2Arr.contains(char) {
                    let ind = str2Arr.indexOf(char)
                    str2Arr.removeAtIndex(ind!)
                }*/
                /*if permutations(n, k) > 1000000 {
                //if (n.factorial / (r.factorial * (n-r).factorial)) > 1000000 {
                    counter += 1
                }*/
            }
        }
        
        return counter
    }
    
    /*func permutations(n: Int, _ k: Int) -> Int {
        var result = 1
        for i in 0..<k {
            result *= (n - i)
            result /= (i + 1)
        }
        return result
    }*/
}