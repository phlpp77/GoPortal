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
    
    @Binding var score: Int
    
    var body: some View {
        ZStack {
            
            
            PortalARView(text: $feedbackText, showModal: $showAdvertisement, score: $score)
                .ignoresSafeArea()
            
            Image("border")
                .ignoresSafeArea()
                .allowsHitTesting(false)
            
            
            VStack {
//                Text(feedbackText)
                Spacer()
            }
            .sheet(isPresented: $showAdvertisement) {
                VStack {
                    Text("Use the following code to get a discount at McDonald's!")
                        .font(.title3)
                    Text("#34as23TG")
                        .font(.title2)
                        .textSelection(.enabled)
                }
                .padding(28)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
                
                
            }
            
            
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationBarTitle("Find the Portal!")
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(.black)
//        .toolbarBackground(Color.black, for: .navigationBar)
    }
}

struct PortalARView: UIViewRepresentable {
    
    @Binding var text: String
    @Binding var showModal: Bool
    @Binding var score: Int
    
    @State private var feedback = UINotificationFeedbackGenerator()
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let portalAnchor = try! Experience.loadPortal()
        
        portalAnchor.actions.roomOpened.onAction = { _ in
            print("worked.... roomOpened")
            text = "room opened!"
            score += 5
            feedback.notificationOccurred(.success)
            
            
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
        ContentView(score: .constant(10))
    }
}
#endif
