//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner-iOS17
//
//  Created by Mayur Vaity on 10/06/24.
//

import SwiftUI


final class BarcodeScannerViewModel: ObservableObject {
    
    //creating a var to store barcode
    @Published var scannedCode = "" 
    //var to store alert data 
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
    
}


