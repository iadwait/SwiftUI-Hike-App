//
//  SettingsView.swift
//  HikeApp
//
//  Created by Adwait Barkale on 18/07/23.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - PROPERTIES
    private let alternateAppIcons: [String] = [
    "AppIcon-Backpack",
    "AppIcon-Camera",
    "AppIcon-Campfire",
    "AppIcon-MagnifyingGlass",
    "AppIcon-Map",
    "AppIcon-Mushroom"
    ]
    
    var body: some View {
        List {
            // MARK: - SECTION HEADER
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 66, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 66, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [.customGreenLight,
                                 .customGreenMedium,
                                 .customGreenDark],
                        startPoint: .top,
                        endPoint: .bottom)
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks ?")
                        .font(.title2)
                        .fontWeight(.heavy)
                        //.padding(.horizontal)
                        //.frame(maxWidth: .infinity, alignment: .leading)
                        //.background(.red)
                    
                    Text("This hike which looks gorgeous in photos but is even better once you experience it. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            } // SECTION HEADER END
            .listRowSeparator(.hidden)
            
            // MARK: - SECTION ICONS
            Section(
            header: Text("Alternate Icons")
            ) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(self.alternateAppIcons.indices, id: \.self) { item in
                            Button {
                                // ACTION
                                // Note: - App Icon file not found error shown
                                //2 solutions
                                //1. General -> Check "App Icon Source"
                                //2. Build Settings -> Alternet App Icons set add all Icon Names
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if error != nil {
                                        print("Failed request to update the app's Icon: \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Success! You have changed the app's icon to \(alternateAppIcons[item])")
                                    }
                                }
                            } label: {
                                // UI Design
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top, 8)
                
                Text("Choose your favourite app icon from the collection above.")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 12)
                    //.background(.red)
            }
            .listRowSeparator(.hidden)
            
            // MARK: - SECTION ABOUT
            Section(
                header: Text("About the app"),
                footer:
                    HStack {
                        Spacer()
                        Text("Copyright @ All right reserved.")
                        Spacer()
                    }
                    .padding(.vertical, 8)
            ) {
                CustomListRowView(rowLabel: "Application",
                                  rowIcon: "apps.iphone",
                                  rowContent: "HIKE",
                                  rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility",
                                  rowIcon: "info.circle",
                                  rowContent: "iOS, iPadOS",
                                  rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology",
                                  rowIcon: "swift",
                                  rowContent: "Swift",
                                  rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version",
                                  rowIcon: "gear",
                                  rowContent: "1.0",
                                  rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Developer",
                                  rowIcon: "ellipsis.curlybraces",
                                  rowContent: "Adwait Barkale",
                                  rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Designer",
                                  rowIcon: "paintpalette",
                                  rowContent: "Robert Petras",
                                  rowTintColor: .pink)
                
                CustomListRowView(rowLabel: "Website",
                                  rowIcon: "globe",
                                  rowContent: nil,
                                  rowTintColor: .indigo,
                                  rowLinkLabel: "Credo Academy",
                                  rowLinkURL: "https://credo.academy")
            } // SECTION ABOUT END
            
        } // LIST END
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
