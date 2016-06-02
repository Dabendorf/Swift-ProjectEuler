//
//  Problem26.swift
//  ProjectEuler
//
//  Created by Lukas Schramm on 02.06.16.
//  Copyright © 2016 Cappricorn. All rights reserved.
//

import Foundation

/*
 A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
 1/2	= 	0.5
 1/3	= 	0.(3)
 1/4	= 	0.25
 1/5	= 	0.2
 1/6	= 	0.1(6)
 1/7	= 	0.(142857)
 1/8	= 	0.125
 1/9	= 	0.(1)
 1/10	= 	0.1
 Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
 
 Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
 */
class Problem26 {
    
    init() {
        print("Problem 26: \(problem26())")
    }
    
    func problem26() -> Int {
        var numWithLongestRec = 0
        var recurringLength = 0
        for a in 1..<1000 {
            if recurringDecimalLength(a) >= recurringLength {
                numWithLongestRec = a
                recurringLength = recurringDecimalLength(a)
            }
        }
        return numWithLongestRec
    }
    
    func recurringDecimalLength(divisor: Int) -> Int {
        var digits = [Int]()
        var temp = [10]
        repeat {
            digits.append(temp.last!/divisor)
            temp.append(temp.last!%divisor*10)
            
            if temp.count > 2 {
                if temp.last! == temp[temp.endIndex-2] {
                    digits.removeRange(0...digits.endIndex-2)
                    break
                }
            }
            
            if temp.count > 2 && digits.first! == 0 {
                digits.removeFirst()
                temp.removeFirst()
            }
        } while !temp.dropLast().contains(temp.last!) && temp.last! != 0
        return digits.count
    }
}