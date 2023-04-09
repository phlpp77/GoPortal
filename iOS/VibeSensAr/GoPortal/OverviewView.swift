//
//  OverviewView.swift
//  VibeSensAr
//
//  Created by Philipp Hemkemeyer on 4/8/23.
//

import SwiftUI

struct OverviewView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("AR Experience") {
                ContentView()
            }
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
