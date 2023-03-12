//
//  OrderView.swift
//  SwiftUIDemo
//
//  Created by Birju Bhatt on 06/03/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order:Order
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItems(at:))
                }
                
                Section {
                    NavigationLink("Place Order") {
                        CheckoutView()
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .toolbar {
                EditButton()
            }
        }
    }
    func deleteItems(at offSets: IndexSet) {
        order.items.remove(atOffsets: offSets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView().environmentObject(Order())
    }
}
