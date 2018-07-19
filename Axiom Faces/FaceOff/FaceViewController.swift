//
//  ViewController.swift
//  Faces
//
//  Created by Julien Saad
//  Copyright © 2018 Axiom6ai.
//

import UIKit
import ARKit

class FaceViewController: UIViewController, ARSessionDelegate {
    
    @IBOutlet weak var sceneView: SCNView!
    @IBOutlet var expressionLabel: UILabel!

    let session = ARSession()
    var maskNode: Mask!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFaceMaskScene()
    }
    
    // MARK: - AR Session

    var currentFrame: ARFrame!
    var currentFaceAnchor: ARFaceAnchor!

    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        if currentFaceAnchor == nil {
            return
        }
        self.currentFrame = frame
        DispatchQueue.main.async {
            self.updateGameState()
        }
    }

    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        for anchor in anchors {
            if let faceAnchor = anchor as? ARFaceAnchor {
                maskNode.update(withFaceAnchor: faceAnchor)
                currentFaceAnchor = faceAnchor
            }
        }
    }
    
    // MARK: - Game Logic
    
    func updateGameState() {

//        if Smile().isExpressing(from: currentFaceAnchor) {
//            expressionLabel.text = "You are smiling!"
//        }
//        else {
//            expressionLabel.text = "Not smiling 😢"
//        }

        if jawMoving().isExpressing(from: currentFaceAnchor) {
            expressionLabel.text = "Jawww"
        }
        else {
            expressionLabel.text = "nahahh"
        }
    }
}

extension FaceViewController {
    func configureFaceMaskScene() {
        sceneView.backgroundColor = .clear
        sceneView.scene = SCNScene()
        sceneView.rendersContinuously = true
        sceneView.antialiasingMode = .multisampling4X
        sceneView.autoenablesDefaultLighting = true

        // configure our ARKit tracking session for facial recognition
        let config = ARFaceTrackingConfiguration()
        config.worldAlignment = .gravity
        config.isLightEstimationEnabled = true
        session.delegate = self
        session.run(config, options: [.resetTracking, .removeExistingAnchors])

        // floating mask node
        if let device = MTLCreateSystemDefaultDevice(), let geo = ARSCNFaceGeometry(device: device) {
            maskNode = Mask(geometry: geo)
            sceneView.scene?.rootNode.addChildNode(self.maskNode!)
            maskNode.position = SCNVector3(x: 0.0, y: 0.0, z: 0.0)
        }
    }
}
