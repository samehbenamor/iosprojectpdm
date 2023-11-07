//
//  ContentView.swift
//  projectpmd
//
//  Created by Sameh ben amor on 6/11/2023.
//

import SwiftUI
import CoreData
struct UserProfileView: View {
    var body: some View {
        ZStack() {
            Group {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 430, height: 932)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(red: 0.36, green: 0.70, blue: 0.36), Color(red: 0.90, green: 0.48, blue: 0.16)]), startPoint: .top, endPoint: .bottom)
                    )
                    .offset(x: 0, y: 0)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 430, height: 750)
                    .background(Color(red: 0.25, green: 0.24, blue: 0.26))
                    .cornerRadius(55)
                    .offset(x: 0, y: 91)
                Ellipse()
                    .foregroundColor(.clear)
                    .frame(width: 175, height: 175)
                    .overlay(
                        Ellipse()
                            .inset(by: 3.50)
                            .stroke(Color(red: 0.25, green: 0.24, blue: 0.26), lineWidth: 3.50)
                    )
                    .offset(x: 0.50, y: -284.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 162, height: 164)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/162x164"))
                    )
                    .cornerRadius(223.50)
                    .offset(x: 0, y: -284)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 102, height: 28.84)
                        .background(Color(red: 0.06, green: 0.56, blue: 0.08))
                        .cornerRadius(41)
                        .offset(x: 0, y: 0)
                    Text("Nabeul")
                        .font(Font.custom("Nimbus Sans L", size: 18).weight(.bold))
                        .foregroundColor(Color(red: 0.36, green: 0.70, blue: 0.36))
                        .offset(x: -0.18, y: 2.11)
                }
                .frame(width: 102, height: 28.84)
                .offset(x: 0, y: -165.58)
                ZStack() {
                    Text("Croissant Rouge")
                        .font(Font.custom("Nimbus Sans L", size: 32).weight(.bold))
                        .foregroundColor(.white)
                        .offset(x: 2.92, y: -57.93)
                    Text("Organisateur")
                        .font(Font.custom("Nimbus Sans L", size: 24))
                        .foregroundColor(Color(red: 0.90, green: 0.21, blue: 0.16))
                        .offset(x: 4.56, y: -9.07)
                    Button(action: {
                        // Add the action you want the button to perform here
                    }) {
                        Image("Vector-6")
                                .resizable()
                                .frame(width: 28, height: 26)
                    }
                        .foregroundColor(.clear)
                        .frame(width: 55.79, height: 55.79)
                        .background(.black)
                        .cornerRadius(30)
                        .offset(x: -148.40, y: 47.08)
                    Button(action: {
                        // Add the action you want the button to perform here
                    }) {
                        Image("Vector")
                                .resizable()
                                .frame(width: 40, height: 30)
                    }
                        .foregroundColor(.clear)
                        .frame(width: 55.79, height: 55.79)
                        .background(.black)
                        .cornerRadius(30)
                        .offset(x: -0.40, y: 51)
                    
                    Button(action: {
                        // Add the action you want the button to perform here
                    }) {
                        Image("Vector-2")
                                .resizable()
                                .frame(width: 34, height: 8)
                    }
                        .foregroundColor(.clear)
                        .frame(width: 55.79, height: 55.79)
                        .background(.black)
                        .cornerRadius(30)
                        .offset(x: 148.40, y: 47.08)
                    
                }
                .frame(width: 352.59, height: 157.79)
                .offset(x: 0.30, y: -40.11)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 138.43, height: 49.41)
                        .background(.black)
                        .cornerRadius(53)
                        .overlay(
                            RoundedRectangle(cornerRadius: 53)
                                .inset(by: -1.50)
                                .stroke(.white, lineWidth: 1.50)
                        )
                        .offset(x: 0, y: 0)
                    Image("Vector-3")
                                    .resizable()
                                    .frame(width: 28, height: 26)
                                    .offset(x: -40, y: 1.09)
                    Text("Vérifié")
                        .font(Font.custom("Nimbus Sans L", size: 24).weight(.bold))
                        .foregroundColor(.white)
                        .offset(x: 12.35, y: 1.09)
                }
                .frame(width: 138.43, height: 49.41)
                .offset(x: -106.78, y: 95.71)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 116.63, height: 49.41)
                        .background(.black)
                        .cornerRadius(53)
                        .overlay(
                            RoundedRectangle(cornerRadius: 53)
                                .inset(by: -1.50)
                                .stroke(.white, lineWidth: 1.50)
                        )
                        .offset(x: 0, y: 0)
                    Text("Admin")
                        .font(Font.custom("Nimbus Sans L", size: 24).weight(.bold))
                        .foregroundColor(.white)
                        .offset(x: 14.17, y: 0.5)
                }
                .frame(width: 116.63, height: 49.41)
                .offset(x: -117.68, y: 157.84)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 50.50, height: 49.41)
                        .background(.black)
                        .cornerRadius(53)
                        .overlay(
                            RoundedRectangle(cornerRadius: 53)
                                .inset(by: -1.50)
                                .stroke(.white, lineWidth: 1.50)
                        )
                        .offset(x: 0, y: 0)
                    Image("Vector-4")
                                    .resizable()
                                    .frame(width: 19.62, height: 25)
                                    .offset(x: -125, y: -1)
                    Text("+5")
                        .font(Font.custom("Nimbus Sans L", size: 24).weight(.bold))
                        .foregroundColor(.white)
                        .offset(x: -1.45, y: -0)
                }
                .frame(width: 50.50, height: 49.41)
                .offset(x: -26.12, y: 159.29)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 204.56, height: 49.41)
                        .background(.black)
                        .cornerRadius(53)
                        .overlay(
                            RoundedRectangle(cornerRadius: 53)
                                .inset(by: -1.50)
                                .stroke(.white, lineWidth: 1.50)
                        )
                        .offset(x: 0, y: 0)
                    Image("Vector-5")
                                    .resizable()
                                    .frame(width: 28, height: 26)
                                    .offset(x: -75, y: 1.09)
                    Text("Top contributeur")
                        .font(Font.custom("Nimbus Sans L", size: 20).weight(.bold))
                        .foregroundColor(.white)
                        .offset(x: 18.35, y: -0)
                }
                .frame(width: 204.56, height: 49.41)
                .offset(x: 73.07, y: 96.80)
            }
            
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 353, height: 200)
                        .background(.black)
                        .cornerRadius(34)
                        .overlay(
                            RoundedRectangle(cornerRadius: 34)
                                .inset(by: -1.50)
                                .stroke(.white, lineWidth: 1.50)
                        )
                        .offset(x: 0, y: 0)
                    Text("Nous sommes Croissant rouge et nous acceptons volontiers vos dons.")
                        .font(Font.custom("Nimbus Sans L", size: 18).weight(.bold))
                        .foregroundColor(.white)
                        .offset(x: 0.38, y: -11.13)
                    Image("Vector-7")
                                    .resizable()
                                    .frame(width: 27, height: 27)
                                    .offset(x: -75, y: 70)
                    Image("Vector-8")
                                    .resizable()
                                    .frame(width: 27, height: 27)
                                    .offset(x: 0, y: 70)
                    Image("Vector-9")
                                    .resizable()
                                    .frame(width: 27, height: 27)
                                    .offset(x: 75, y: 70)
                }
                .frame(width: 353, height: 213.33)
                .offset(x: 0.50, y: 322.67)
            
        }
        .frame(width: 430, height: 932)
        .background(.white)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
