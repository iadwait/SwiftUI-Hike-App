//
//  CustomListRowView.swift
//  HikeApp
//
//  Created by Adwait Barkale on 19/07/23.
//

import SwiftUI

struct CustomListRowView: View {
    
    // MARK: - PROPERTIES
    // If values are not assigned swift gives error while initializing object
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkURL: String? = nil
    
    var body: some View {
        // 1. Default
        //LabeledContent("Application", value: "Hike")
        // 2. Use below syntax to make changes
        LabeledContent {
            if (rowContent != nil) {
                Text(rowContent!)
                    .foregroundColor(.black)
                    .fontWeight(.heavy)
            } else if (rowLinkLabel != nil && rowLinkURL != nil) {
                Link(rowLinkLabel!, destination: URL(string: rowLinkURL!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
                /*
                 If we want click only on link
                 Button {
                     print("Tapp")
                 } label: {
                     Link(rowLinkLabel!, destination: URL(string: rowLinkURL!)!)
                         .foregroundColor(.pink)
                         .fontWeight(.heavy)
                 }
                 */
            } else {
                EmptyView()
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(rowTintColor)
                        .frame(width: 30, height: 30)
                    
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

struct CustomListRowView_Previews: PreviewProvider {
    static var previews: some View {
        // List to see how component will look after we embed it in a list
        List {
            CustomListRowView(rowLabel: "Website",
                              rowIcon: "globe",
                              rowContent: nil,
                              rowTintColor: .indigo,
                              rowLinkLabel: "Credo Academy",
                              rowLinkURL: "https://credo.academy")
        }
    }
}
