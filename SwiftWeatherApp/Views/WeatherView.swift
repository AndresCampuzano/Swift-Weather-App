//
//  WeatherView.swift
//  SwiftWeatherApp
//
//  Created by Andres C G on 5/16/24.
//

import SwiftUI

struct WeatherView: View {
    @Environment(\.colorScheme) var colorScheme
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day()))")
                        .fontWeight(.light)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            VStack {
                                let weatherIcon = weather.weather[0].icon
                                                                
                                
                                // Day icons
                                if weatherIcon == "01d" {
                                    Image(systemName: "sun.max")
                                       
                                }
                                else if (weatherIcon == "02d") {
                                    Image(systemName: "cloud.sun")
                                }
                                else if (weatherIcon == "03d") {
                                    Image(systemName: "cloud")
                                }
                                else if (weatherIcon == "04d") {
                                    Image(systemName: "cloud")
                                }
                                else if (weatherIcon == "09d") {
                                    Image(systemName: "cloud.rain")
                                }
                                else if (weatherIcon == "10d") {
                                    Image(systemName: "cloud.sun.rain")
                                }
                                else if (weatherIcon == "11d") {
                                    Image(systemName: "cloud.bolt")
                                }
                                else if (weatherIcon == "13d") {
                                    Image(systemName: "snowflake")
                                }
                                else if (weatherIcon == "50d") {
                                    Image(systemName: "cloud.fog")
                                }
                                
                                // Night icons
                                else if weatherIcon == "01n" {
                                    Image(systemName: "moon.stars")
                                       
                                }
                                else if (weatherIcon == "02n") {
                                    Image(systemName: "cloud.moon")
                                }
                                else if (weatherIcon == "03n") {
                                    Image(systemName: "cloud")
                                }
                                else if (weatherIcon == "04n") {
                                    Image(systemName: "cloud")
                                }
                                else if (weatherIcon == "09n") {
                                    Image(systemName: "cloud.moon.rain")
                                }
                                else if (weatherIcon == "10n") {
                                    Image(systemName: "cloud.moon.rain")
                                }
                                else if (weatherIcon == "11n") {
                                    Image(systemName: "cloud.moon.bolt")
                                }
                                else if (weatherIcon == "13n") {
                                    Image(systemName: "snowflake")
                                }
                                else if (weatherIcon == "50n") {
                                    Image(systemName: "cloud.fog")
                                }
                            }
                            .font(.system(size: 40))
                           
                           
                            
                            Text(weather.weather[0].main)
                            
                            
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 94))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                    .foregroundStyle(.white)
                    
                    Spacer()
                        .frame(height: 80)
                    
                    Image("city-weather-app")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350)
                    
                    Spacer()
                    
                    
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer.low", name: "Min temp", value: weather.main.tempMin.roundDouble() + "°")
                        Spacer()
                        WeatherRow(logo: "thermometer.medium", name: "Max temp", value: weather.main.tempMax.roundDouble() + "°")
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + "m/s")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.tempMax.roundDouble() + "%")
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundStyle(colorScheme == .light
                                 ? Color(hue: 0.656, saturation: 0.787, brightness: 0.354)
                                 : Color(hue: 0.655, saturation: 0.0, brightness: 0.894)
                                )
                .background(colorScheme == .light ? .white : .black)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
           
                        
        }
        .ignoresSafeArea(edges: .bottom)
        .background(colorScheme == .light
                    ? Color(hue: 0.664, saturation: 0.811, brightness: 0.46)
                    : Color(hue: 0.664, saturation: 0.811, brightness: 0.26)
        )
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
