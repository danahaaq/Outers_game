//
//  ContentView.swift
//  Outers_Game
//
//  Created by Aldanah Alqbbani on 16/07/1444 AH.
//


import SwiftUI

struct ContentView: View {
    @State private var isRotating = 0.0
    @State private var isRotating2 = 0.0
    @State private var isRotating3 = 0.0
    @State var isActive: Bool = false
    
    var body: some View {
        
        ZStack {
            if(getTime().hasSuffix("AM")){
                LinearGradient(gradient: Gradient(colors: [Color ("LightBlueBackground"), Color("WhiteBackground")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                if isActive {
                    StartPage()
                    
                } else {
                    VStack{
                        ZStack{
                            
                            Image("onecloud")
                                .resizable()
                                .scaledToFit()
                                .frame(width:500 ,height:500)
                                .offset(x:40,y:85)
                            
                                .hueRotation(Angle(degrees: isRotating))
                                .onAppear{
                                    withAnimation(.linear(duration : 5)
                                        .speed(9).repeatForever(autoreverses: true)){
                                            isRotating3 = 5.0
                                        
                                        }}
                            Image("outersHouse")
                                .resizable()
                                .scaledToFit()
                                .frame(width:400,height:400)
                            
                            Image("onecloud")
                                .resizable()
                                .scaledToFit()
                                .frame(width:190 ,height:190)
                                .offset(x:80,y:140)
                            
                                .rotationEffect(.degrees(isRotating))
                                .onAppear{
                                    withAnimation(.linear(duration : 5)
                                        .speed(2).repeatForever(autoreverses: true)){
                                            isRotating = 5.0
                                   
                                        }}
                            
                                Image("onecloud")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:190 ,height:190)
                                    .offset(x:-70,y:140)
                                
                                    .rotationEffect(.degrees(isRotating))
                                    .onAppear{
                                        withAnimation(.linear(duration : 5)
                                            .speed(9).repeatForever(autoreverses: false)){
                                                isRotating2 = 5.0
                                            }}
                            
                            Image("onecloud")
                                .resizable()
                                .scaledToFit()
                                .frame(width:190 ,height:190)
                                .offset(y:150)
                            
                                .rotationEffect(.degrees(isRotating))
                                .onAppear{
                                    withAnimation(.linear(duration : 5)
                                        .speed(9).repeatForever(autoreverses: true)){
                                            isRotating3 = 5.0
                                        
                                        }}
                        }
                        .padding(.bottom,130)

                        
                        Text("The OUTERS Game ")
                            .offset(y:-190)
                            .font(.system(size: 30, weight: .heavy, design: .default))
                            .foregroundColor(.white)
                        
                        
                        
                        
                    }
                    .fullScreenCover(isPresented: $isActive, content: StartPage.init)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 60) {
                            withAnimation {
                                isActive = true
                                SoundManager.instance.playSound(sound: .wind)
                            }
                        }
                    }
                    
                }
            }else{
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color ("blueBackground"), Color("purpleBackground")]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    
                    if isActive {
                        StartPage()
                        
                    } else {
                        VStack{
                            ZStack{
                                
                                Image("onecloud")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:500 ,height:500)
                                    .offset(x:40,y:85)
                                
                                    .hueRotation(Angle(degrees: isRotating))
                                    .onAppear{
                                        withAnimation(.linear(duration : 5)
                                            .speed(9).repeatForever(autoreverses: true)){
                                                isRotating3 = 5.0
                                            
                                            }}
                                Image("outersHouse")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:400,height:400)
                                
                                Image("onecloud")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:190 ,height:190)
                                    .offset(x:80,y:140)
                                
                                    .rotationEffect(.degrees(isRotating))
                                    .onAppear{
                                        withAnimation(.linear(duration : 5)
                                            .speed(2).repeatForever(autoreverses: true)){
                                                isRotating = 5.0
                                       
                                            }}
                                
                                    Image("onecloud")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:190 ,height:190)
                                        .offset(x:-70,y:140)
                                    
                                        .rotationEffect(.degrees(isRotating))
                                        .onAppear{
                                            withAnimation(.linear(duration : 5)
                                                .speed(9).repeatForever(autoreverses: false)){
                                                    isRotating2 = 5.0
                                                }}
                                
                                Image("onecloud")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:190 ,height:190)
                                    .offset(y:150)
                                
                                    .rotationEffect(.degrees(isRotating))
                                    .onAppear{
                                        withAnimation(.linear(duration : 5)
                                            .speed(9).repeatForever(autoreverses: true)){
                                                isRotating3 = 5.0
                                            
                                            }}
                            }
                            .padding(.bottom,130)
                            
                            
                            Text("The OUTERS Game ")
                                .offset(y:-190)
                                .font(.system(size: 30, weight: .heavy, design: .default))
                                .foregroundColor(.white)
                            
                            
                            
                            
                        }
                        .fullScreenCover(isPresented: $isActive, content: StartPage.init)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation {
                                    isActive = true
                                    SoundManager.instance.playSound(sound: .wind)
                                }
                            }
                        }
                        
                    }
                }
            }
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func getTime() -> String {
    let formatter = DateFormatter()
    formatter.timeStyle = .short
    let dateString = formatter.string(from: Date())
    return dateString
}
