//
//  Extras.swift
//  FirstCIDemo
//
//  Created by Anand Upadhyay on 06/12/22.
//

import Foundation

@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}


struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}


struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}


class TestWrapperValues{
    
    var unitRectangle = UnitRectangle()
    var zeroRectangle = ZeroRectangle()
    var narrowRectangle = NarrowRectangle()
    
    func printValue(){
        print(unitRectangle.height, unitRectangle.width)

        print(zeroRectangle.height, zeroRectangle.width)
        
        print(narrowRectangle.height, narrowRectangle.width)

        narrowRectangle.height = 100
        narrowRectangle.width = 100
        print(narrowRectangle.height, narrowRectangle.width)
    }
}

let AllowedClient = "anand"
let AllowedUserToken = "anand"
/*
 Adding Launch Screen in SwiftUI
 https://holyswift.app/animated-launch-screen-in-swiftui/
 https://www.appcoda.com/launch-screen-swiftui/
 
 //to present any view moddally
 .fullScreenCover(isPresented: $showLogin, content: AULoginView.init)
 
 //To modally dismiss
     VStack {
         Text("Back")
     }
     .frame(maxWidth: .infinity, maxHeight: .infinity)
     .background(Color.red)
     .edgesIgnoringSafeArea(.all)
     .onTapGesture {
         presentationMode.wrappedValue.dismiss()
     }
  //First Commit
 Added SwfitUI and UITest (#1)
 - Added UI to change images on tap of a button
 - Added UI to Create a Login Page
 - Added Detailed Test Cases
 */
