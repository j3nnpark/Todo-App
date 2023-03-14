//
//  Header.swift
//  Todo
//
//  Created by Jenn Park on 2023-03-09.
//

import SwiftUI

struct Header: View {
    @ObservedObject var viewmodel: Todos
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(getDateString())
                .font(.largeTitle.weight(.bold))
                .foregroundColor(Color(red: 14/255, green: 14/255, blue: 17/255))
                .padding([.bottom, .top], 5)
            
            Text("\(viewmodel.incompleteCount) incomplete, \(viewmodel.completeCount) completed")
                .foregroundColor(Color(red: 87/255, green: 87/255, blue: 103/255))
                .fontWeight(.medium)
                .padding(.bottom, 10)
            
            Divider()
                .frame(height: 1)
                .overlay(Color(red: 208/255, green: 208/255, blue: 208/255))
                .background(Color(red: 208/255, green: 208/255, blue: 208/255))
        }
    }
}

extension Header {
    func getDateString() -> String {
        let dateFormatter = DateFormatter()
        let date = Date()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: date)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(viewmodel: Todos())
    }
}
