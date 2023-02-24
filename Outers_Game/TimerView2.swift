//
//  TimerView2.swift
//  Outers_Game
//
//  Created by Ghadah on 02/08/1444 AH.
//

import SwiftUI
import RealityKit
import ARKit
import Vision

// coaching
//struct ARViewContainer8 : UIViewRepresentable {
//
//    func makeUIView(context: Context) -> UIView {
//        let arView = ARView(frame: .zero)
//        let session = arView.session
//
//        let coachingOverly = ARCoachingOverlayView()
//        // this is an intger bit mask that determines how the reciever resized itself.
//        coachingOverly.autoresizingMask = [.flexibleWidth,.flexibleHeight]
//        coachingOverly.goal = .horizontalPlane
//        coachingOverly.session = session
//        // Allow the coachingOverly to start the begain at first
//        coachingOverly.setActive(false, animated: false)
//        arView.addSubview(coachingOverly)
//
//        return arView
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {
//        // Optional: update the view if necessary
//    }
//}
struct TimerView2: View {
    @State var ispressed2 : Bool = false
    @State private var containerWidth: CGFloat = 0
    @State private var progressTitle: String = "0"
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    @State var countDownTimer = 30
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
        ZStack{
//            ARViewContainer7()
//                .ignoresSafeArea()
            if ispressed2 == false{
                ARViewContainer8().edgesIgnoringSafeArea(.all)
                ZStack{
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
                                .stroke(Color(.lightGray), lineWidth: 1)

                            ZStack(alignment: .trailing) {
                                RoundedRectangle(cornerRadius: 60)
                                    .fill(Color(.purple))

                                Text("\(countDownTimer)")
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20))
                                    .background(
                                        RoundedRectangle(cornerRadius: 60)
                                            .fill(Color(.systemBlue))
                                    )
                            }
                            .padding(3)
                            .frame(minWidth: maxWidth)
                            .fixedSize()
                            //                Text("\(countDownTimer)")
                            //                    .padding()
                            .onReceive(timer) { _ in
                                if countDownTimer > 0 && timerRunning {
                                    countDownTimer -= 1
                                    //backword counting

                                }else if countDownTimer == 0{
                                    ispressed2 = true
                                }
                                else {
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
//                            guard step < goal else { return }

                            progressTitle = "\(counter)"
                        }
                        .tint(Color(.black))

                    }
                    .padding()
                }
                .padding(.top,690)

            }

            else if ispressed2 == true{
             
//TimerView()
            }
        }

        }}


struct TimerView2_Previews: PreviewProvider {
    static var previews: some View {
        TimerView2()
    }
}
//struct ARViewContainer7: UIViewRepresentable {
//
//    func makeUIView(context: Context) -> UIView {
//        let arView = ARView(frame: .zero)
//        let session = arView.session
//
////        let coachingOverly = ARCoachingOverlayView()
////        // this is an intger bit mask that determines how the reciever resized itself.
////        coachingOverly.autoresizingMask = [.flexibleWidth,.flexibleHeight]
////        coachingOverly.goal = .horizontalPlane
////        coachingOverly.session = session
////        // Allow the coachingOverly to start the begain at first
//////        ARCoachingOverlayView().setActive(false, animated: false)
////        coachingOverly.setActive(true, animated: true)
////        arView.addSubview(coachingOverly)
//        return arView
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {
//        // Optional: update the view if necessary
//    }
//}
//
//






struct ARViewContainer8: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: HandInteractionARViewController1, context: Context) {
        
    }
    
 
  
    
//    @State var score: Int = 0

    func makeUIViewController(context: UIViewControllerRepresentableContext<ARViewContainer8>) -> HandInteractionARViewController1 {
        let viewController = HandInteractionARViewController1()
        
//        viewController.setScore = {
//            self.score = $0
//        }

//        viewController.getScore = {
//            self.score
//        }

        return viewController
    }
    
    func updateUIViewController(_ uiViewController: HandInteractionARViewController1, context: UIViewControllerRepresentableContext<ARViewContainer8>) -> Int {
        let viewController = HandInteractionARViewController1()
        return viewController.score.self
    }
    func makeCoordinator8() -> ARViewContainer8.Coordinator8 {
        return Coordinator8()
    }
    
    class Coordinator8 {
        
    }
}








class HandInteractionARViewController1: UIViewController, ARSessionDelegate {
    
    private var arView:ARView!
    
    lazy var request:VNRequest = {
        var handPoseRequest = VNDetectHumanHandPoseRequest(completionHandler: handDetectionCompletionHandler)
        handPoseRequest.maximumHandCount = 20
        
        return handPoseRequest
    }()
    
    
    var viewWidth:Int = 0
    var viewHeight:Int = 0
    var box : ModelEntity!
//    var setScore: Optional<((Int) -> Void)> = nil
//    var getScore: Optional<(() -> Int)> = nil
    //     var score = 0
    var scores: [Int] = []
    var score : Int = 0
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
//        setScore = {
//            self.score = $0
//        }
//        getScore = {
//            self.score
//        }
       
    }
    
    
    
    // object
    private func setupObject(){
        let anchor = AnchorEntity(plane: .any)

      
            box = try! ModelEntity.loadModel(named: "07")
            box.generateCollisionShapes(recursive: false)

            anchor.addChild(box)
      
            arView.scene.addAnchor(anchor)
    }
    
    
    
    
    
    
    
    var recentIndexFingerPoint:CGPoint = .zero
    func handDetectionCompletionHandler(request: VNRequest?, error: Error?) {
      
       
        // Human Hand Observation
            guard let observation = request?.results?.first as? VNHumanHandPoseObservation else { return }
        guard let indexFingerTip = try? observation.recognizedPoints(.all)[.indexTip],
              indexFingerTip.confidence > 0.3 else {return}
        
        
        let normalizedIndexPoint = VNImagePointForNormalizedPoint(CGPoint(x: indexFingerTip.location.y, y: indexFingerTip.location.x), viewWidth,  viewHeight)
        // disapper after tab on it
      
            if let entity =
                arView.entity(at: normalizedIndexPoint) as? ModelEntity, entity == box{
               
                entity.anchor?.removeChild(entity)
           score+=100
                print(score)
            }
        recentIndexFingerPoint = normalizedIndexPoint
        
      
//      print(score)
 
    
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


