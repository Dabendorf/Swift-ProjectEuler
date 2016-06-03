//
//  Extentions.swift
//  ProjectEuler
//
//  Created by Lukas Schramm on 02.06.16.
//  Copyright © 2016 Cappricorn. All rights reserved.
//

import Foundation

extension Int {
    var factorial: Int {
        if self <= 1 {
            return 1
        } else {
            var product = 1
            for a in 2...self {
                product *= a
            }
            return product
        }
    }
    
    var digits: [Int] {
        return description.characters.map{Int(String($0)) ?? 0}
    }
    
    var nextPrime: Int {
        var tempPrime = self
        if tempPrime%2==0 && tempPrime != 2 {
            tempPrime -= 1
        }
        
        if tempPrime < 2 {
            return 2
        } else if tempPrime == 2 {
            return 3
        } else {
            var prime = false
            while prime == false {
                prime = true
                tempPrime += 2
                
                var n = 3
                repeat {
                    if tempPrime%n == 0 {
                        prime = false
                        break
                    }
                    n += 2
                } while n <= Int(sqrt(Double(self))) + 1
            }
            return tempPrime
        }
    }
    
    var isPrime: Bool {
        if self < 2 {
            return false
        } else if self==2 {
            return true
        } else if self%2==0 {
            return false
        } else {
            var primeBool = true
            var n = 3
            repeat {
                if self%n == 0 {
                    primeBool = false
                    break
                }
                n += 2
            } while n <= Int(sqrt(Double(self))) + 1
            return primeBool
        }
    }
    
    func isPermutation(other: Int) -> Bool {
        let str1 = String(self)
        let str2 = String(other)
        var str2Arr = str2.characters.map({$0})
        if str1.characters.count == str2.characters.count {
            for char in str1.characters {
                if str2Arr.contains(char) {
                    let ind = str2Arr.indexOf(char)
                    str2Arr.removeAtIndex(ind!)
                } else {
                    return false
                }
            }
            return true
        } else {
            return false
        }
    }
}

extension String {
    var isPandigital: Bool {
        if self.characters.count == 9 {
            for a in 1...9 {
                if !self.containsString(String(a)) {
                    return false
                }
            }
            return true
        } else {
            return false
        }
    }
}