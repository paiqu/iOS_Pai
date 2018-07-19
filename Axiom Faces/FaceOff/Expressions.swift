//
//  Expressions.swift
//  Faces
//
//  Created by Axiom Academy.
//  Copyright © 2018.
//

import UIKit
import ARKit

protocol Expression {
    // Name of your expression!
    var name: String { get }

    // should return true when the ARFaceAnchor is performing the expression we want
    func isExpressing(from face: ARFaceAnchor) -> Bool
}

// MARK: Expressions

class Smile: Expression {
    var name : String {
        return "Smile 🙂\n"
    }
    
    func isExpressing(from face: ARFaceAnchor) -> Bool {

        let smileLeft = expressionValue(for: .mouthSmileLeft, from: face)
        let smileRight = expressionValue(for: .mouthSmileRight, from: face)

        // 0.5 is a light smile, and 0.9 is an exagerrated smile
        if smileLeft > 0.5 && smileRight > 0.5 {
            return true
        }
        else {
            return false
        }
    }
}

class Frowning: Expression {
    var name: String {
        return "Frowning"
    }

    func isExpressing(from face: ARFaceAnchor) -> Bool {
        let frownLeftValue = expressionValue(for: .browDownLeft, from: face)

        let frownRightValue = expressionValue(for: .browDownRight, from: face)

        if frownRightValue > 0.5 || frownLeftValue > 0.5 {
            return true
        }
        return false
    }
}



class jawMoving: Expression {
    var name: String {
        return "Frowning"
    }
    
    func isExpressing(from face: ARFaceAnchor) -> Bool {
        let jawLeftValue = expressionValue(for: .jawLeft, from: face)
        
        let jawRightValue = expressionValue(for: .jawRight, from: face)
        
        if jawRightValue == 1 || jawLeftValue == 1 {
            return true
        }
        return false
    }
}
