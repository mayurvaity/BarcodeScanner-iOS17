//
//  ContentView.swift
//  BarcodeScanner-iOS17
//
//  Created by Mayur Vaity on 09/06/24.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    //creating a var to store barcode
    @State private var scannedCode = ""
    @State private var isShowingAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                //.infinity in .frame maxwidth to fill the screen
                //maxHeight - will limit height for different devices
                ScannerView(scannedCode: $scannedCode)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                //to add space between below stuff and rectangle of height 60
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                //if scannedcode is blank "" then to display not yet scanned else displaying barcode that we got
                Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(Color(scannedCode.isEmpty ? .red : .green))
                    .padding()
                
                Button {
                    isShowingAlert = true
                } label: {
                    Text("Tap Me")
                }
            }
            .navigationTitle("Barcode Scanner")
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text("Test"),
                      message: Text("This is a test."),
                      dismissButton: .default(Text("Ok")))
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
