//
//  ViewController.swift
//  Shapes
//
//  Created by le on 01/09/2018.
//  Copyright © 2018 LeandroEstrada. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        //let scene = SCNScene(named: "art.scnassets/ship.scn")!
        let scene = SCNScene()
        sceneView.scene = scene
        createShape()
    }
    
    func createShape(){
        
        let pyramid = SCNPyramid(width: 0.2, height: 0.2, length: 0.2)
        pyramid.firstMaterial?.diffuse.contents = UIColor.green
        let pyramidNode = SCNNode(geometry: pyramid)
        pyramidNode.position.z = -0.8
        sceneView.scene.rootNode.addChildNode(pyramidNode)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
}
