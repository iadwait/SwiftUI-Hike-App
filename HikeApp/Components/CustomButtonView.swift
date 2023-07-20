//
//  CustomButtonView.swift
//  HikeApp
//
//  Created by Adwait Barkale on 18/07/23.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [.white, .customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom)
                )
                // Swift UI Framework don't allow using .fill and .stroke on same view so need to use another one
            Circle()
                .stroke(
                    LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom), lineWidth: 4
                )
            
            Image(systemName: "figure.hiking")
                .font(.system(size: 30, weight: .black))
                .foregroundStyle(
                    LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
                )
        } // ZStack Ends
        .frame(width: 58, height: 58)
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
            .previewLayout(.sizeThatFits) // Allows to focus on the content instead of screen on preview
            .padding()
    }
}
