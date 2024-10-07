//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Software Engineer on 10/5/24.
//

import SwiftUI

//Structs are value types
struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
            ZStack{
                BackgroundView(isNight: isNight)
                VStack{
                    CityTextView(cityName: "Cupertino, CA")
                    
                    MainWeatherStatusView(imageName: isNight ?"moon.stars.fill" :  "cloud.sun.fill",
                                          temperature: 76)
                    
                    HStack(spacing: 20) {
                        WeatherDayView(dayOfWeek: "TUE",
                                       imageName: "cloud.sun.fill",
                                       temperature: 74)
                        
                        WeatherDayView(dayOfWeek: "WED",
                                       imageName: "sun.max.fill",
                                       temperature: 74)
                        
                        WeatherDayView(dayOfWeek: "THURS",
                                       imageName: "wind.snow",
                                       temperature: 74)
                        
                        WeatherDayView(dayOfWeek: "FRI",
                                       imageName: "sunset.fill",
                                       temperature: 74)
                        
                        WeatherDayView(dayOfWeek: "SAT",
                                       imageName: "snow",
                                       temperature: 74)
                    }
                    
                    Spacer()
                    
                    Button {
                        isNight.toggle()
                    } label: {
                        WeatherButton(title: "Change Day Time", 
                                      textColor: .blue,
                                      backgroundColor: .white)
                    }
                    
                    Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        
        Text(cityName)
            .font(.system(size: 32, 
                          weight: .medium,
                          design: .default))
            .foregroundColor(.white)
            .padding()
        
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        
        VStack (spacing: 10) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        
        .padding(.bottom, 40)
    }
}


