//
//  AULoginView.swift
//  FirstCIDemo
//
//  Created by Anand Upadhyay on 06/12/22.
//

import SwiftUI

struct AULoginView_Previews: PreviewProvider {
    static var previews: some View {
        AULoginView()
    }
}

struct AULoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var user: User
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Client id", text: $user.client)
                    SecureField("Token", text: $user.token)
                }
                Button {
                    if user.connect(){
                        presentationMode.wrappedValue.dismiss()
                    }else{
                        showAlert = true
                    }
                } label: {
                    Text(User.Connect)
                }
                .accessibilityIdentifier("AUConnectNow")
            }
            .navigationTitle(Text("Secret Portal"))
            .navigationBarItems(trailing: Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark.circle")
                    .accessibilityLabel("AUClose")
            })
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Connection Failed"),
                  message: Text("Client Id or Token missmach!"),
                  dismissButton: Alert.Button.default(Text("OK"), action: {
                showAlert = false
            }))
        }
    }
}
