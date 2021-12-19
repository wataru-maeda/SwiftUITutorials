//
//  ProfileSummary.swift
//  LandmarksApp
//
//  Created by Wataru Maeda on 2021/12/18.
//

import SwiftUI

struct ProfileSummary: View {
  @EnvironmentObject var modelData: ModelData
  var profile: Profile

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 10) {
        Text(profile.username)
          .bold()
          .font(.title)
        
        Text("Notification: \(profile.prefersNotifications ? "On" : "Off")")
        Text("Seasonal Photo: \(profile.seasonalPhoto.rawValue)")
        Text("Goal Date") + Text(profile.goalDate, style: .date)
        
        Divider()
        
        VStack(alignment: .leading) {
          Text("Completed Badge")
            .font(.headline)
          
          ScrollView(.horizontal) {
            HStack {
              HikeBadge(name: "First Hike")
              HikeBadge(name: "Earth Day")
                .hueRotation(Angle(degrees: 90))
              HikeBadge(name: "Tenth Hike")
                .grayscale(0.5)
                .hueRotation(Angle(degrees: 45))
            }
            .padding(.bottom)
          }
        }
        
        Divider()
        
        VStack(alignment: .leading) {
          Text("Recent Hikes")
            .font(.headline)
          
          HikeView(hike: modelData.hikes[0])
        }
      }
    }
  }
}

struct ProfileSummary_Previews: PreviewProvider {
  static var previews: some View {
    ProfileSummary(profile: Profile.default)
      .environmentObject(ModelData())
  }
}
