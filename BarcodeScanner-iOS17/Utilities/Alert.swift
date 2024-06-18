//
//  Alert.swift
//  BarcodeScanner-iOS17
//
//  Created by Mayur Vaity on 10/06/24.
//

import SwiftUI

//data type of alert created
struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

//to store different types of alert data 
struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: Text("Invalid Device Input"),
                                              message: Text("Something is wrong with the camera. We are unable to capture the input."),
                                              dismissButton: .default(Text("OK")))
    
    static let invalidScannedType = AlertItem(title: Text("Invalid Scan Type"),
                                              message: Text("The value scanned is not valid. This app scans EAN-8 and EAN-13."),
                                              dismissButton: .default(Text("OK")))
}

