//
//  CoachingLevel2.swift
//  Outers_Game
//
//  Created by Aldanah Alqbbani on 28/07/1444 AH.
//
import Foundation
import SwiftUI
import RealityKit

struct CoachingLevel2 : View {
    @State var one1 = false
    @State var one2 = false
    var body: some View{
        ZStack{
            if one1 == false{
                ARViewContainer().edgesIgnoringSafeArea(.all)
            }
            else if one1 == true{
                SenarioLevel1()
                
            }else if one2 == true{
                TimerView()
                
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
struct CoachingLevel2_Previews : PreviewProvider {
    static var previews: some View {
        CoachingLevel2()
    }
}
