//
//  LosePopUpM.swift
//  Outers_Game
//
//  Created by Ghadah on 05/08/1444 AH.
//

import SwiftUI

struct LosePopUpM: View {
@State var ispressed2 = false
@State var isQuit = false
var body: some View {

    ZStack{
        ARViewContainer7()
            .ignoresSafeArea()
        if ispressed2{
            
            Coaching4Levels()
        }  else{
            
            ZStack{
                ZStack{
                    Rectangle()
                        .frame(width: 280,height: 300)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .opacity(0.7)
                    VStack{
                        Text("!YOU LOST!")
                        
                            .foregroundColor(.blue)
                            .font(.system(size: 30, weight: .heavy, design: .rounded))
                        
                        Text("would u like to ")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .heavy, design: .rounded))
                        Text("Help Me Find it Again ?")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .heavy, design: .rounded))
                    }.padding(.top,-130)
                    
                    Image("Warning3d")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .offset(x:-70)
                    Image("SadMother")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 290)
                        .offset(y:70)
ZStack{
HStack{

                            Button{
                                ispressed2 = true
                                
                            }label: {
                                ZStack{
                                    
                                    RoundedRectangle(cornerRadius: 30)
                                    
                                        .frame(width:130,height:45)
                                        .foregroundColor(.white)
                                        .opacity(0.7)
                                    Text("Try Again")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                                    
                                }
                                
                            }
                            Button{
                                isQuit = true
                               
                            
                            }label: {
                                ZStack{
                                    
                                    RoundedRectangle(cornerRadius: 30)
                                    
                                        .frame(width:130,height:45)
                                        .foregroundColor(.white)
                                        .opacity(0.7)
                                    Text("Quit")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                                    
                                }
                                
                            }
                        }
                    }.padding(.top,400)
                        .fullScreenCover(isPresented: $isQuit, content: HomePage.init)
                }
            }
            
                
            
                
            }
                
            }
    }
   
      
            
    }
struct LosePopUpM_Previews: PreviewProvider {
static var previews: some View {
LosePopUpM()
}
}
