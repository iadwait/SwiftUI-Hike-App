//
//  GradientButton.swift
//  HikeApp
//
//  Created by Adwait Barkale on 18/07/23.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 20)
            .background(
                configuration.isPressed
                ?
                LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom)
                :
                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
    }
    
}
