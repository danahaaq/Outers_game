//
//  ContentView.swift
//  Outers_Game
//
//  Created by Aldanah Alqbbani on 16/07/1444 AH.
//

import SwiftUI
import RealityKit
import ARKit

//// coaching 
//struct ARViewContainer: UIViewRepresentable {
//    
//    func makeUIView(context: Context) -> UIView {
//        let arView = ARView(frame: .zero)
//        let session = arView.session
//        
//        let coachingOverly = ARCoachingOverlayView()
//        // this is an intger bit mask that determines how the reciever resized itself.
//        coachingOverly.autoresizingMask = [.flexibleWidth,.flexibleHeight]
//        coachingOverly.goal = .horizontalPlane
//        coachingOverly.session = session
//        // Allow the coachingOverly to start the begain at first
////        ARCoachingOverlayView().setActive(false, animated: false)
//        coachingOverly.setActive(true, animated: true)
//        arView.addSubview(coachingOverly)
//
//        return arView
//    }
//    
//    func updateUIView(_ uiView: UIView, context: Context) {
//        // Optional: update the view if necessary
//    }
//}
//
struct ARViewContainer7: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let arView = ARView(frame: .zero)
        let session = arView.session

        return arView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // Optional: update the view if necessary
    }
}

//struct ContentView : View {
//    @State var one1 = false
//    
//    var body: some View {
//        ZStack{
//            
//            if one1 == false{
//                ARViewContainer().edgesIgnoringSafeArea(.all)
//           
//            }else if one1 == true{
//                Scinario()
//                
//            }
//        }.onAppear{
//            DispatchQueue.main.asyncAfter(deadline: .now()+3.0){
//                withAnimation{
//                    one1 = true
//                }
//            }
//            
//        }
//        
//    }
//}
//
//#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//#endif
