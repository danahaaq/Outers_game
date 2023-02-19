//
//  LinearTimer1.swift
//  Outers_Game
//
//  Created by saba on 27/07/1444 AH.
//

import SwiftUI

struct LinearTimer1: View {
    @State private var containerWidth: CGFloat = 0
    @State private var progressTitle: String = "0"
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    @State var countDownTimer = 10
    @State var timerRunning = false
    @State var currentTimer = Timer()
    @State var counter: Int = 0
    var countTo: Int = 30
    
    var maxWidth: Double {
        return min(containerWidth / CGFloat(goal) * CGFloat(step), containerWidth)
    }
    
    private let goal = 10
    @State private var step = 0
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                GeometryReader { geo in
                    RoundedRectangle(cornerRadius: 60)
                        .foregroundColor(.clear)
                        .onAppear {
                            containerWidth = geo.size.width
                        }
                }
                
                RoundedRectangle(cornerRadius: 60)
                    .stroke(Color(.black), lineWidth: 1)
                
                ZStack(alignment: .trailing) {
                    RoundedRectangle(cornerRadius: 60)
                        .fill(Color(.systemPurple))
                    
                    Text("\(countDownTimer)")
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
                        .background(
                            RoundedRectangle(cornerRadius: 60)
                                .fill(Color(.systemPink))
                        )
                }
                .padding(2)
                .frame(minWidth: maxWidth)
                .fixedSize()
//                Text("\(countDownTimer)")
//                    .padding()
                    .onReceive(timer) { _ in
                        if countDownTimer > 0 && timerRunning {
                            countDownTimer -= 1
                            //backword counting
                        } else {
                            timerRunning = true
                        }
                        
                    }
                     .font(.system(size: 20, weight: .heavy, design: .rounded))
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding(20)
            
            .onAppear {
             
                progressTitle = "\(currentTimer)"
            }
            .onReceive(timer) { time in
                if (self.counter < self.countTo) {
                    self.counter += 1
                }
                withAnimation(.linear(duration: 1)) {
                   step += 1
                }
            }
//                        Button("Start") {
            .onAppear{
                            guard step < goal else { return }
                
                            progressTitle = "\(counter)"
                        }
            .tint(Color(.black))
            
        }
    }
    
}


struct LinearTimer1_Previews: PreviewProvider {
    static var previews: some View {
        LinearTimer1()
    }
}
