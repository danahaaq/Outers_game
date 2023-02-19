//
//  Levels.swift
//  Outers_Game
//
//  Created by Ghadah on 16/07/1444 AH.
//

import SwiftUI
import Lottie

struct Levels: View {
    @State var x = 150
    @State var y = 300
    @State var count = 0
    @State var ispress = false
    @State var levelnum = "Level 1"

    var body: some View {
        ZStack{if(getTime().hasSuffix("AM")){
            LinearGradient(gradient: Gradient(colors: [Color("blueM"), Color.white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            Rectangle()
                .fill(Color.black)
                .opacity(0.16)
                .frame(width: 300,height: 100)
                .cornerRadius(30)
                .padding(.bottom,250)
            Rectangle()
                .fill(Color.white)
                .opacity(0.50)
                .frame(width: 280,height: 80)
                .cornerRadius(30)
                .padding(.bottom,250)
            
            HStack{
                Image(systemName: "lock.fill")
                    .padding(.bottom,250)
                    .font(.system(size: 30))
                Spacer()
                    .frame(width: 20)
                Text("Subscriptions")
                
                
                    .padding(.bottom,250)
                    .font(.system(size: 24))
                
            }
            ZStack{
                
                
                VStack{
                    Rectangle().fill(Color.white).ignoresSafeArea()
                        .frame(width: 400,height: 380)
                        .opacity(0.1)
                        .blur(radius: 10)
                    Spacer()
                    Text("")
                }
                Image("roadm2")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom,300)
                    .offset(x:10)
                    .frame(width: 480,height: 600)
                    .blur(radius: 5)
                
//                                    Image("road")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 600,height: 600)
                Image("roadm1")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom,-300)
                    .offset(x:10)
                    .frame(width: 480,height: 100)
                
                
                if count == 0 {
                    LottieView(lottieFile: "clouds")
                    
                        .frame(width: 130)
                        .offset(x:150,y: 300)
                    
                }
                
                else if count == 1 {
                    
                    LottieView(lottieFile: "clouds")
                        .animation(Animation.easeIn(duration: 3).speed(1))
                        .frame(width: 130)
                        .offset(x:CGFloat(x),y: CGFloat(y))
                        .onAppear{
                            //                    x += 250
                            levelnum = "Level 1"
                            y -= 130
                            
                            
                        }}
                else if count == 2{
                    LottieView(lottieFile: "clouds")
                        .animation(Animation.easeIn(duration: 3).speed(1))
                        .frame(width: 130)
                        .offset(x:CGFloat(x),y: CGFloat(y))
                        .onAppear{
                            //                    x += 250
                            levelnum = "Level 2"
                            x -= 290
                            
                        }
                }
                else if count == 3{
                    LottieView(lottieFile: "clouds")
                        .animation(Animation.easeIn(duration: 3).speed(1))
                        .frame(width: 130)
                        .offset(x:CGFloat(x),y: CGFloat(y))
                        .onAppear{
                            //                    x += 250
                            levelnum = "Level 3"
                            y -= 130
                            
                            
                        }
                }
                else if count == 4{
                    LottieView(lottieFile: "clouds")
                        .animation(Animation.easeIn(duration: 3).speed(1))
                        .frame(width: 130)
                        .offset(x:CGFloat(x),y: CGFloat(y))
                        .onAppear{
                            //                    x += 250
                            levelnum = "Level 4"
                            x += 290
                            
                            
                        }
                }
                else{
                    LottieView(lottieFile: "clouds")
                    
                        .frame(width: 130)
                        .offset(x:CGFloat(x),y: CGFloat(y))
                }
                
                VStack{
                    Text("Road Map")
                        .font(.system(size: 30))
                        .fontWeight(.heavy)
                        .padding(.vertical,-30)
                    
                    Spacer()
                        .frame(height: 620)
                    Button{
                        
                        print("count = \(count)")
                        if count > 4{
                            ispress = true                    }
                        else {
                            count += 1
                        }
                    }label: {
                        Text("\(levelnum)")
                            .fontWeight(.heavy)
                        //                            .font(Font.custom("RussoOne", size: 20))
                            .foregroundColor(Color("blueM"))
                        //                        .fontWeight(.regular)
                            .font(.system(size: 20))
                            .padding(.vertical,-10)
                    }
                    
                    
                }
                
                
                
            }
        }
        else{
            LinearGradient(gradient: Gradient(colors: [Color("Blue"), Color("Purple")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            Rectangle()
                .fill(Color.black)
                .opacity(0.16)
                .frame(width: 300,height: 100)
                .cornerRadius(30)
                .padding(.bottom,250)
            Rectangle()
                .fill(Color.white)
                .opacity(0.50)
                .frame(width: 280,height: 80)
                .cornerRadius(30)
                .padding(.bottom,250)
            
            HStack{
                Image(systemName: "lock.fill")
                    .padding(.bottom,250)
                    .font(.system(size: 30))
                Spacer()
                    .frame(width: 20)
                Text("Subscriptions")
                
                
                    .padding(.bottom,250)
                    .font(.system(size: 24))
                
            }
            ZStack{
                
                
                VStack{
                    Rectangle().fill(Color.white).ignoresSafeArea()
                        .frame(width: 400,height: 380)
                        .opacity(0.1)
                        .blur(radius: 10)
                    Spacer()
                    Text("")
                }
                Image("road2")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom,280)
                    .frame(width: 380,height: 600)
                    .blur(radius: 5)
                
                //                    Image("road")
                //                        .resizable()
                //                        .scaledToFit()
                //                        .frame(width: 600,height: 600)
                Image("road1")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom,-300)
                    .frame(width: 380,height: 600)
                
                
                if count == 0 {
                    LottieView(lottieFile: "clouds")
                    
                        .frame(width: 130)
                        .offset(x:150,y: 300)
                    
                }
                
                else if count == 1 {
                    
                    LottieView(lottieFile: "clouds")
                        .animation(Animation.easeIn(duration: 3).speed(1))
                        .frame(width: 130)
                        .offset(x:CGFloat(x),y: CGFloat(y))
                        .onAppear{
                            //                    x += 250
                            levelnum = "Level 1"
                            y -= 130
                            
                            
                        }}
                else if count == 2{
                    LottieView(lottieFile: "clouds")
                        .animation(Animation.easeIn(duration: 3).speed(1))
                        .frame(width: 130)
                        .offset(x:CGFloat(x),y: CGFloat(y))
                        .onAppear{
                            //                    x += 250
                            levelnum = "Level 2"
                            x -= 290
                            
                        }
                }
                else if count == 3{
                    LottieView(lottieFile: "clouds")
                        .animation(Animation.easeIn(duration: 3).speed(1))
                        .frame(width: 130)
                        .offset(x:CGFloat(x),y: CGFloat(y))
                        .onAppear{
                            //                    x += 250
                            levelnum = "Level 3"
                            y -= 130
                            
                            
                        }
                }
                else if count == 4{
                    LottieView(lottieFile: "clouds")
                        .animation(Animation.easeIn(duration: 3).speed(1))
                        .frame(width: 130)
                        .offset(x:CGFloat(x),y: CGFloat(y))
                        .onAppear{
                            //                    x += 250
                            levelnum = "Level 4"
                            x += 290
                            
                            
                        }
                }
                else{
                    LottieView(lottieFile: "clouds")
                    
                        .frame(width: 130)
                        .offset(x:CGFloat(x),y: CGFloat(y))
                }
                
                VStack{
                    Text("Road Map")
                        .font(.system(size: 30))
                        .fontWeight(.heavy)
                        .padding(.vertical,-30)
                    
                    Spacer()
                        .frame(height: 620)
                    Button{
                        
                        print("count = \(count)")
                        if count > 4{
                            ispress = true                    }
                        else {
                            count += 1
                        }
                    }label: {
                        Text("\(levelnum)")
                            
                            .fontWeight(.heavy)
                        //                            .font(Font.custom("RussoOne", size: 20))
                            .foregroundColor(.white)
                        //                        .fontWeight(.regular)
                            .font(.system(size: 20))
                            .padding(.vertical,-10)
                    }
                    
                    
                }
                
                
                
            }
        }}.preferredColorScheme(.dark)}
    }
    


struct Levels_Previews: PreviewProvider {
    static var previews: some View {
        Levels()
    }
}


//
//ZStack{
//    Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color("Blue"), Color("Purple")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all)
//
//
//
//        LottieView(lottieFile: "clouds")
//
//
//
//
//    ScrollView(showsIndicators: false){
//    VStack{VStack{
//        Rectangle()
//            .frame(width: 7,height: 200)
//            .foregroundColor(.white)
//            .rotationEffect(.degrees(-30))
//            .opacity(0.5)
//            .padding(.bottom,-50)
//
//        HStack{
//            Circle()
//
//                .frame(width: 20,height: 20)
//                .padding()
//                .foregroundColor(.white)
//                .hidden()
//
//            Spacer()
//                .frame(width: 40)
//            Circle()
//
//                .frame(width: 20,height: 20)
//                .padding()
//                .foregroundColor(.white)
//
//
//        }.padding(.bottom,-50)
//
//    }
//       VStack {
//            Rectangle()
//                .frame(width: 7,height: 200)
//                .foregroundColor(.white)
//                .rotationEffect(.degrees(-150))
//                .opacity(0.5)
//                .padding(.bottom,-50)
//
//            HStack{
//                Circle()
//
//                    .frame(width: 20,height: 20)
//                    .padding()
//                    .foregroundColor(.white)
//
//                Spacer()
//                    .frame(width: 40)
//                Circle()
//
//                    .frame(width: 30,height: 30)
//                    .padding()
//                    .foregroundColor(.white)
//                    .hidden()
//
//            }.padding(.bottom,-50)
//
//        }
//
//        VStack{
//        Rectangle()
//            .frame(width: 7,height: 200)
//            .foregroundColor(.white)
//            .rotationEffect(.degrees(-30))
//            .opacity(0.5)
//            .padding(.bottom,-50)
//
//        HStack{
//            Circle()
//
//                .frame(width: 20,height: 20)
//                .padding()
//                .foregroundColor(.white)
//                .hidden()
//
//            Spacer()
//                .frame(width: 40)
//            Circle()
//
//                .frame(width: 20,height: 20)
//                .padding()
//                .foregroundColor(.white)
//
//
//        }.padding(.bottom,-50)
//
//    }
//    VStack{
//        Rectangle()
//            .frame(width: 7,height: 200)
//            .foregroundColor(.white)
//            .rotationEffect(.degrees(-150))
//            .opacity(0.5)
//            .padding(.bottom,-50)
//
//        HStack{
//            Circle()
//
//                .frame(width: 20,height: 20)
//                .padding()
//                .foregroundColor(.white)
//
//            Spacer()
//                .frame(width: 40)
//            Circle()
//
//                .frame(width: 30,height: 30)
//                .padding()
//                .foregroundColor(.white)
//                .hidden()
//
//        }.padding(.bottom,-50)
//
//    }
//
//
//
//
//        VStack{
//            Rectangle()
//                .frame(width: 7,height: 200)
//                .foregroundColor(.white)
//                .rotationEffect(.degrees(-30))
//                .opacity(0.5)
//                .padding(.bottom,-50)
//
//            HStack{
//                Rectangle()
//
//                    .frame(width: 30,height: 30)
//                    .padding()
//                    .foregroundColor(.white)
//                    .hidden()
//                Spacer()
//                    .frame(width: 100)
//                ZStack{  Circle()
//
//                        .frame(width: 40,height: 40)
//                        .padding()
//                        .foregroundColor(.white)
//                    Text("1")
//                        .bold()
//                        .font(.system(size: 25))
//                }
//                Text("Level 1")
//                    .foregroundColor(.white)
//
//            }}
//        }
//    }
//
//}
