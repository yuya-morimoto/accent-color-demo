//
//  ContentView.swift
//  accent-color-demo
//
//  Created by Yuya Morimoto on R 5/05/01.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowAlert = false
    @State private var isShowActionSheet = false
    @State private var isConfirmationDialog = false

    var body: some View {
        VStack {
            // MARK: - Alert

            Button("Alert") {
                isShowAlert = true
            }
            .alert(isPresented: $isShowAlert) {
                Alert(
                    title: Text("Current Location Not Available"),
                    message: Text("Your current location can’t be " +
                        "determined at this time.")
                )
            }.padding()

            // MARK: - Action Sheet

            Button("ActionSheet") {
                isShowActionSheet = true
            }
            .actionSheet(isPresented: $isShowActionSheet) {
                ActionSheet(title: Text("Resume Workout Recording"),
                            message: Text("Choose a destination for workout data"),
                            buttons: [
                                .cancel(),
                                .default(
                                    Text("Append to Current Workout"),
                                    action: {}
                                ),
                                .destructive(
                                    Text("Overwrite Current Workout"),
                                    action: {}
                                )
                            ])
            }.padding()

            // MARK: - Confirmation Dialog

            Button("Import File") {
                isConfirmationDialog = true
            }
            .confirmationDialog(
                "Are you sure you want to import this file?",
                isPresented: $isConfirmationDialog
            ) {
                Button {
                    // Handle import action.
                } label: {
                    Text("""
                    Confirmation Dialog Sample!
                    """)
                }
                Button("Cancel", role: .cancel) {}
            }.padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
