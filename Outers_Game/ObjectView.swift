//
//  ObjectView.swift
//  Outers_Game
//
//  Created by Aldanah Alqbbani on 21/07/1444 AH.
//

import Foundation
import SwiftUI
import RealityKit

struct ARViewContainer3: UIViewRepresentable {
   
    func makeUIView(context: Context) -> UIView {
        let arView = ARView(frame: .zero)
//         Load the "Opject" scene from the "dumu" Reality File
        let anchor = try! Dumu.loadScene()
        // Add the Opject anchor to the scene
        arView.scene.anchors.append(anchor)
     return arView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
//         Optional: update the view if necessary
    }
}
struct ObjectView : View {
    
    var body: some View{
        ARViewContainer3().ignoresSafeArea()
    }
}

struct ObjectView_Previews : PreviewProvider {
    static var previews: some View {
        ObjectView()
    }
}
