//
//  HomeView.swift
//  projectpmd
//
//  Created by Mac Mini on 13/11/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        DeliveryMapView()
            .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
