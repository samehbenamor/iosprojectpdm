//
//  Rewards.swift
//  projectpmd
//
//  Created by Mac2021 on 8/11/2023.
//

import SwiftUI

struct Rewards: View {
    var body: some View {
        NavigationView { // Wrap the entire view in a NavigationView
            ZStack {
                Group {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 393, height: 95)
                        .background(Color(red: 0.13, green: 0.78, blue: 0.12))
                        .cornerRadius(9)
                        .offset(x: 0, y: -350)
                    Text("Rewards")
                        .font(Font.custom("Bahnschrift", size: 32))
                        .foregroundColor(Color(red: 1, green: 0.96, blue: 0.96))
                        .offset(x: -0.50, y: -350)
                    
                    // Wrap each rectangle in a NavigationLink to enable navigation
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 270, height: 94)
                        .background(Color(red: 0.13, green: 0.78, blue: 0.12))
                        .cornerRadius(9)
                        .offset(x: -0.50, y: -100)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 270, height: 94)
                        .background(Color(red: 0.13, green: 0.78, blue: 0.12))
                        .cornerRadius(9)
                        .offset(x: -0.50, y: 90)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 270, height: 94)
                        .background(Color(red: 0.13, green: 0.78, blue: 0.12))
                        .cornerRadius(9)
                        .offset(x: -0.50, y: 280)
                    NavigationLink(destination: RewardsDetailView()) {
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 89, height: 94)
                            .background(
                                Image("unnamed-3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            )                    }
                    
                    .cornerRadius(8)
                    .offset(x: -73, y: -100)
                    
                    Text("Orange")
                        .font(Font.custom("Bahnschrift", size: 32))
                        .foregroundColor(.white)
                        .offset(x: 43.50, y: -100)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 89, height: 93.94)
                        .background(
                            Image("unnamed")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        )
                        .cornerRadius(8)
                        .offset(x: -73, y: 90)
                    
                    
                    Text("Ooredoo")
                        .font(Font.custom("Bahnschrift", size: 32))
                        .foregroundColor(Color(red: 0.99, green: 0.99, blue: 0.99))
                        .offset(x: 43, y: 90)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 86.25, height: 94)
                        .background(
                            Image("tele")
                        )
                        .cornerRadius(8)
                        .offset(x: -74.38, y: 280)
                }
                
                Group {
                    Text("Telecom")
                        .font(Font.custom("Bahnschrift", size: 32))
                        .foregroundColor(Color(red: 1, green: 1, blue: 1))
                        .offset(x: 37, y: 280)
                }
            }
            .frame(width: 393, height: 852)
            .background(.white)
        }
    }
}

struct Rewards_Previews: PreviewProvider {
    static var previews: some View {
        Rewards()
    }
}
