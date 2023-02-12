//
//  ContentView.swift
//  Outers_Game
//
//  Created by Aldanah Alqbbani on 16/07/1444 AH.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let arView = ARView(frame: .zero)
        let session = arView.session
        
        let coachingOverly = ARCoachingOverlayView()
        // this is an intger bit mask that determines how the reciever resized itself.
        coachingOverly.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        coachingOverly.goal = .horizontalPlane
        coachingOverly.session = session
        // Allow the coachingOverly to start the begain at first
        coachingOverly.setActive(true, animated: true)
        arView.addSubview(coachingOverly)
        // Load the "Opject" scene from the "dumu" Reality File
        let anchor = try! Dumu.loadScene()
        // Add the Opject anchor to the scene
        arView.scene.anchors.append(anchor)
        
        return arView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Optional: update the view if necessary
    }
}


struct ContentView : View {
    @State var one1 = false
    
    var body: some View {
        ZStack{
            
            if one1 == false{
                ARViewContainer().edgesIgnoringSafeArea(.all)
                
            }else if one1 == true{
                
                Scinario()
                
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+5.0){
                withAnimation{
                    one1 = true
                }
            }
            
        }
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
