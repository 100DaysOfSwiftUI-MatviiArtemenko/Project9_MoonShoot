//
//  MissionView.swift
//  Project7_Moonshot
//
//  Created by admin on 17.08.2022.
//

import Foundation
import SwiftUI

struct MissionView: View {
    struct CrewMemder {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMemder]
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.6)
                        .padding(.top)
                    
                    Text(mission.displayDate)
                        .foregroundColor(.secondary)
                        .font(.headline)
                    
                    VStack(alignment: .leading) {
                        Text("Mission description")
                            .font(.title.bold())
                            .padding()
                        
                        Text(mission.description)
                    }
                    .padding(10)
                    .background(.darkBackground)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Mission crew")
                            .font(.title.bold())
                            .padding()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(crew, id: \.role) { crewMember in
                                    NavigationLink {
                                        AstronautView(astronaut: crewMember.astronaut)
                                        
                                    } label: {
                                        HStack {
                                            Image(crewMember.astronaut.id)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 104, height: 72)
                                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                                .overlay(RoundedRectangle(cornerRadius: 20).strokeBorder(.darkBackground, lineWidth: 2).blur(radius: 10))
                                        }
                                        .background(.lightBackground)
                                        VStack(alignment: .leading) {
                                            Text(crewMember.astronaut.name)
                                                .foregroundColor(.white)
                                                .font(.headline)
                                            
                                            Text(crewMember.role)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    .padding()
                                    
                                }
                            }
                            .background(.lightBackground)
                            .cornerRadius(20)
                            .padding(10)
                        }
                    }
                    .background(.darkBackground)
                    .cornerRadius(20)
                    .padding([.bottom,.horizontal])
                }
                .padding(.bottom)
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map({ member in
            if let astronaut = astronauts[member.name] {
                return CrewMemder(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        })
    }
}
