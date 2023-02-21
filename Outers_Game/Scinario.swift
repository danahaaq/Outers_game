//
//  Scinario.swift
//  Outers_Game
//
//  Created by Aldanah Alqbbani on 01/08/1444 AH.
//

import Foundation
import SwiftUI
import RealityKit

struct ARViewContainer2: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let arView = ARView(frame: .zero)
//                 Load the "Opject" scene from the "dumu" Reality File
        let anchor = try! Dumu.loadScene()
//                 Add the Opject anchor to the scene
        arView.scene.anchors.append(anchor)
        return arView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
//                 Optional: update the view if necessary
    }
}
struct Scinario : View {
    @State var ispressed2 : Bool = false
    @State var ispressed_timer : Bool = false
    @State var countdownTimer = 3
    @State var isActive = false
    @State var timerRunning = true
    @State private var textswitch = false
    
//   The publish(every:tolerance:on:in:options:) operator creates a Timer.TimerPublisher, which is a ConnectablePublisher. As a result, subscribers don’t receive any values until after a call to connect(). For convenience when working with a single subscriber, the autoconnect() operator performs the connect() call when attached to by the subscriber.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            ARViewContainer2()
                .ignoresSafeArea()
            if ispressed2 == false{
                ZStack{
                    Rectangle()
                        .frame(width: 318,height: 340)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .opacity(0.8)
                    
                    VStack(alignment: .leading,spacing:-170){
                        Text("Tom’s \n needs his  car , home and office keys, find \n them!")
                            .multilineTextAlignment(.center)
                            .frame(width: 318,height: 329)
                            .foregroundColor(Color(red: 0.682, green: 0.303, blue: 0.162))
                        
                        //                         New added font
                            .font(Font.custom("RussoOne-Regular", size: 20))
                        
                        Image("dad")
                            .resizable()
                            .frame(width: 142, height: 224)
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
            }
            else{
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
                                .onAppear{
                                    DispatchQueue.main.asyncAfter(deadline: .now()+1.0){
                                        self.textswitch.toggle()
                                        
                                    }
                                }
                        }
                    }
                }
            }
        }
    }
}
struct Scinario_Previews : PreviewProvider {
    static var previews: some View {
        Scinario()
    }
}

// Add Thick border to a the words itself
struct GlowBorder: ViewModifier {
    var color: Color
    var lineWidth: Int
    
    func body(content: Content) -> some View {
        applyShadow(content: AnyView(content), lineWidth: lineWidth)
    }
    
    func applyShadow(content: AnyView, lineWidth: Int) -> AnyView {
        if lineWidth == 0 {
            return content
        } else {
            return applyShadow(content: AnyView(content.shadow(color: color, radius: 1)), lineWidth: lineWidth - 1)
        }
    }
}

extension View {
    func glowBorder(color: Color, lineWidth: Int) -> some View {
        self.modifier(GlowBorder(color: color, lineWidth: lineWidth))
    }
}
