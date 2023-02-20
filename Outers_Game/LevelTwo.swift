//
//  timer.swift
//  Outers_Game
//
//  Created by Aldanah Alqbbani on 28/07/1444 AH.
//
import SwiftUI
import RealityKit
import ARKit
import UIKit

struct ARViewContainer4: UIViewRepresentable {
    @Binding var timeRemaining : Int
    let anchor = try! Dumu.loadScene()
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        arView.scene.anchors.append(anchor)
        return arView
    }
    func updateUIView(_ uiView: ARView, context: Context) {
//     Optional: update the view if necessary
        if timeRemaining == 10{
            uiView.scene.addAnchor(anchor)
        }
        else if timeRemaining <= 60{
            uiView.scene.removeAnchor(anchor)
        }
        
    }
}
struct LevelTwo: View {
    @State var timeRemaining = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack{
            ARViewContainer4(timeRemaining: $timeRemaining)
                .ignoresSafeArea()
            Text("\(timeRemaining)")
                .font(Font.custom("RussoOne-Regular", size: 128))
                .onReceive(timer) { _ in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    }
                }
        }
        
    }
}
struct LevelTwo_Previews : PreviewProvider {
    static var previews: some View {
        LevelTwo()
    }
}

