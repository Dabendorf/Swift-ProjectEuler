//
//  Problem50.swift
//  ProjectEuler
//
//  Created by Lukas Schramm on 02.06.16.
//  Copyright © 2016 Cappricorn. All rights reserved.
//

import Foundation

/*The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?*/
class Problem50 {
    
    init() {
        print("Problem 50: \(problem50())")
    }
    
    func problem50() -> Int {
        var beginnerPrimeNumber = 1
        var sum = 0
        var numOfPrimes = 0
        
        while beginnerPrimeNumber < 1000000 {
            var actPrimeNumber = beginnerPrimeNumber
            beginnerPrimeNumber = beginnerPrimeNumber.nextPrime
            
            var sumTemp = 0
            var numOfPrimesTemp = 0
            
            while sumTemp+actPrimeNumber.nextPrime < 1000000 {
                actPrimeNumber = actPrimeNumber.nextPrime
                sumTemp += actPrimeNumber
                numOfPrimesTemp += 1
            }
            
            if numOfPrimesTemp > numOfPrimes && sumTemp.isPrime {
                numOfPrimes = numOfPrimesTemp
                sum = sumTemp
            }
        }
        return sum
    }
}