//
//  SoundsCodeFile.swift
//  Outers_Game
//
//  Created by saba on 21/07/1444 AH.
//

import SwiftUI
import AVKit


class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
  
    
    enum soundOption : String {
        case  wind
    
    }
    
    func playSound(sound : soundOption ) {

        guard let url = Bundle.main.url(forResource: sound.rawValue , withExtension: ".mp3")
                      
                   
              else { return }
              
              do {
                  player = try AVAudioPlayer(contentsOf: url)
                  player?.numberOfLoops =  100
                  player?.play()
              }
              catch let error {
                  print("Error playing sound\(error.localizedDescription)")
                  
              
              }
         
    }
    
}

struct SoundsCodeFile: View {
    
    var soundManager = SoundManager()
     
    var body: some View {
        VStack{
            Button("Play sound 1"){
               
                SoundManager.instance.playSound(sound: .wind)
            }.foregroundColor(.red)

        }
    }
}

struct SoundsCodeFile_Previews: PreviewProvider {
    static var previews: some View {
        SoundsCodeFile()
    }
}
