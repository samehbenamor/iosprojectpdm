//
//  RewardsDetailView.swift
//  projectpmd
//
//  Created by Mac2021 on 8/11/2023.
//

import SwiftUI

import SwiftUI

struct RewardsDetailView: View {
    
    @State private var phoneNumber = ""
    @State private var mantant = ""
    @State private var rewardType = "Gold"
      @State private var showingAlert = false
    var body: some View {
        Form {
            Section(header: Text("Reward Details")) {
                TextField("Phone Number", text: $phoneNumber)
                    .background(Color.white)
                      .foregroundColor(.black)
                TextField("Name", text: $mantant)
                    .background(Color.white)
                      .foregroundColor(.black)
                Picker("Reward Type", selection: $rewardType) {
                    Text("1dt").tag("Gold")
                    Text("5dt").tag("Silver")
                    Text("10dt").tag("Bronze")
                }
                .pickerStyle(SegmentedPickerStyle())
                .background(Color.green)
                  .foregroundColor(.white)
            }
            Button(action: {
                 self.showingAlert = true
           })
            {
         Text("Tap Me")
           } .background(Color.green)
                .foregroundColor(.white)
           .alert(isPresented: $showingAlert) {
               Alert(title: Text("Important message"), message: Text("recharge avec succee"), dismissButton: .default(Text("Got it!")))
         }
            
        }
        .navigationBarTitle("Reward Details")
        
     
    }
}


struct RewardsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsDetailView()
    }
}
