//
//  ContentView.swift
//  VibeSensAr
//
//  Created by Philipp Hemkemeyer on 4/8/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @State var completion: ((Entity?) -> ()) = { _ in }
    @State var arView = ARView(frame: .zero)
    @State var boxScene = try! Experience.loadPortal()
    @State var feedbackText = "No update"
    
    var body: some View {
        ZStack {
            ARViewContainer(arView: $arView, boxScene: $boxScene)
                .ignoresSafeArea()
            VStack {
                Button("Stop") {
                    //                        boxScene.steelBox?.stopAllAudio()              // 1
                    //                        boxScene.steelBox?.stopAllAnimations()         // 1
                    print("Actions are stopped.")
                    //
                    completion = {
                        print("completion done")
                        $0?.stopAllAudio()
                        feedbackText = "Room opened"
                    }
                    //                            $0?.stopAllAudio()                         // 2
                    //                            $0?.stopAllAnimations()                    // 2
                    //                            $0?.scale = [1,15,1]
                    //                            print("Both actions were completely stopped.")
                    //                        }
                    //
                    boxScene.actions.roomOpened.onAction = completion
                    //                        boxScene.actions.occured.onAction = completion
                }
                Text(feedbackText)
                Spacer()
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    @Binding var arView: ARView
    @Binding var boxScene: Experience.Portal
    
    func makeUIView(context: Context) -> ARView {
        arView.scene.anchors.append(boxScene)
        return arView
    }
    func updateUIView(_ view: ARView, context: Context) { }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
