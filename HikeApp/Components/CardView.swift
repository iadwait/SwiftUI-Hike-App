//
//  CardView.swift
//  HikeApp
//
//  Created by Adwait Barkale on 17/07/23.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Variables
    @State private var imageNumber = 1
    @State private var randomNumber = 1
    @State private var isShowingSheet = false
    
    // MARK: - Functions
    
    func randomImage() {
        // Approach 1
        //        randomNumber = Int.random(in: 1...5)
        //        if imageNumber != randomNumber {
        //            imageNumber = randomNumber
        //        } else {
        //            randomImage()
        //        }
        
        // Approach 2
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK: - Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .font(.system(size: 52, weight: .black))
                            .foregroundStyle(
                                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
                            )
                        
                        Spacer() // Added Space
                        
                        Button {
                            // Action:
                            print("Button Tapped")
                            isShowingSheet.toggle()
                            print("isShowingSheet = \(isShowingSheet)")
                        } label: {
                            CustomButtonView()
                            //Text("Button")
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    
                    Text("Fun and enjoyable activities for friends and families.")
                        .foregroundColor(.customGrayMedium)
                        .italic()
                        .multilineTextAlignment(.leading)
                } // End of HEADER
                .padding(.horizontal, 30)
                // MARK: - Main Content
                
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable() // Resizable allows us to resize the image
                        .scaledToFit()
                        .animation(.default, value: imageNumber) // When value of imageNumber changes Animation will be executed at once
                }
                
                // MARK: - Footer
                Button {
                    // Action:
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.system(size: 30, weight: .heavy))
                        .foregroundStyle(
                            LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            }
        }
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
