//
//  ContentView.swift
//  Quotes
//
//  Created by Jaydeepsinh Parmar on 8/2/22.
//

import SwiftUI

struct ContentView: View {
    
    private var quote: [Quote] = Quote.allQuotes
    
    func actionSheet(quote: String, author: String) {
        let data = """
           Quote:
           
           \(quote)
           
           Author: \(author)
           
           Developed By Jaydeep
           """
        
        let activityVC = UIActivityViewController(activityItems: [data], applicationActivities: nil)
        
        
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(quote, id: \.quote) { quote in
                    VStack {
                        Text("\(quote.quote)")
                            .frame(maxWidth: .infinity, alignment: .leading).font(.headline)
                        
                        Spacer()
                        Spacer()
                        
                        HStack {
                            
                            Text("\(quote.author)").frame(maxWidth: .infinity, alignment: .leading)
                            
                            
                            
                            Button("Share") {
                                actionSheet(
                                    quote: quote.quote,
                                    author: quote.author
                                )
                            }.frame(
                                maxWidth: .infinity, alignment: .trailing
                            )
                            
                        }
                        
                    }.padding(16)
                }
                
            }.navigationTitle("Quotes 🚀")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
