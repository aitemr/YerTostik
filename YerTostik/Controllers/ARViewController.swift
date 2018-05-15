//
//  ViewController.swift
//  YerTostik
//
//  Created by Islam on 23.03.2018.
//  Copyright © 2018 Islam Temirbek. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    @IBAction func closeButtonDidPress(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    var name: String?
    
    // Planes: every plane is identified by a UUID.
    
    var currentStatus = ARSessionState.initialized {
        didSet {
            if currentStatus == .failed {
                cleanupARSession()
            }
        }
    }
    
    var planes = [UUID: VirtualPlane]() {
        didSet {
            //            DispatchQueue.main.async { self.statusLabel.text = self.currentStatus.description }
            if planes.count > 0 {
                currentStatus = .ready
            } else {
                if currentStatus == .ready { currentStatus = .initialized }
            }
        }
    }
    
    var selectedPlane: VirtualPlane?
    var arNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // configure settings and debug options for scene
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, SCNDebugOptions.showConstraints, SCNDebugOptions.showLightExtents, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.automaticallyUpdatesLighting = true
        
        
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        // initialize arkit node
        self.initializeARNode()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        sceneView.session.run(configuration)
        if planes.count > 0 { self.currentStatus = .ready }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
        self.currentStatus = .temporarilyUnavailable
    }
    
    func initializeARNode() {
        // Obtain the scene the coffee mug is contained inside, and extract it.
        
        
        if let arSCene = SCNScene(named: "aldar.dae") {
            self.arNode = arSCene.rootNode.childNode(withName: "root", recursively: true)!
        }
    }
    
    // MARK: - Adding, updating and removing planes in the scene in response to ARKit plane detection.
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // create a 3d plane from the anchor
        if let arPlaneAnchor = anchor as? ARPlaneAnchor {
            let plane = VirtualPlane(anchor: arPlaneAnchor)
            self.planes[arPlaneAnchor.identifier] = plane
            node.addChildNode(plane)
            print("Plane added: \(plane)")
        }
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        if let arPlaneAnchor = anchor as? ARPlaneAnchor, let plane = planes[arPlaneAnchor.identifier] {
            plane.updateWithNewAnchor(arPlaneAnchor)
            print("Plane updated: \(plane)")
        }
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor) {
        if let arPlaneAnchor = anchor as? ARPlaneAnchor, let index = planes.index(forKey: arPlaneAnchor.identifier) {
            print("Plane updated: \(planes[index])")
            planes.remove(at: index)
        }
    }
    
    // MARK: - Cleaning up the session
    
    func cleanupARSession() {
        sceneView.scene.rootNode.enumerateChildNodes { (node, stop) -> Void in
            node.removeFromParentNode()
        }
    }
    
    // MARK: - Session tracking methods
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        self.currentStatus = .failed
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        self.currentStatus = .temporarilyUnavailable
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        self.currentStatus = .ready
    }
    
    // MARK: - Selecting planes and adding out ar node.
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            print("Unable to identify touches on any plane. Ignoring interaction...")
            return
        }
        if currentStatus != .ready {
            print("Unable to place objects when the planes are not ready...")
            return
        }
        
        let touchPoint = touch.location(in: sceneView)
        print("Touch happened at point: \(touchPoint)")
        if let plane = virtualPlaneProperlySet(touchPoint: touchPoint) {
            print("Plane touched: \(plane)")
            addCoffeeToPlane(plane: plane, atPoint: touchPoint)
        } else {
            print("No plane was reached!")
        }
    }
    
    func virtualPlaneProperlySet(touchPoint: CGPoint) -> VirtualPlane? {
        let hits = sceneView.hitTest(touchPoint, types: .existingPlaneUsingExtent)
        if hits.count > 0, let firstHit = hits.first, let identifier = firstHit.anchor?.identifier, let plane = planes[identifier] {
            self.selectedPlane = plane
            return plane
        }
        return nil
    }
    
    func addCoffeeToPlane(plane: VirtualPlane, atPoint point: CGPoint) {
        let hits = sceneView.hitTest(point, types: .existingPlaneUsingExtent)
        if hits.count > 0, let firstHit = hits.first {
            if let anotherMugYesPlease = arNode?.clone() {
                anotherMugYesPlease.position = SCNVector3Make(firstHit.worldTransform.columns.3.x, firstHit.worldTransform.columns.3.y, firstHit.worldTransform.columns.3.z)
                sceneView.scene.rootNode.addChildNode(anotherMugYesPlease)
            }
        }
    }
}
