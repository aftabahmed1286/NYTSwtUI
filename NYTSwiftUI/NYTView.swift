//
//  ContentView.swift
//  NYTView
//
//  Created by Aftab Ahmed on 8/5/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import SwiftUI

struct NYTView: View {
    
    @ObservedObject var nytModelMaker = NYTModelMaker()
    
    var body: some View {
        Group {
        if nytModelMaker.allNewsData.isEmpty {
            Text("News Loading!....")
        } else {
            NavigationView {
                List (nytModelMaker.allNewsData) {news in
                    
                    NavigationLink(destination: NYTWebView(request: URLRequest(url: news.webUrl()))) {
                        
                        HStack {
                            
                            ImageWidgetView(imageURL: news.thumbNailImageURLString())
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipped()
                                .clipShape(Circle())
                                                    
                                                    
                            VStack (alignment: .leading) {
                                HStack {
                                    Text("\(news.newsModel.title ?? "")")
                                        .lineLimit(nil)
                                        .padding(.leading, 10)
                                        .multilineTextAlignment(.leading)
                                }
                                Text("\(news.newsModel.byLine ?? "")")
                                HStack {
                                    
                                    Spacer()
                                    
                                    Image("calendar_icon")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment:
                                            .center)
                                        .clipped()
                                    
                                    Text("\(news.newsModel.publishedDate ?? "")")
                                    
                                }
                            }
                        }
                    }
                }.navigationBarTitle(Text("NY Times!")
                    //.color(Color.black)
                    .font(.headline)
                    , displayMode: .large)
                }
            
        }
        }.onAppear(perform: nytModelMaker.fetch)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NYTView()
    }
}
#endif
