//
//  ContentView.swift
//  iosTestApp
//
//  Created by Sankalp Varshney on 6/15/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack{
                
                CityTextView(cityName: "Cupertino")
                
                CurrentStatus(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                              temperature: isNight ? 65 : 76)
                
                HStack(spacing: 10){
                    WeatherDayView(dayOfWeek: "Mon",
                                   imageName: "cloud.sun.fill",
                                   temperature: 76)
                    WeatherDayView(dayOfWeek: "Tue",
                                   imageName: "smoke.fill",
                                   temperature: 60)
                    WeatherDayView(dayOfWeek: "Wed",
                                   imageName: "cloud.moon.bolt.fill",
                                   temperature: 65)
                    WeatherDayView(dayOfWeek: "Thu",
                                   imageName: "sun.max.fill",
                                   temperature: 83)
                    WeatherDayView(dayOfWeek: "Fri",
                                   imageName: "smoke.fill",
                                   temperature: 72)
                    WeatherDayView(dayOfWeek: "Sat",
                                   imageName: "wind",
                                   temperature: 61)
                    WeatherDayView(dayOfWeek: "Sun",
                                   imageName: "cloud.sun.fill",
                                   temperature: 70)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label:{
                    WeatherButton(title: "Night Mode", textColor: Color.gray, backgroundColor: Color.white)
                }
                
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing:8){
            
            Text(dayOfWeek)
                .font(.system(size:20, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View{
    
    var cityName: String
    
    var body: some View{
        Text("Cupertino, CA")
            .font(.system(size: 40, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CurrentStatus: View{
    
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack(spacing: -10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
                .padding()
        }
    }
}


