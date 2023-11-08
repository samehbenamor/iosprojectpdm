//
//  VideoDetailView.swift
//  lesson
//
//  Created by Mac-Mini-2021 on 7/11/2023.
//

import SwiftUI
import _AVKit_SwiftUI
import AVKit

struct VideoDetailView: View {
    let videoURL: URL
    @State private var isFavorite = false

    var body: some View {
            ZStack() {
                ZStack() {
                    VStack {
                        VideoPlayer(player: AVPlayer(url: videoURL))
                            .frame(height: 350)
                            .cornerRadius(30)
                            .shadow(radius: 5)
                            .padding(.bottom, 300)
                    ZStack() {
                        Text("About this course")
                            .font(Font.custom("Poppins", size: 20).weight(.bold))
                            .foregroundColor(Color(red: 0.36, green: 0.70, blue: 0.36))
                            .offset(x: -101.05, y: -57.51)
                            .padding(.bottom, 350)

                        Text("how to donate")
                            .font(Font.custom("Poppins", size: 35).weight(.bold))
                            .foregroundColor(Color(red: 0.36, green: 0.70, blue: 0.36))
                            .offset(x: -77.68, y: -200.51)
                            .padding(.bottom,0)
                        
                        Text("Sed ut perspiciatis unde omnis iste natus error sit \nvoluptatem accusantium doloremque laudantium , uahudhdnd jhjfiudfibn  urhfhz , ziuuhrouzqshofazhfhnkfkqhnosfsqonf, ozjqfjzo ojfoiejefoi  ihrojoifqzo ojrfipf qpjfp p the ef k pejr pjesdn ")
                            .font(Font.custom("Poppins", size: 12))
                            .foregroundColor(Color(red: 0.58, green: 0.58, blue: 0.64))
                            .offset(x: 0.10, y: -100)
                            .padding(.top, 20)
                        
                        Button(action: {
                                                isFavorite.toggle()
                                            }) {
                                                Image(systemName: isFavorite ? "heart.fill" : "heart")
                                                    .resizable()
                                                    .frame(width: 40, height: 40) // Adjust the size
                                                    .foregroundColor(.red)
                                            }
                                            .frame(maxWidth: .infinity)
                                            .padding(.top, 20)
                    }
                    .frame(width: 366.83, height: 141.16)
                    .offset(x: -6.87, y: -133.55)
                    Text("")
                        .font(Font.custom("Poppins", size: 35).weight(.bold))
                        .foregroundColor(Color(red: 0.36, green: 0.70, blue: 0.36))
                        .offset(x: -77.68, y: -261.86)
                        .padding(.bottom,300)

                    ZStack() { }
                    .frame(width: 101.10, height: 54.46)
                    .offset(x: 2.12, y: 220.23)
                    .cornerRadius(30)

                }
                .frame(width: 426, height: 583.81)
                .offset(x: 2, y: 174.09)
                    
            }
            .frame(width: 430, height: 932)
            .background(.white)
            .cornerRadius(30)

    
        }
    }
}

extension Color {
    init(hex: UInt) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0
        )
    }
}
struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a sample video URL for preview
        let sampleVideoURL = URL(string: "your_sample_video_url_here")!
        return VideoDetailView(videoURL: sampleVideoURL)
    }
}


