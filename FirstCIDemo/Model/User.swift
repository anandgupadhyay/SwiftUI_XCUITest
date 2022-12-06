//
//  User.swift
//  FirstCIDemo
//
//  Created by Anand Upadhyay on 06/12/22.
//

import Foundation
import Combine

class User: ObservableObject {
    static var Connect  = "Connect"
    static var Disconnect = "DisConnect"

    @Published var isConnected = false
    @Published var client = ""
    @Published var token = ""
    
    func connect() -> Bool {
        guard client == AllowedClient && token == AllowedUserToken else {
            return false
        }

        token = ""
        isConnected = true
        return true
    }
    func disconnect(){
        token = ""
        client = ""
        isConnected = true
    }
}

