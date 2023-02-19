//
//  StartPage.swift
//  Outers_Game
//
//  Created by saba on 17/07/1444 AH.
//

import SwiftUI
import AVFAudio

struct StartPage: View {
  
    @State private var iconSwitch : Bool = false
 
    var body: some View {
        ZStack{
            if(getTime().hasSuffix("AM")){
                LinearGradient(gradient: Gradient(colors: [Color ("LightBlueBackground"), Color("WhiteBackground")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                ZStack{
                    Button{
                        self.iconSwitch.toggle()
                        if iconSwitch{
                            iconSwitch = true
                            SoundManager.instance.playSound(sound: .wind)
                            
                        }else{
                            SoundManager.instance.player?.pause()
                        }}label: {
                        Image(systemName: self.iconSwitch == true ?  "speaker.wave.2.circle"  :"speaker.slash.circle")
                  
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width:50,height: 50)
                            .opacity(0.7)
                            .font(.headline)
                        
                        
                    }
                    .padding(.bottom,700)
                    .padding(.leading,270)
                    Button{
                        print("tapped")
                    } label: {
                        ZStack{
                            Image(systemName: "trophy.circle")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .frame(width:50,height: 50)
                                .opacity(0.7)
                                .font(.headline)
                        }
                        
                    }
                    .padding(.bottom,700)
                    .padding(.leading,-150)
                    
                    
                    
                    
                }
                ZStack{
                    Image("onecloud")
                        .resizable()
                        .scaledToFit()
                        .frame(width:500 ,height:500)
                        .offset(x:40,y:85)
                    
                    Image("outersHouse")
                        .resizable()
                        .scaledToFit()
                        .frame(width:400,height:400)
                    
                    Image("onecloud")
                        .resizable()
                        .scaledToFit()
                        .frame(width:190 ,height:190)
                        .offset(x:80,y:140)
                    
                    Image("onecloud")
                        .resizable()
                        .scaledToFit()
                        .frame(width:190 ,height:190)
                        .offset(x:-70,y:140)
                    Image("onecloud")
                        .resizable()
                        .scaledToFit()
                        .frame(width:190 ,height:190)
                        .offset(y:150)
                }
                .padding(.bottom,200)
                
                
                
                Button{
                    print("tapped")
                } label: {
                    ZStack{
                        Text("START")
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width:260,height:60)
                            .foregroundColor(.white)
                            .opacity(0.5)
                    }
                    
                }
                .padding(.top,400)
                
            }else{
                LinearGradient(gradient: Gradient(colors: [Color ("blueBackground"), Color("purpleBackground")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                ZStack{
                    Button{
                        self.iconSwitch.toggle()
                        if iconSwitch{
                            iconSwitch = true
                            SoundManager.instance.playSound(sound: .wind)
                            
                        }else{
                            SoundManager.instance.player?.pause()
                        }}label :{
                    
                        Image(systemName: iconSwitch == true ?  "speaker.wave.2.circle" : "speaker.slash.circle")
                        
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width:50,height: 50)
                            .opacity(0.7)
                            .font(.headline)
                           
                    }
                    
                    .padding(.bottom,700)
                    .padding(.leading,270)
                    
                   
                   
                    Button{
                        print("tapped")
                    } label: {
                        ZStack{
                            Image(systemName: "trophy.circle")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .frame(width:50,height: 50)
                                .opacity(0.7)
                                .font(.headline)
                        }
                        
                    }
                    .padding(.bottom,700)
                    .padding(.leading,-150)
                    
                    
                    
                    
                }
                ZStack{
                    Image("onecloud")
                        .resizable()
                        .scaledToFit()
                        .frame(width:500 ,height:500)
                        .offset(x:40,y:85)
                    
                    Image("outersHouse")
                        .resizable()
                        .scaledToFit()
                        .frame(width:400,height:400)
                    
                    Image("onecloud")
                        .resizable()
                        .scaledToFit()
                        .frame(width:190 ,height:190)
                        .offset(x:80,y:140)
                    
                    Image("onecloud")
                        .resizable()
                        .scaledToFit()
                        .frame(width:190 ,height:190)
                        .offset(x:-70,y:140)
                    Image("onecloud")
                        .resizable()
                        .scaledToFit()
                        .frame(width:190 ,height:190)
                        .offset(y:150)
                }
                .padding(.bottom,200)
                
                
                
                Button{
                    print("tapped")
                } label: {
                    ZStack{
                        Text("START")
                            .font(.system(size: 30, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width:260,height:60)
                            .foregroundColor(.white)
                            .opacity(0.5)
                    }
                    
                }
                .padding(.top,400)
                
            }
        }
       
    }
    
}
struct StartPage_Previews: PreviewProvider {
    static var previews: some View {
        StartPage()
    }
}
