//
//  GameCenter.swift
//  Outers_Game
//
//  Created by Ghadah on 17/07/1444 AH.
//

import SwiftUI
import GameKit

struct GameCenter: View {
    var body: some View {
        ZStack{if(getTime().hasSuffix("AM")){
            
            LinearGradient(gradient: Gradient(colors: [Color("blueM"), Color.white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                    
                }
                
                Spacer()
                
            }
            VStack{
                Spacer()
                Image("HomeMorning")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400)
                    .padding(.vertical,-200)
                    .offset(x:15)
               
                
                
            } .blur(radius: 20)
            
            
            
            VStack(spacing: 20){
                ZStack{
                    Rectangle()
                        .frame(width: 330,height: 180)
                        .cornerRadius(15)
                        .foregroundColor(.black)
                        .opacity(0.2)
                    VStack{
                        HStack{
                            Image(systemName:"person.circle")
                                .foregroundColor(Color.white)
                                .font(.system(size: 50))
                                .opacity(0.7)
                            Text("Joestanphil")
                            
                                .font(.system(size: 20))
                            Spacer()
                        }.padding(.horizontal,50)
                        Spacer()
                            .frame(height: 50)
                        HStack{
                            VStack(alignment: .leading){
                                Text("TOTAL")
                                    .font(.system(size: 10))
                                Text("Friends")
                                .font(.system(size: 14))}
                            Spacer()
                            Text("9")
                                .fontWeight(.light)
                                .font(.system(size: 30 , design: .rounded))
                        }.padding(.horizontal,50)
                        
                    }
                }
                .padding(.vertical,-10)
                
                
                ZStack{
                    Rectangle()
                        .frame(width: 330,height: 180)
                        .cornerRadius(15)
                        .foregroundColor(.black)
                        .opacity(0.2)
                    VStack{
                        HStack{
                            Image(systemName:"medal.fill")
                            
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .opacity(0.7)
                            Text("Achievements")
                            
                                .font(.system(size: 20))
                            Spacer()
                        }.padding(.horizontal,50)
                        Spacer()
                            .frame(height: 50)
                        HStack{
                            VStack(alignment: .leading){
                                Text("TOTAL")
                                    .font(.system(size: 10))
                                Text("Completed")
                                .font(.system(size: 14))}
                            Spacer()
                            Text("0/3")
                                .fontWeight(.light)
                                .font(.system(size: 30 , design: .rounded))
                        }.padding(.horizontal,50)
                        
                    }}
                
                ZStack{
                    Rectangle()
                        .frame(width: 330,height: 180)
                        .cornerRadius(15)
                        .foregroundColor(.black)
                        .opacity(0.2)
                    VStack{
                        HStack{
                            Image(systemName:"list.star")
                            
                                .foregroundColor(.white)
                                .font(.system(size: 40 ))
                                .opacity(0.7)
                            Text("Leaderboard")
                            
                                .font(.system(size: 20))
                            Spacer()
                        }.padding(.horizontal,50)
                        Spacer()
                            .frame(height: 50)
                        HStack{
                            VStack(alignment: .leading){
                                Text("POISITON / FRIENDS")
                                    .font(.system(size: 10))
                                Text("Crater Lake")
                                .font(.system(size: 14))}
                            Spacer()
                            Text("#1")
                                .fontWeight(.light)
                                .font(.system(size: 30 , design: .rounded))
                        }.padding(.horizontal,50)
                        
                    }}   .padding(.vertical,-10)
            }
        }
            
            else{
               ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color("Blue"), Color("Purple")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        HStack{
                            Image(systemName: "chevron.backward")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .padding()
                            Spacer()
                            
                        }
                        
                        Spacer()
                        
                    }
                    VStack{
                        Spacer()
                        Image("HomeNight")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 400)
                            .padding(.vertical,-200)
                        
                        
                    } .blur(radius: 20)
                    
                    
                    
                    VStack(spacing: 20){
                        ZStack{
                            Rectangle()
                                .frame(width: 330,height: 180)
                                .cornerRadius(15)
                                .foregroundColor(.white)
                                .opacity(0.1)
                            VStack{
                                HStack{
                                    Image(systemName:"person.circle")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 50))
                                        .opacity(0.7)
                                    Text("Joestanphil")
                                    
                                        .font(.system(size: 20))
                                    Spacer()
                                }.padding(.horizontal,50)
                                Spacer()
                                    .frame(height: 50)
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("TOTAL")
                                            .font(.system(size: 10))
                                        Text("Friends")
                                        .font(.system(size: 14))}
                                    Spacer()
                                    Text("9")
                                        .fontWeight(.light)
                                        .font(.system(size: 30 , design: .rounded))
                                }.padding(.horizontal,50)
                                
                            }
                        }
                        
                        
                        ZStack{
                            Rectangle()
                                .frame(width: 330,height: 180)
                                .cornerRadius(15)
                                .foregroundColor(.white)
                                .opacity(0.1)
                            VStack{
                                HStack{
                                    Image(systemName:"medal.fill")
                                    
                                        .foregroundColor(.white)
                                        .font(.system(size: 40))
                                        .opacity(0.7)
                                    Text("Achievements")
                                    
                                        .font(.system(size: 20))
                                    Spacer()
                                }.padding(.horizontal,50)
                                Spacer()
                                    .frame(height: 50)
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("TOTAL")
                                            .font(.system(size: 10))
                                        Text("Completed")
                                        .font(.system(size: 14))}
                                    Spacer()
                                    Text("0/3")
                                        .fontWeight(.light)
                                        .font(.system(size: 30 , design: .rounded))
                                }.padding(.horizontal,50)
                                
                            }}  .padding(.vertical,-10)
                        ZStack{
                            Rectangle()
                                .frame(width: 330,height: 180)
                                .cornerRadius(15)
                                .foregroundColor(.white)
                                .opacity(0.1)
                            VStack{
                                HStack{
                                    Image(systemName:"list.star")
                                    
                                        .foregroundColor(.white)
                                        .font(.system(size: 40 ))
                                        .opacity(0.7)
                                    Text("Leaderboard")
                                    
                                        .font(.system(size: 20))
                                    Spacer()
                                }.padding(.horizontal,50)
                                Spacer()
                                    .frame(height: 50)
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("POISITON / FRIENDS")
                                            .font(.system(size: 10))
                                        Text("Crater Lake")
                                        .font(.system(size: 14))}
                                    Spacer()
                                    Text("#1")
                                        .fontWeight(.light)
                                        .font(.system(size: 30 , design: .rounded))
                                }.padding(.horizontal,50)
                                
                            }}
                    }
                }  .padding(.vertical,-10)
                
            }
        }.preferredColorScheme(.dark)
        
    }
}

struct GameCenter_Previews: PreviewProvider {
    static var previews: some View {
        GameCenter()
    }
}


func getTime() -> String {
let formatter = DateFormatter()
formatter.timeStyle = .short
let dateString = formatter.string(from: Date())
return dateString
}
