//
//  OverviewView.swift
//  VibeSensAr
//
//  Created by Philipp Hemkemeyer on 4/8/23.
//

import SwiftUI

struct OverviewView: View {
    
    @State var score = 10
    
    var body: some View {
        
        TabView {
            MapView(score: $score)
            
            .tabItem {
                    Label("Map", systemImage: "map")
                }
            LeaderboardView(score: $score)
                .tabItem {
                        Label("Leaderboard", systemImage: "trophy")
                    }
            
            
        }
        
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
