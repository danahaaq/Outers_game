//
//  StartTimer.swift
//  Outers_Game
//
//  Created by saba on 28/07/1444 AH.
//


import SwiftUI
import RealityKit
import ARKit

// coaching
//struct ARViewContainer1 : UIViewRepresentable {
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
//        ARCoachingOverlayView().setActive(false, animated: false)
////        coachingOverly.setActive(false, animated: false)
//        arView.addSubview(coachingOverly)
//
//        return arView
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {
//        // Optional: update the view if necessary
//    }
//}

struct StartTimer: View {
    @State var countdownTimer = 3
    @State var isActive = false
    @State var timerRunning = true
    @State private var textswitch = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
  
    
    var body: some View {
        ZStack{
            ARViewContainer7()
                .ignoresSafeArea()
            if isActive {
                TimerView()
            }  else {
                ZStack{
                    VStack {
                        if countdownTimer > 0{
                            
                            Text("\(countdownTimer)")
                                .padding()
                                .onReceive(timer) { _ in
                                    if countdownTimer > 0 && timerRunning {
                                        countdownTimer -= 1
                                    } else {
                                        //
                                        timerRunning = false
                                    }
                                }
                            
                                .font(Font.custom("RussoOne-Regular", size: 128))
                                .foregroundColor(.white)
                            //                            For the timer font
                                .glowBorder(color: Color(red: 0.345, green: 0.59, blue: 0.878), lineWidth: 5)
                            
                        }
                        else{
                            Text((textswitch ? "  " : "Go "))
                                .font(Font.custom("RussoOne-Regular", size: 128))
                                .foregroundColor(.white)
                            //                            For the timer font
                                .glowBorder(color: Color(red: 0.345, green: 0.59, blue: 0.878), lineWidth: 5)
                            
                        }}
                    
                    .onAppear{
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4){
                            
                            withAnimation{
                                self.isActive = true
                            }}
                        
                    }
                }
                
                
                
                
            }
        }
    }}
struct StartTimer_Previews: PreviewProvider {
    static var previews: some View {
        StartTimer()
    }
}
