//
//  TrackingView.swift
//  projectpmd
//
//  Created by Mac2021 on 8/11/2023.
//

import SwiftUI

struct TrackingView: View {
    var body: some View {
       
        ZStack() {
            Group {
                Text("Ranking")
                    .font(Font.custom("Bahnschrift", size: 24))
                    .foregroundColor(.white)
                    .offset(x: -118, y: -391)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 70, height: 81)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(15)
                    .offset(x: -112.50, y: -106.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 66, height: 61)
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .cornerRadius(15)
                    .offset(x: 110.50, y: -93.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 91, height: 129)
                    .background(Color(red: 0.93, green: 0.08, blue: 0.08))
                    .cornerRadius(15)
                    .offset(x: 0, y: -127.50)
                Text("1")
                    .font(Font.custom("Bahnschrift", size: 64))
                    .foregroundColor(Color(red: 1, green: 0.98, blue: 0.98))
                    .offset(x: -0.50, y: -134.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 393, height: 506)
                    .background(Color(red: 1, green: 0.97, blue: 0.97))
                    .offset(x: 0, y: 173)
                Text("3000 pts")
                    .font(Font.custom("Bahnschrift", size: 16))
                    .foregroundColor(.black)
                    .offset(x: 153, y: -46.50)
                Text("5")
                    .font(Font.custom("Bahnschrift", size: 20))
                    .foregroundColor(.black)
                    .offset(x: -169, y: 7)
                Text("4")
                    .font(Font.custom("Bahnschrift", size: 20))
                    .foregroundColor(.black)
                    .offset(x: -170.50, y: -49)
            }
            
            Group
            {
                Text("2")
                    .font(Font.custom("Bahnschrift", size: 40))
                    .foregroundColor(Color(red: 1, green: 0.98, blue: 0.98))
                    .offset(x: -110, y: -116)
                Text("3")
                    .font(Font.custom("Bahnschrift", size: 36))
                    .foregroundColor(Color(red: 1, green: 0.98, blue: 0.98))
                    .offset(x: 112.50, y: -102.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 347, height: 0)
                    .overlay(Rectangle()
                    .stroke(.black, lineWidth: 0.50))
                    .offset(x: 10, y: -22)
                Text("Adem")
                    .font(Font.custom("Bahnschrift", size: 25))
                    .foregroundColor(.white)
                    .offset(x: -110, y: -186)
                Text("2000 pts")
                    .font(Font.custom("Bahnschrift", size: 14))
                    .foregroundColor(.white)
                    .offset(x: -105, y: -164.50)
                Text("Zied")
                    .font(Font.custom("Bahnschrift", size: 25))
                    .foregroundColor(.white)
                    .offset(x: -1, y: -230)
                Text("6000 pts")
                    .font(Font.custom("Bahnschrift", size: 14))
                    .foregroundColor(.white)
                    .offset(x: 7, y: -206.50)
                Text("Mahdi")
                    .font(Font.custom("Bahnschrift", size: 25))
                    .foregroundColor(.white)
                    .offset(x: 117, y: -166)
                Text("3500 pts")
                    .font(Font.custom("Bahnschrift", size: 14))
                    .foregroundColor(.white)
                    .offset(x: 114, y: -138.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 347, height: 0)
                    .overlay(Rectangle()
                    .stroke(.black, lineWidth: 0.50))
                    .offset(x: 10, y: 36)
            }
            Group {
                Text("7")
                    .font(Font.custom("Bahnschrift", size: 20))
                    .foregroundColor(.black)
                    .offset(x: -163, y: 118)
                Text("6")
                    .font(Font.custom("Bahnschrift", size: 20))
                    .foregroundColor(.black)
                    .offset(x: -168, y: 62)
                Text("Ahmed")
                    .font(Font.custom("Bahnschrift", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -95, y: -47.50)
                Text("Salma")
                    .font(Font.custom("Bahnschrift", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -97.50, y: 5.50)
                Text("Nour")
                    .font(Font.custom("Bahnschrift", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -102.50, y: 58.50)
                Text("Nesrine")
                    .font(Font.custom("Bahnschrift", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -92, y: 117.50)
                Text("3000 pts")
                    .font(Font.custom("Bahnschrift", size: 16))
                    .foregroundColor(.black)
                    .offset(x: 224, y: -291.50)
                Text("2500 pts")
                    .font(Font.custom("Bahnschrift", size: 16))
                    .foregroundColor(.black)
                    .offset(x: 153, y: 0.50)
                Text("2000 pts")
                    .font(Font.custom("Bahnschrift", size: 16))
                    .foregroundColor(.black)
                    .offset(x: 153, y: 58.50)
            }
            Group {
                Text("1000 pts")
                    .font(Font.custom("Bahnschrift", size: 16))
                    .foregroundColor(.black)
                    .offset(x: 151.50, y: 120.50)
                Text("Your score is :2000")
                    .font(Font.custom("Bahnschrift", size: 20))
                    .foregroundColor(.white)
                    .offset(x: 101, y: -303)
                
                Button(action: {}) {
                    NavigationLink(destination: Rewards()) {
                        Rectangle()
                            .frame(width: 187, height: 50)
                            .foregroundColor(Color.clear)
                            .background(Color(red: 0.32, green: 0.78, blue: 0.37))
                            .cornerRadius(11)
                            .overlay(
                                Text("CONVERT YOUR POINTS")
                                    .font(Font.custom("Bahnschrift", size: 14))
                                    .foregroundColor(.white)
                            )
                    }
                }
            
                    .offset(x: 9, y: 298)
                    
                
            }
        }
        .frame(width: 393, height: 852)
        .background(Color(red: 0.32, green: 0.78, blue: 0.37))    }
}

struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingView()
    }
}
