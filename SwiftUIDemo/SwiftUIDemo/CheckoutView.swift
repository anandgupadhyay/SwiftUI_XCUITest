//
//  CheckoutView.swift
//  SwiftUIDemo
//
//  Created by Birju Bhatt on 06/03/23.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    let tipAmounts = [0,5,10,15,20]
    @State private var tipAmount = 10
    
    let paymentTypes = ["Cash","Credit Card","App Points"]
    @State private var paymentType = "Cash"
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    
    @State private var showingPaymentAlert = false
    var totalPrice:String {
        let total = Double(order.total)
        let tipValue = (total / 100) * (Double(tipAmount))
        return "\((total + tipValue))"
    }
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes,id:\.self) {
                        Text($0)
                    }
                }
                Toggle("Add app loyalty card",isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your app ID",text: $loyaltyNumber)
                }
                
            }
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:",selection: $tipAmount) {
                    ForEach(tipAmounts,id:\.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            Section(header:Text("Total: $\(totalPrice)")) {
                Button("Confirm Oder") {
                    showingPaymentAlert = true
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(
                title: Text("Order confirmed"),
                message: Text("Your total was $\(totalPrice) - thank you!"),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(Order())
    }
}
