//
//  LoadingOverlayView.swift
//  Cash App Stocks
//
//  Created by HECTOR TERRERO on 4/26/23.
//

import SwiftUI

struct LoadingOverlayView: View {
    @Binding var isLoading: Bool
    
    var body: some View {
        ZStack {
            if isLoading {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black.opacity(0.3))
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 8) {
                    ProgressView()
                    Text("Loading...")
                        .foregroundColor(.white)
                        .bold()
                }
            }
        }
    }
}

struct LoadingOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingOverlayView(isLoading: .constant(true))
    }
}
