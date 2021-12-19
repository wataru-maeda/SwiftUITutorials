//
//  ProfileHost.swift
//  LandmarksApp
//
//  Created by Wataru Maeda on 2021/12/18.
//

import SwiftUI

struct ProfileHost: View {
  @Environment(\.editMode) var editMode
  @EnvironmentObject var modelData: ModelData
  @State private var draftProfile = Profile.default
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      HStack {
        Spacer()
        EditButton()
      }
      
      if editMode?.wrappedValue == .active {
        Button("Cancel", role: .cancel) {
          draftProfile = modelData.profile
          editMode?.animation().wrappedValue = .inactive
        }
      }
      
      if editMode?.wrappedValue == .inactive {
        ProfileSummary(profile: modelData.profile)
      } else {
        ProfileEditor(profile: $draftProfile)
          .onAppear {
            draftProfile = modelData.profile
          }
          .onDisappear {
            modelData.profile = draftProfile
          }
      }
      
    }
    .padding()
  }
}

struct ProfileHost_Previews: PreviewProvider {
  static var previews: some View {
    ProfileHost()
      .environmentObject(ModelData())
  }
}
