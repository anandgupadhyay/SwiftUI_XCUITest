//
//  AUButton.swift
//  FirstCIDemo
//
//  Created by Anand Upadhyay on 06/12/22.
//

import SwiftUI
class AnimalList {
    static var shared = AnimalList()
    private var animalList = ["Cat", "Cow", "Dog", "Elephant", "Goat", "Horse", "Lion", "Tiger"]
    private var pointer = -1;
    func getNextAnimal() -> String{
        let pntr =  pointer == animalList.count-1 ? 0  : pointer+1
        pointer = pntr
        print("Name:\(animalList[pointer]) and Pointer:\(pointer)")
        return animalList[pointer]
    }
}

struct AUButtonStle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


