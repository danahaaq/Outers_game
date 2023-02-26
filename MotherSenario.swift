//
//  ScinarioLevel2.swift
//  Outers_Game
//
//  Created by Aldanah Alqbbani on 28/07/1444 AH.
//

import Foundation
import SwiftUI
import RealityKit
import Vision

import ARKit


struct MotherSenario : View {
    @State var TimerOn : Bool = false
    @State var TimerOn2 : Bool = false
    @State var ispressed2 : Bool = false
    @State var ispressed_timer : Bool = false
    @State var countdownTimer = 3
    @State var isActive = false
    @State var timerRunning = true
    @State private var textswitch = false
    
    //   The publish(every:tolerance:on:in:options:) operator creates a Timer.TimerPublisher, which is a ConnectablePublisher. As a result, subscribers don’t receive any values until after a call to connect(). For convenience when working with a single subscriber, the autoconnect() operator performs the connect() call when attached to by the subscriber.
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View{
        ZStack{
          
            if ispressed2{
                ARViewContainer10()
                    .ignoresSafeArea()
//                CircularTimer()
            }  else {
                ZStack{
                    ARViewContainer7()
                        .ignoresSafeArea()
                    Rectangle()
                        .frame(width: 280,height: 300)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .opacity(0.7)
                    Image("Mother")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 300)
                        .offset(y:73)
                    VStack{
                        FadeInOutView2(text: "Could you Help Me", startTime: 0.1)
                            .offset(y:-90)
                        FadeInOutView2(text: "Find My Kid TOYS ?", startTime: 1.5)
                            .offset(y:-85)

                        FadeInOutView3(text: "⚠️ Harry Up before He Cries ⚠️", startTime: 4.0)
                            .offset(y:-80)
                            


                    }
                }
                ZStack(){
                    Button{
                        ispressed2 = true
                        
                    }label: {
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 30)
                            
                                .frame(width:260,height:60)
                                .foregroundColor(.white)
                                .opacity(0.7)
                            Text("START")
                                .foregroundColor(.black)
                                .font(.system(size: 25, weight: .heavy, design: .rounded))
                            
                        }
                        
                    }
                }.padding(.top,400)
                //            }  else {
                //
                //                ZStack{
                //                    VStack {
                //                        if countdownTimer > 0{
                //
                //                            Text("\(countdownTimer)")
                //                                .padding()
                //                                .onReceive(timer) { _ in
                //                                    if countdownTimer > 0 && timerRunning {
                //                                        countdownTimer -= 1
                //                                    } else {
                //                                        //
                //                                        timerRunning = false
                //                                    }
                //                                }
                //
                //                                .font(Font.custom("RussoOne-Regular", size: 128))
                //                                .foregroundColor(.white)
                //                            //                            For the timer font
                //                                .glowBorder(color: Color(red: 0.345, green: 0.59, blue: 0.878), lineWidth: 5)
                //                        }
                //                        else{
                //                            Text((textswitch ? "  " : "Go "))
                //                                .font(Font.custom("RussoOne-Regular", size: 128))
                //                                .foregroundColor(.white)
                //                            //                            For the timer font
                //                                .glowBorder(color: Color(red: 0.345, green: 0.59, blue: 0.878), lineWidth: 5)
                //
                //
                //
                //                                .onAppear{
                //                                    DispatchQueue.main.asyncAfter(deadline: .now()+1.0){
                //                                        self.textswitch.toggle()
                //
                //                                    }
                
                
                //                                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.5){
                //                                        withAnimation{
                //                                            self.TimerOn = true
                //                                        }
                //                                }
                
                //                        }
            }
            
        }
    }
}

struct FadeInOutView2: View {
    
    @State var characters: Array<String.Element>
    @State var opacity: Double = 0
    @State var baseTime: Double
    
    init(text: String, startTime: Double) {
        characters = Array(text)
        baseTime = startTime
    }
    
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<characters.count) { num in
                Text(String(self.characters[num]))
                    .foregroundColor(.black)
                    .font(.system(size: 23  , weight: .heavy, design: .rounded))
//                    .frame(width: 300 , height: 500)
                    .multilineTextAlignment(.center)
                    .scaleEffect(opacity)
//                    .opacity(opacity)
               
                    .animation(.easeInOut.delay( Double(num) * 0.05 ),
                               value: opacity)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + baseTime){
                opacity = 1
            }
        }
//        .onTapGesture {
//            opacity = 0
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
//                opacity = 1
//            }
//        }
    }
}


struct FadeInOutView3: View {
    
    @State var characters: Array<String.Element>
    @State var opacity: Double = 0
    @State var baseTime: Double
    
