//
//  Settings.swift
//  Outers_Game
//
//  Created by Shaden on 23/07/1444 AH.
//

import SwiftUI

struct Settings: View {
    @State var PopUp = false
    var body: some View {
        ZStack{
            VStack(spacing: 25){
                Button(action: {
                    withAnimation{PopUp.toggle()}
                }) {
                    Text("Settings")
                }
            //PopUp is a reuseable function , fill the button name and the button destination page
                if PopUp {
                    Settingspop(show: $PopUp , title: "Settings", button1des: "Resume", button2: "Restart", button3: "Exit" )
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
        
    }
}


struct Settingspop: View {
    @Binding var show : Bool
    var title: String
    var button1des: String
    var button2: String?
    var button2des: String?
    var button3: String?
    var button3des: String?
    var button4: String?
    var button4des: String?
    // ? is  optinal values, it is not necessary to have them in every page
    var body: some View {

        ZStack{
            Rectangle()
                .frame(width: 318,height: 340)
                .foregroundColor(.brown)
                .cornerRadius(30)
                .opacity(0.8)
            
            VStack(alignment: .center, spacing: 24){
                // popup view title
                Text(title)
                    .font(Font.custom("RussoOne-Regular",size: 30))
                    .foregroundColor(.white)
                // First button (Resume)
                Button(action: {
                    withAnimation{
                // First button destination
                        print(button1des)
                    }
                }){
                    Rectangle()
                        .frame(width: 257,height: 59)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .opacity(0.5)
                        .overlay(){
                // icon and text
                            HStack(alignment: .center,spacing: 16){
                                Image(systemName: "play.circle")
                                    .foregroundColor(Color("Primaryblue"))
                                    .font(.system(size: 40))
                                Text("Resume")
                                    .font(Font.custom("RussoOne-Regular",size: 24))
                                    .foregroundColor(.white)
                                
                            }.padding(.trailing,50)
                            
                        }
                }
                // Second button (Restart)
                Button(action: {
                    withAnimation{
                      // Second button destination
                        if let button2des: String = button2des {
                            print(button2des)
                        }
                        
                    }
                }){
                    Rectangle()
                        .frame(width: 257,height: 59)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .opacity(0.5)
                        .overlay(){
                  // icon and text
                            HStack(alignment: .center,spacing: 16){
                                Image(systemName: "repeat.circle")
                                    .foregroundColor(Color("Primaryblue"))
                                    .font(.system(size: 40))
                                if let button2: String = button2{
                                    Text(button2)
                                        .font(Font.custom("RussoOne-Regular",size: 24))
                                        .foregroundColor(.white)
                                }
                            }.padding(.trailing,50)
                        }
                }
                // Third button (Exit)
                Button(action: {
                    withAnimation{
                        // Third button destination
                        if let button3des: String = button3des {
                            print(button3des)
                        }
                    }
                }){
                    Rectangle()
                        .frame(width: 257,height: 59)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .opacity(0.5)
                        .overlay(){
                    // icon and text
                            HStack(alignment: .center,spacing: 25){
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(Color("Primaryblue"))
                                    .font(.system(size: 40))
                                if let button3: String = button3{
                                    Text(button3)
                                        .font(Font.custom("RussoOne-Regular",size: 24))
                                        .foregroundColor(.white)
                                    
                                }
                                
                            }.padding(.trailing,91)
                            
                        }
                }
            }
            // Cancel button
            ZStack(){
                Button{
                    withAnimation{
                        if let button4des: String = button4des{
                            print(button4des) }
                    }
                }label: {
                    Rectangle()
                        .frame(width: 318,height: 53)
                        .background(.thinMaterial)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .opacity(0.5)
                        .overlay(){
                            if let button4: String = button4{
                                Text(button4)
                                    .foregroundColor(.white)
                                .font(Font.custom("RussoOne-Regular", size: 24)) }
                        }
                }
            }
            .padding(.top,576)
        }
    }
}

