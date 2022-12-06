//
//  LoginUITestCase.swift
//  FirstCIDemoUITests
//
//  Created by Anand Upadhyay on 06/12/22.
//

import XCTest

class LoginUITest: XCTestCase{
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false;
        app.activate()
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testConnectionButton() throws {
        let login = app.buttons["AuConnectButton"]
        XCTAssertEqual(login.label, "Connect")
    }
    
    func testConnectionFormAppearance() throws {
        app.buttons["AuConnectButton"].tap()
        let loginNavBarTitle = app.staticTexts["Connect"]
        XCTAssert(loginNavBarTitle.waitForExistence(timeout: 0.5))
    }
    
    func testConnectionAlert() throws{
            app.buttons["AuConnectButton"].tap()
            app.buttons["AUConnectNow"].tap()
            XCTAssert(app.alerts.element.waitForExistence(timeout: 0.5))
         
            app.alerts.element.buttons["OK"].tap()
            XCTAssertFalse(app.alerts.element.exists)
    }
    
    func testPortalClose() throws {
        app.buttons["AuConnectButton"].tap()
        let dismiss = app.buttons["AUClose"]
        dismiss.tap()
        XCTAssertFalse(dismiss.waitForExistence(timeout: 0.5))
    }
    
    func testClient() throws {
        app.buttons["AuConnectButton"].tap()
     
        let username = app.textFields["Client id"] //app.textFields.element if only single textfield
        username.tap()
        username.typeText("anand")
     
        XCTAssertNotEqual(username.value as! String, "")
    }
    
    func testToken() throws {
        app.buttons["AuConnectButton"].tap()
     
        app.secureTextFields.element.tap()
        app.keys["a"].tap()
        app.keys["n"].tap()
        app.keys["a"].tap()
        app.keys["n"].tap()
        app.keys["d"].tap()
        app.keyboards.buttons["Return"].tap()
     
        XCTAssertNotEqual(app.secureTextFields.element.value as! String, "")
    }
    
    func testFailedConnectionAlert() throws {
        app.buttons["AuConnectButton"].tap()
        app.buttons["AUConnectNow"].tap()
        XCTAssert(app.alerts.element.waitForExistence(timeout: 0.5))
        app.alerts.element.buttons["OK"].tap()
        XCTAssertFalse(app.alerts.element.exists)
    }
    
    func testPortalConnection() throws {
        app.buttons["AuConnectButton"].tap()
     
        app.textFields.element.tap()
        app.textFields.element.typeText("anand")
     
        app.secureTextFields.element.tap()
        app.secureTextFields.element.typeText("anand")
        app.keyboards.buttons["Return"].tap()
     
        let loginButton = app.buttons["AUConnectNow"]
        loginButton.tap()
     
        XCTAssertFalse(loginButton.waitForExistence(timeout: 0.5))
    }
    
    func testPortalDisconnection() throws {
        XCTAssertEqual(app.buttons["AuConnectButton"].label, "Connect")
        try testPortalConnection()
        XCTAssertEqual(app.buttons["AuConnectButton"].label, "Disconnect")
    }
}
