//
//  PropertyWrapperExample.swift
//  FirstCIDemo
//
//  Created by Anand Upadhyay on 02/03/23.
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
