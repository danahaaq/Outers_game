//
//  CircularTimer.swift
//  Outers_Game
//
//  Created by saba on 01/08/1444 AH.
//

        import SwiftUI
         
        let timer = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
         
        struct CircularTimer: View {
             
            @State var counter: Int = 0
            var countTo: Int = 10
             
            var body: some View {
                VStack{
                    ZStack{

                        RoundedRectangle(cornerRadius: 60)
                            .fill(Color.black)
                            .opacity(0.5)
                            .frame(width: 350, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 60).trim(from:0, to: progress())
                                    .stroke(
                                        style: StrokeStyle(
                                            lineWidth: 15,
                                            lineCap: .round,
                                            lineJoin:.round
                                        )
                                    )
                                    .foregroundColor(
                                        (completed() ? Color.red : Color.blue)
                                    ).animation(
                                        .linear(duration: 1)))
                              
                         
                        Clock(counter: counter, countTo: countTo)
                    }    .padding(.top,670)
                }.onReceive(timer) { time in
                    if (self.counter < self.countTo) {
                        self.counter += 1
                    }
                }
            }
             
            func completed() -> Bool {
                return progress() == 1
            }
             
            func progress() -> CGFloat {
                return (CGFloat(counter) / CGFloat(countTo))
            }
        }
         
        struct Clock: View {
            var counter: Int
            var countTo: Int
             
            var body: some View {
                VStack {
                    Text(counterToMinutes())
                        .font(.system(size: 30 , weight: .heavy, design: .rounded))
                        .fontWeight(.black)
                        .foregroundColor(.white)
                        .opacity(0.8)
                      
                }
             
            }
             
            func counterToMinutes() -> String {
                let currentTime = countTo - counter
                let seconds = currentTime % 60
                let minutes = Int(currentTime / 60)
                 
        //        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
                return "\(seconds < 10 ? "0" : "")\(seconds)"
            }
        }
 

struct CircularTimer_Previews: PreviewProvider {
    static var previews: some View {
        CircularTimer()
    }
}
