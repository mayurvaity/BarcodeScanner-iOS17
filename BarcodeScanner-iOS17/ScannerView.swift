//
//  ScannerView.swift
//  BarcodeScanner-iOS17
//
//  Created by Mayur Vaity on 09/06/24.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    //to communicate value of scanned code from here to main view
    @Binding var scannedCode: String
    
    //a swiftuI view conforming to UIViewControllerRepresentable can return a VC instead of standard swiftui view (using body),
    //for this we need to specify type of VC it is going to return, below typealias is for that,
    //this is then used to create automatic stubs below
    typealias UIViewControllerType = ScannerVC
    
    //Context mentioned below is basically a typealias for UIViewControllerRepresentable<self> in this case UIViewControllerRepresentable<ScannerView>
    func makeUIViewController(context: Context) -> ScannerVC {
        //setting delegate of ScannerVC = coordinator of this
        //this coordinator is created below
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    //this delegate method is needed when we r creating coordinator in our struct
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        //this class cannot directly access vars from this struct (view)
        //so need to get it through the obj creation
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            print(barcode)
            scannerView.scannedCode = barcode
        }
        
        func didSurface(error: CameraError) {
            //getting string value from enum, if any error surfaces
            print(error.rawValue)
        }
        
        
    }
    
}

#Preview {
    ScannerView(scannedCode: .constant("1234567890123"))
}
