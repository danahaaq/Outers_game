//
//  CircularTimer2.swift
//  Outers_Game
//
//  Created by Ghadah on 06/08/1444 AH.
//

import SwiftUI
import RealityKit
import ARKit
import Vision

        let timer = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
         
        struct CircularTimer2: View {
            @State var ispressed2 : Bool = false
            @State var counter: Int = 0
            var countTo: Int = 10
//            @Binding var arVariable: String
            var body: some View {
                ZStack{
                  
                    if ispressed2==false{ZStack{
                       
                    
                        ARViewContainer10()
                            .ignoresSafeArea()
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
                        }}
                        
                        .onAppear{
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 11.5){
                                
                                withAnimation{
                                    self.ispressed2 = true
                                }}
                            
                        }
                        
                        
                        
                        .onReceive(timer) { time in
                            if (self.counter < self.countTo) {
                                self.counter += 1
                            }
                        }
                    }
                    else{LosePopUpM()}
                    
                }}
            
            
            
            
            
            
            
            
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
 











struct CircularTimer2_Previews: PreviewProvider {
    static var previews: some View {
        CircularTimer2()
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
        let anchor = AnchorEntity(plane: .any)
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

