//
//  WhoAreWe.swift
//  Outers_Game
//
//  Created by Ghadah on 05/08/1444 AH.
//
import Foundation
import SwiftUI
import RealityKit

        struct WhoAreWe: View {
        @State var isActive : Bool = false
        var body: some View {
        ZStack{
//        ARViewContainer7()
//        .edgesIgnoringSafeArea(.all)
        if isActive {
            FatherSenario()
//        Coaching4Levels()
        }else{
            
        ZStack{
            ARViewContainer7()
            .edgesIgnoringSafeArea(.all)
        Rectangle()
        .frame(width: 280,height: 300)
        .foregroundColor(.white)
        .cornerRadius(30)
        .opacity(0.7)
        Image("FamilyPhoto")
        .resizable()
        .scaledToFit()
        .frame(width: 290, height: 500)
        .offset(x:-5,y:69)
        VStack{
        FadeInOutView9(text: "Hi there !", startTime: 0.1)
        .offset(y:-88)
        FadeInOutView7(text: "Welcome to our FAMILIA", startTime: 1.7)
        .offset(y:-85)

                    FadeInOutView10(text: "where we keep losing our stuff!", startTime: 3.5)
                        .offset(y:-80)
                       
                    FadeInOutView8(text: "⚠️ Help us FIND IT ⚠️", startTime: 5.5)
                        .offset(y:-70)

                }
            }
            ZStack(){
                Button{
                    isActive = true
                    
                }label: {
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 30)
                        
                            .frame(width:260,height:60)
                            .foregroundColor(.white)
                            .opacity(0.7)
                        Text("continue")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .heavy, design: .rounded))
                        
                    }
                    
                }
            }.padding(.top,400)
        }
    }
}
}

struct FadeInOutView7: View {

@State var characters: Array<String.Element>
@State var opacity: Double = 0
@State var baseTime: Double

init(text: String, startTime: Double) {
    characters = Array(text)
    baseTime = startTime
}

var body: some View {
    HStack(spacing:0){
        ForEach(0..<characters.count) { num in
            Text(String(self.characters[num]))
                .foregroundColor(.black)
                .font(.system(size: 20  , weight: .heavy, design: .rounded))
// .frame(width: 300 , height: 500)
.multilineTextAlignment(.center)
.scaleEffect(opacity)
// .opacity(opacity)

                .animation(.easeInOut.delay( Double(num) * 0.05 ),
                           value: opacity)
        }
    }
    .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + baseTime){
            opacity = 1
        }
    }
// .onTapGesture {
// opacity = 0
// DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
// opacity = 1
// }
// }
}
}

struct FadeInOutView8: View {

@State var characters: Array<String.Element>
@State var opacity: Double = 0
@State var baseTime: Double

init(text: String, startTime: Double) {
    characters = Array(text)
    baseTime = startTime
}

var body: some View {
    HStack(spacing:0){
        ForEach(0..<characters.count) { num in
            Text(String(self.characters[num]))
                .foregroundColor(.blue)
                .font(.system(size: 25  , weight: .heavy, design: .rounded))
// .frame(width: 300 , height: 500)
.multilineTextAlignment(.center)
.scaleEffect(opacity)
// .opacity(opacity)

                .animation(.easeInOut.delay( Double(num) * 0.05 ),
                           value: opacity)
                .tint(.black)
                
        }
    }
    .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + baseTime){
            opacity = 1
        }
    }
// .onTapGesture {
// opacity = 0
// DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
// opacity = 1
// }
// }
}
}

struct FadeInOutView9: View {

@State var characters: Array<String.Element>
@State var opacity: Double = 0
@State var baseTime: Double

init(text: String, startTime: Double) {
    characters = Array(text)
    baseTime = startTime
}

var body: some View {
    HStack(spacing:0){
        ForEach(0..<characters.count) { num in
            Text(String(self.characters[num]))
                .foregroundColor(.black)
                .font(.system(size: 25  , weight: .heavy, design: .rounded))
// .frame(width: 300 , height: 500)
.multilineTextAlignment(.center)
.scaleEffect(opacity)
// .opacity(opacity)

                .animation(.easeInOut.delay( Double(num) * 0.05 ),
                           value: opacity)
                .tint(.black)
                
        }
    }
    .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + baseTime){
            opacity = 1
        }
    }
// .onTapGesture {
// opacity = 0
// DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
// opacity = 1
// }
// }
}
}

struct FadeInOutView10: View {

@State var characters: Array<String.Element>
@State var opacity: Double = 0
@State var baseTime: Double

init(text: String, startTime: Double) {
    characters = Array(text)
    baseTime = startTime
}

var body: some View {
    HStack(spacing:0){
        ForEach(0..<characters.count) { num in
            Text(String(self.characters[num]))
                .foregroundColor(.black)
                .font(.system(size: 14  , weight: .heavy, design: .rounded))
// .frame(width: 300 , height: 500)
.multilineTextAlignment(.center)
.scaleEffect(opacity)
// .opacity(opacity)

                .animation(.easeInOut.delay( Double(num) * 0.05 ),
                           value: opacity)
                .tint(.black)
                
        }
    }
    .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + baseTime){
            opacity = 1
        }
    }
// .onTapGesture {
// opacity = 0
// DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
// opacity = 1
// }
// }
}
}

struct WhoAreWe_Previews: PreviewProvider {
static var previews: some View {
WhoAreWe()
}
}
