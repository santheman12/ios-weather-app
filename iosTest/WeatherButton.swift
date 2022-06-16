//
//  WeatherButton.swift
//  iosTest
//
//  Created by Sankalp Varshney on 6/15/22.
//

import SwiftUI

struct WeatherButton: View{
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design:.default))
            .cornerRadius(15)
    }
}
