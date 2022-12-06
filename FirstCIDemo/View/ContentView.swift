//
//  ContentView.swift
//  FirstCIDemo
//
//  Created by Anand Upadhyay on 05/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var imageName = "Zoo"
    @State private var showLogin = false
    @EnvironmentObject private var user: User
    
    var body: some View {
        VStack(spacing:10){
            topHstack()
            Spacer()
            middleHstack()
            Image(imageName).resizable().aspectRatio( contentMode: .fit)
            bottomHstack()
            Spacer()
        }
    }
    
    func topHstack() -> some View {
        return HStack{
            Text(!user.isConnected ? user.client : "Welcom").frame(maxWidth: .infinity, alignment:.leading)
            Button(action: {
                self.showLogin.toggle()
                if !user.isConnected {
                    showLogin = true
                } else {
                    user.disconnect()
                }
            }, label: {
                Text(!user.isConnected ? User.Connect : User.Disconnect)
            }).sheet(isPresented: $showLogin){
                AULoginView()
            }.padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .accessibilityIdentifier("AuConnectButton")
        }
    }
    
    func middleHstack() -> some View{
        return HStack (alignment: .center, spacing :10){
            Spacer()
            Text("Anand").padding().background(Color.blue.opacity(0.5)).foregroundColor(Color.black).accessibilityIdentifier("AUMyName")
            Text("Upadhyay").padding().background(Color.blue.opacity(0.5)).foregroundColor(Color.black)
            Spacer()
        }
    }
    
    func bottomHstack() -> some View{
        return HStack(alignment: .center, spacing :10){
            Spacer()
            Text(imageName).padding().foregroundColor(Color(UIColor.systemBlue))
            Button("Next"){
                self.imageName = AnimalList.shared.getNextAnimal()
            }.buttonStyle(AUButtonStle())
                .accessibilityIdentifier("AUNextButton")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
