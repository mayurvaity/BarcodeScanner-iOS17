//
//  ContentView.swift
//  BarcodeScanner-iOS17
//
//  Created by Mayur Vaity on 09/06/24.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    //creating an obj of viewmodel
    //variables are stored on viewmodel
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //.infinity in .frame maxwidth to fill the screen
                //maxHeight - will limit height for different devices
                ScannerView(scannedCode: $viewModel.scannedCode, 
                            alertItem: $viewModel.alertItem)
                    .frame(maxHeight: 300)
                
                //to add space between below stuff and rectangle of height 60
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                //if scannedcode is blank "" then to display not yet scanned else displaying barcode that we got
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(Color(viewModel.statusTextColor))
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
