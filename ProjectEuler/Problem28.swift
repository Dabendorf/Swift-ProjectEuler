//
//  Problem28.swift
//  ProjectEuler
//
//  Created by Lukas Schramm on 03.06.16.
//  Copyright © 2016 Cappricorn. All rights reserved.
//

import Foundation

/*
 Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
 
 21 22 23 24 25
 20  7  8  9 10
 19  6  1  2 11
 18  5  4  3 12
 17 16 15 14 13
 
 It can be verified that the sum of the numbers on the diagonals is 101.
 
 What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
 */
class Problem28 {
    
    init() {
        print("Problem 28: \(problem28())")
    }
    
    func problem28() -> Int {
        let lengthField = 1001
        let emptyNum = -1
        var field = Array(count:lengthField, repeatedValue:Array(count:lengthField, repeatedValue:emptyNum))
        
        var counter = 1
        var posX = (lengthField-1)/2
        var posY = (lengthField-1)/2
        
        var borderLeft  = (lengthField-1)/2-1
        var borderRight = (lengthField-1)/2+1
        var borderUp    = (lengthField-1)/2-1
        var borderDown  = (lengthField-1)/2+1
        
        field[posX][posY] = 1
        
        outer: while counter <= lengthField*lengthField {
            while posX < borderRight && posX < lengthField-1 {
                counter += 1
                posX += 1
                field[posY][posX] = counter
                if counter == lengthField*lengthField {
                    break outer
                }
            }
            borderRight += 1
            
            while posY < borderDown && posY < lengthField-1 {
                counter += 1
                posY += 1
                field[posY][posX] = counter
                if counter == lengthField*lengthField {
                    break outer
                }
            }
            borderDown += 1
            
            while posX > borderLeft && posX > 0 {
                counter += 1
                posX -= 1
                field[posY][posX] = counter
                if counter == lengthField*lengthField {
                    break outer
                }
            }
            borderLeft -= 1
            
            while posY > borderUp && posY > 0 {
                counter += 1
                posY -= 1
                field[posY][posX] = counter
                if counter == lengthField*lengthField {
                    break outer
                }
            }
            borderUp -= 1
        }
        
        var sum = 0
        for a in 0..<lengthField {
            sum += field[a][a]
        }
        for a in 0..<lengthField {
            sum += field[a][lengthField-1-a]
        }
        sum -= 1
        return sum
    }
}