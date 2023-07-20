//
//  ContentView.swift
//  HikeApp
//
//  Created by Adwait Barkale on 17/07/23.
//

import SwiftUI

struct ContentView: View {
    
    private let backgroundColor: Color = .colorWhiteLight
    
    var body: some View {
        ZStack {
            CardView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
