//
//  LosePopUp.swift
//  Outers_Game
//
//  Created by Ghadah on 05/08/1444 AH.
//
import SwiftUI

struct LosePopUp: View {
@State var ispressed2 = false
@State var isQuit = false
var body: some View {

    ZStack{
        ARViewContainer7()
            .ignoresSafeArea()
        if ispressed2{
            
            FatherSenario()
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
                    Image("SadFather")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 250)
                        .offset(y:75)
                  
                    
                  
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
                        .fullScreenCover(isPresented: $isQuit, content: MotherSenario.init)
                }
            }
            
                
            
                
            }
                
            }
    }
   
      
            
    }
struct LosePopUp_Previews: PreviewProvider {
static var previews: some View {
LosePopUp()
}
}
