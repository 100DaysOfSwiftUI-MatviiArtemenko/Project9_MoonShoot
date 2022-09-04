//
//  AstronautView.swift
//  Project7_Moonshot
//
//  Created by admin on 17.08.2022.
//

import Foundation
import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
                
                
            }
            .navigationTitle(astronaut.name)
            .navigationBarTitleDisplayMode(.inline )
        }
    }
}
