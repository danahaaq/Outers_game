//
//  HomePage.swift
//  Outers_Game
//
//  Created by Ghadah on 05/08/1444 AH.
//
import SwiftUI
import AVFAudio
import UserNotifications

struct HomePage: View {
@State var isActive : Bool = false
@State private var iconSwitch : Bool = false

var body: some View {
    
    ZStack{
        if isActive {
            WhoAreWe()
        }else{
            if(getTime().hasSuffix("AM")){
                LinearGradient(gradient: Gradient(colors: [Color ("LightBlueBackground"), Color("WhiteBackground")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
              
                ZStack{
                    Image("onecloud")
                        .resizable()
                        .scaledToFit()
                        .frame(width:500 ,height:500)
                        .offset(x:40,y:85)
                    
                    Image("HouseMorning")
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
                .padding(.bottom,130)
                
                
                
                Button{
                    isActive = true
                } label: {
                    ZStack{
                        Text("START")
                            .font(.system(size: 30, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                          
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width:260,height:60)
                            .foregroundColor(.white)
                            .opacity(0.7)
                            .shadow(radius: 5)
                            .opacity(0.5)
                          
                    
                           
                    }
                    
                }
                .padding(.top,350)
                
            }else{
                LinearGradient(gradient: Gradient(colors: [Color ("blueBackground"), Color("purpleBackground")]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
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
                .padding(.bottom,130)
                
                
                
                Button{
                 isActive = true
                    
                } label: {
                    ZStack{
                        Text("START")
                            .font(.system(size: 30, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                          
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width:260,height:60)
                            .foregroundColor(.white)
                            .opacity(0.7)
                            .shadow(radius: 5)
                            .opacity(0.5)
                          
                    }
                    
                }
                .padding(.top,350)
                
            }
            
        }
        }
// .fullScreenCover(isPresented: $isActive, content: FatherSenario.init)
.onAppear{
DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
withAnimation {
UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
if success {
print("DONE")
} else if let error = error {
print(error.localizedDescription)
}
}

                }
                
            }
        }
}}
struct StartPage_Previews: PreviewProvider {
static var previews: some View {
HomePage()
}
}