    init(text: String, startTime: Double) {
        characters = Array(text)
        baseTime = startTime
    }
    
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<characters.count) { num in
                Text(String(self.characters[num]))
                    .foregroundColor(.blue)
                    .font(.system(size: 16  , weight: .heavy, design: .rounded))
//                    .frame(width: 300 , height: 500)
                    .multilineTextAlignment(.center)
                    .scaleEffect(opacity)
//                    .opacity(opacity)
               
                    .animation(.easeInOut.delay( Double(num) * 0.05 ),
                               value: opacity)
                    .tint(.black)
                    
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + baseTime){
                opacity = 1
            }
        }
//        .onTapGesture {
//            opacity = 0
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
//                opacity = 1
//            }
//        }
    }
}





struct ARViewContainer10: UIViewControllerRepresentable {
    
  
    
//    @State var score: Int = 0

    func makeUIViewController(context: UIViewControllerRepresentableContext<ARViewContainer10>) -> HandInteractionARViewController2 {
        let viewController = HandInteractionARViewController2()
        
//        viewController.setScore = {
//            self.score = $0
//        }

//        viewController.getScore = {
//            self.score
//        }

        return viewController
    }
    
    func updateUIViewController(_ uiViewController: HandInteractionARViewController2, context: UIViewControllerRepresentableContext<ARViewContainer10>)  {
        let viewController = HandInteractionARViewController2()
        
    }
    func makeCoordinator10() -> ARViewContainer10.Coordinator10 {
        return Coordinator10()
    }
    
    class Coordinator10 {
        
    }
}




struct MotherSenario_Previews: PreviewProvider {
    static var previews: some View {
        MotherSenario()
    }
}


class HandInteractionARViewController2: UIViewController, ARSessionDelegate {


    private var arView:ARView!
    // hand tab
    lazy var request:VNRequest = {
        var handPoseRequest = VNDetectHumanHandPoseRequest(completionHandler: handDetectionCompletionHandler)
        handPoseRequest.maximumHandCount = 1
        return handPoseRequest
    }()
    var viewWidth:Int = 0
    var viewHeight:Int = 0
    var box : ModelEntity!
    var box2 : ModelEntity!
    let numBoxes = 5
    let spacing = 0.2
    var cards: [ModelEntity] = []
//     var score = 0
    var x = 0
    var y = 3
    var z = 0.0
//    @Published var score : Int = 4

    var setScore: Optional<((Int) -> Void)> = nil
    var getScore: Optional<(() -> Int)> = nil
//     var score
//    @EnvironmentObject var model: Model


    override func viewDidLoad() { super.viewDidLoad()
        arView = ARView(frame: view.bounds)
        arView.session.delegate = self
        view.addSubview(arView)
        let config = ARWorldTrackingConfiguration()
        config.environmentTexturing = .automatic
        config.frameSemantics = [.personSegmentation]
        config.planeDetection = [.horizontal]
        arView.session.run(config, options: [])
        viewWidth = Int(arView.bounds.width)
        viewHeight = Int(arView.bounds.height)
        setupObject()

    }

    // object
    private func setupObject(){
        let anchor = AnchorEntity(plane: .horizontal)
        // Loop through and create the boxes, positioning them in a line
//        var cards: [ModelEntity] = []
        for i in 0..<5{
            box = try! ModelEntity.loadModel(named: "08")
            box.generateCollisionShapes(recursive: false)
//            box.position = [Float(i) * Float(spacing), 0, 0]
            box.position = [(Float(i)+Float(x)) * Float(spacing), Float(y) * Float(spacing), (Float(i)+Float(z)) * Float(spacing)]
            x = Int.random(in: -20...20)
//            y = Int.random(in: 0...5)
            z = Double(Float.random(in: -20...20))
//            box.generateCollisionShapes(recursive: true)
            cards.append(box)
            anchor.addChild(cards[i])

        }


        arView.scene.addAnchor(anchor)
    }

    var recentIndexFingerPoint:CGPoint = .zero

    func handDetectionCompletionHandler(request: VNRequest?, error: Error?) {

        for i in 0..<cards.capacity{
        // Human Hand Observation
            guard let observation = request?.results?.first as? VNHumanHandPoseObservation else { return }
        guard let indexFingerTip = try? observation.recognizedPoints(.all)[.indexTip],
              indexFingerTip.confidence > 0.3 else {return}


        let normalizedIndexPoint = VNImagePointForNormalizedPoint(CGPoint(x: indexFingerTip.location.y, y: indexFingerTip.location.x), viewWidth,  viewHeight)
        // disapper after tab on it

            if let entity =
                arView.entity(at: normalizedIndexPoint) as? ModelEntity, entity == cards[i]{
                entity.anchor?.removeChild(entity)
//                score = score + 100
                setScore?((getScore?() ?? 0) + 100)
                print("", getScore?() ?? 0)


            }
            recentIndexFingerPoint = normalizedIndexPoint
            //print(score)
        }

    }

    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        let pixelBuffer = frame.capturedImage
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            let handler = VNImageRequestHandler(cvPixelBuffer:pixelBuffer, orientation: .up, options: [:])
            do {
                try handler.perform([(self?.request)!])

            } catch let error {
                print(error)
            }
        }
    }
}

