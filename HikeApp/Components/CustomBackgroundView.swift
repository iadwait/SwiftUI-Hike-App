//
//  CustomBackgroundView.swift
//  HikeApp
//
//  Created by Adwait Barkale on 17/07/23.
//

import SwiftUI

struct CustomBackgroundView: View {
    
    var body: some View {
        ZStack {
            // Add Dark Green Color in background and pull a bit down using offset
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            // Add Light Green Color in background and pull a bit down using offset
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            
            LinearGradient(
                colors: [
                    .customGreenLight,
                    .customGreenMedium],
                startPoint: .top,
                endPoint: .bottom)
                .cornerRadius(40)
        }
    }
}

struct CustomBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackgroundView()
            .padding()
    }
}
