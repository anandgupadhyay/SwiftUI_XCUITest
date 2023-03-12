//
//  ItemDetail.swift
//  SwiftUIDemo
//
//  Created by Birju Bhatt on 06/03/23.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order:Order
    let item:MenuItem
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            Text(item.description)
                .padding()
            Button("Order This") {
                order.add(item: item)
            }
            .buttonStyle(OrderButton())
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(Order())
        }
    }
}

struct OrderButton:ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(Color.black)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .font(.headline)
    }
}
