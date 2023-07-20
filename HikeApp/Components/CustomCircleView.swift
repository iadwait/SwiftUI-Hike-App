//
//  CustomCircleView.swift
//  HikeApp
//
//  Created by Adwait Barkale on 18/07/23.
//

import SwiftUI

// TODO: - Motion Animation - Video 29
struct CustomCircleView: View {
    
    @State private var isAnimateGradient = false
    
    var body: some View {
        Circle()
            .fill(
                LinearGradient(
                    colors: [
                        .customIndigoMedium,
                        .customSelmonLight],
                    startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                    endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing)
            )
            .onAppear{
                withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                    isAnimateGradient.toggle()
                }
                
            }
            .frame(width: 256, height: 256)
    }
}

struct CustomCircleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCircleView()
    }
}
