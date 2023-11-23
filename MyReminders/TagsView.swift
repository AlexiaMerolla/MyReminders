//
//  TagsView.swift
//  MyReminders
//
//  Created by Alexia Merolla on 22/11/23.
//

import SwiftUI

struct TagsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                // Header
                HStack {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.blue)
                    Spacer()
                    Text("Tags")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Spacer()
                    Button("Done") {
                        // Perform action upon "Done" button tap
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.blue)
                }
                .padding()
                Divider()
                
                // Content of the view
                
                TextField("Add Tags", text: .constant(""))
                    .padding()
                Spacer()
            }
            .navigationTitle("") // Empty navigation title to remove default title
        }
    }
}


struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView()
    }
}

