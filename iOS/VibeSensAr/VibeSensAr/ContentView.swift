//
//  ContentView.swift
//  VibeSensAr
//
//  Created by Philipp Hemkemeyer on 4/8/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    
    
    @State var feedbackText = "No update"
    
    @State var roomScene = try! Experience.loadRoom()
    
    @State var portalScene = true
    
    @State var showAdvertisement = false
    
    var body: some View {
        ZStack {
            
            
            PortalARView(text: $feedbackText, showModal: $showAdvertisement)
                .ignoresSafeArea()
            
            
            VStack {
                Button("Stop") {
             
                    print("Actions are stopped.")
                    feedbackText = "button pressed!"
                }

                Text(feedbackText)
                Spacer()
            }
            .sheet(isPresented: $showAdvertisement) {
                VStack {
                    Text("Use the following code to get a discount at McDonald's!")
                    Text("#34as23TG")
                        .font(.title2)
                }
                
                
            }
            
            
        }
    }
}

struct PortalARView: UIViewRepresentable {
    
    @Binding var text: String
    @Binding var showModal: Bool
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let portalAnchor = try! Experience.loadPortal()
        
        portalAnchor.actions.roomOpened.onAction = { _ in
            print("worked.... roomOpened")
            text = "room opened!"
            
            
        }
        
        
        portalAnchor.actions.tableTapped.onAction = { _ in
            print("Table tapped!")
            text = "tabled tapped!!! Fuck yes!"
            showModal.toggle()
        }
        
        arView.scene.anchors.append(portalAnchor)
        
        
        
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
