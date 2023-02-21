//
//  StartTimer.swift
//  Outers_Game
//
//  Created by saba on 28/07/1444 AH.
//


import SwiftUI
import RealityKit
import ARKit

struct StartTimer: View {
    @State var countdownTimer = 3
    @State var isActive = false
    @State var timerRunning = true
    @State private var textswitch = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            
            if isActive == false {
                ARViewContainer7()
                    .ignoresSafeArea()
                ZStack{
                    VStack {
                        if countdownTimer > 0{
                            Text("\(countdownTimer)")
                                .padding()
                                .onReceive(timer) { _ in
                                    if countdownTimer > 0 && timerRunning {
                                        countdownTimer -= 1
                                    }
//                                    else if countdownTimer == 0{
//                                        isActive = true
//                                    }
                                    else {
                                        timerRunning = false
                                    }
                                }
                                .font(.system(size: 130 , weight: .heavy, design: .rounded))
                                .foregroundColor(.white)
                                .glowBorder(color: Color(.black), lineWidth: 5)
                            
                        }
                        else{
                            Text((textswitch ? "  " : "Go "))
                                .font(.system(size: 130 , weight: .heavy, design: .rounded))
                                .foregroundColor(.white)
                                .glowBorder(color: Color(.black), lineWidth: 5)
                        } 
                    }
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4){
                            withAnimation{
                                self.isActive = true
                            }
                        }
                    }
                }
            }
            else {
               LevelTwo()
            }
        }
    }
}
struct StartTimer_Previews: PreviewProvider {
    static var previews: some View {
        StartTimer()
    }
}
