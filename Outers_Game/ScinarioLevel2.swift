//
//  ScinarioLevel2.swift
//  Outers_Game
//
//  Created by Aldanah Alqbbani on 28/07/1444 AH.
//

import Foundation
import SwiftUI
import RealityKit

struct ScinarioLevel2 : View {
    @State var TimerOn : Bool = false
    @State var TimerOn2 : Bool = false
    @State var ispressed2 : Bool = false
    @State var ispressed_timer : Bool = false
    @State var countdownTimer = 3
    @State var isActive = false
    @State var timerRunning = true
    @State private var textswitch = false
    
//   The publish(every:tolerance:on:in:options:) operator creates a Timer.TimerPublisher, which is a ConnectablePublisher. As a result, subscribers don’t receive any values until after a call to connect(). For convenience when working with a single subscriber, the autoconnect() operator performs the connect() call when attached to by the subscriber.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View{
        ZStack{
            ARViewContainer7()
                .ignoresSafeArea()
            if ispressed2{
                
                StartTimer()
            }  else {
                ZStack{
                    Rectangle()
                        .frame(width: 318,height: 340)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .opacity(0.8)
                    
                    VStack(alignment: .leading,spacing:-115){
                        Text("A little girl Lily \n lost her red balloon and was very upset. could you find it \n in  One Minute?.")
                            .multilineTextAlignment(.center)
                            .frame(width: 299,height: 290)
                            .foregroundColor(Color(red: 0.345, green: 0.59, blue: 0.878))
                        //                         New added font
                            .font(Font.custom("RussoOne-Regular", size: 20))
                        
                        Image("cryingKid")
                            .resizable()
                            .frame(width: 142, height: 200)
                    }
                }
                ZStack(){
                    Button{
                        ispressed2 = true
                        
                    }label: {
                        Rectangle()
                            .frame(width: 318,height: 53)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .opacity(0.5)
                            .overlay(){
                                Text("Start")
                                    .foregroundColor(Color(red: 0.345, green: 0.59, blue: 0.878))
                                    .font(Font.custom("RussoOne-Regular", size: 24))
                            }
                    }
                }.padding(.top,576)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now()+1.0){
                            self.textswitch.toggle()
                            
                        }
                    }
            }
            
        }
    }
}
struct ScinarioLevel2_Previews : PreviewProvider {
    static var previews: some View {
        ScinarioLevel2()
    }
}
