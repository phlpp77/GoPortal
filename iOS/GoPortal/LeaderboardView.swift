//
//  LeaderboardView.swift
//  GoPortal
//
//  Created by Philipp Hemkemeyer on 4/8/23.
//

import SwiftUI

struct LeaderboardView: View {
    
    @Binding var score: Int
    
    var body: some View {
        NavigationStack {
            
//            VStack() {
//                HStack {
//                    Spacer()
//                    Image(systemName: "trophy")
//                        .font(.system(size: 60))
//                        .foregroundColor(.accentColor)
//                    Spacer()
//                }
//                .padding(.top, 2)
              
//                .background(Color("backgroundGray"))
                    
                
                List {
                    LeaderboardLineView(name: "Player One", score: $score)
                    LeaderboardLineView(name: "Not really your friend", score: .constant(9))
                    LeaderboardLineView(name: "Other guy", score: .constant(6))
                    LeaderboardLineView(name: "Sister", score: .constant(3))
                    LeaderboardLineView(name: "Mom", score: .constant(-2))
                }
//            }
//            .padding(.vertical, 10)
            
            .navigationTitle("Leaderboard")
            }
            
        }
    }


struct LeaderboardLineView: View {
    
    let name: String
    @Binding var score: Int
    
    var body: some View {
        HStack {
            if name == "Player One" {
                Text(name)
                    .bold()
                    .foregroundColor(.accentColor)
            } else {
                Text(name)
            }
            Spacer()
            Text(String(score))
                .bold()
                .foregroundColor(.accentColor)
                .frame(width: 30)
                .background(Color(UIColor.lightGray))
                .mask(Capsule())
            Text("exp")
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(score: .constant(10))
    }
}
