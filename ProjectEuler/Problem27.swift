//
//  Problem27.swift
//  ProjectEuler
//
//  Created by Lukas Schramm on 06.06.16.
//  Copyright © 2016 Cappricorn. All rights reserved.
//

import Foundation

/*
 Euler discovered the remarkable quadratic formula:
 
 n² + n + 41
 
 It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.
 
 The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.
 
 Considering quadratics of the form:
 
 n² + an + b, where |a| < 1000 and |b| < 1000
 
 where |n| is the modulus/absolute value of n
 e.g. |11| = 11 and |−4| = 4
 Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.
 */
class Problem27 {
    
    init() {
        print("Problem 27: \(problem27())")
    }
    
    func problem27() -> Int {
        var aMax  = -1001
        var bMax = -1001
        var nMax = 0
        
        for a in -999...999 {
            for b in -999...999 {
                var n = 0
                var prime = true
                while prime {
                    if !quadraticformila(n, a: a, b: b).isPrime {
                        prime = false
                    }
                    n += 1
                }
                if n > nMax {
                    nMax = n
                    aMax = a
                    bMax = b
                }
            }
        }
        
        return aMax*bMax
    }
    
    func quadraticformila(n: Int, a: Int, b: Int) -> Int {
        return (n*n + a*n + b)
    }
}