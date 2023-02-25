//
//  CoachingLevel2.swift
//  Outers_Game
//
//  Created by Aldanah Alqbbani on 28/07/1444 AH.
//
import Foundation
import SwiftUI
import RealityKit

struct Coaching4Levels : View {
    @State var one1 = false
    @State var one2 = false
    var body: some View{
        ZStack{
            if one1 == false{
                ARViewContainer().edgesIgnoringSafeArea(.all)
            }
            else if one1 == true{
                FatherSenario()
    
            }

            
        }
                .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+3.0){
                withAnimation{
                    one1 = true
                    
                }
            }
            
        }
    }
}
struct Coaching4Levels_Previews : PreviewProvider {
    static var previews: some View {
        Coaching4Levels()
    }
}
