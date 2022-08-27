//
//  ContentView.swift
//  weather-app
//
//  Created by Joel on 26/08/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            
            VStack{
                
                CityTextView(cityName: "São Paulo")
                
                MainWeatherStatusView(
                    imageName: isNight ? "cloud.moon.fill" :  "cloud.sun.fill",
                    temperature: 35)
                
                .padding(.bottom, 40)
                
                HStack(spacing: 20){
                    
                    dayofWeekView(
                        dayofWeek: "Tue",
                        imageName: "cloud.sun.fill",
                        temperature: 27)
                    
                    dayofWeekView(
                        dayofWeek: "Wed",
                        imageName: "sun.max.fill",
                        temperature: 29)
                    
                    
                    dayofWeekView(
                        dayofWeek: "Thu",
                        imageName: "wind",
                        temperature: 28)
                    
                    
                    dayofWeekView(
                        dayofWeek: "Fri",
                        imageName: "cloud.bolt.rain.fill",
                        temperature: 19)
                    
                    
                    dayofWeekView(
                        dayofWeek: "Sat",
                        imageName: "cloud.sun.fill",
                        temperature: 27)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label :{
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
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


struct dayofWeekView: View {
    
    var dayofWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack{
            Text(dayofWeek)
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
    
    @Binding var isNight: Bool
    
    var body: some View {
        
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("Lightblue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}


struct CityTextView: View {
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}


struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View{
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
                
        }
    }
}

