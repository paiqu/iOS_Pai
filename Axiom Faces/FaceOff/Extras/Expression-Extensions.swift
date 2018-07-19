//
//  Expression-Extensions.swift
//  Faces
//
//  Created by Julien Saad on 2018-06-22.
//  Copyright © 2018 Axiom. All rights reserved.
//

import Foundation
import ARKit

extension Expression {
    /* Returns a number from 0 to 1 representing the intensity of how the
     * expression is being detected */
    func expressionValue(for blendShape: ARFaceAnchor.BlendShapeLocation, from: ARFaceAnchor) -> Float {
        guard let blendShape = from.blendShapes[blendShape] else {
            return 0
        }

        return blendShape.floatValue
    }
}
