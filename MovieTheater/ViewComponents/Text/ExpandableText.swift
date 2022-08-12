//
//  ExpandableText.swift
//  MovieTheater
//
//  Created by Bing Bing on 2022/8/11.
//

import SwiftUI

struct ExpandableText: View {
    
    @State private var isExpanded: Bool = false
    @State private var truncated: Bool = false
    @State private var fullSize: CGFloat = 0
    
    private var markdownText: AttributedString {
        (try? AttributedString(markdown: text, options: AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace))) ?? AttributedString()
    }
    
    var text: String
    var lineLimit: Int
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Group {
                Text(markdownText)
            }
            .lineLimit(isExpanded ? nil : lineLimit)
            .animation(.spring(), value: isExpanded)
            .mask {
                VStack(spacing: 0) {
                    Rectangle().foregroundColor(.black)

                    HStack(spacing: 0) {
                        Rectangle().foregroundColor(.black)
                        
                        if truncated {
                            if !isExpanded {
                                HStack(alignment: .bottom, spacing: 0) {
                                    LinearGradient(
                                        gradient: Gradient(stops: [
                                            Gradient.Stop(color: .black, location: 0),
                                            Gradient.Stop(color: .clear, location: 0.8)
                                        ]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                    .frame(width: 40, height: 32)

                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 30)
                                }
                            }
                        }
                    }
                    .frame(height: 32)
                }
            }
            
            if truncated {
                if !isExpanded {
                    Button(action: {
                        self.isExpanded.toggle()
                    }) {
                        Text("更多")
                            .foregroundColor(.blue)
                    }
                    .offset(x: -2)
                }
            }
        }
        .background {
            ZStack {
                if !truncated {
                    if fullSize != 0 {
                        Text(text)
                            .lineLimit(lineLimit)
                            .background {
                                GeometryReader { proxy in
                                    Color.clear
                                        .onAppear {
                                            if fullSize > proxy.size.height {
                                                self.truncated = true
                                            }
                                        }
                                }
                            }
                    }
                    
                    Text(text)
                        .lineLimit(999)
                        .fixedSize(horizontal: false, vertical: true)
                        .background {
                            GeometryReader { proxy in
                                Color.clear
                                    .onAppear {
                                        self.fullSize = proxy.size.height
                                    }
                            }
                        }
                }
            }
        }
    }
}

struct ExpandableText_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableText(text: "澤國江山入戰圖，生民何計樂樵蘇。\n憑君莫話封侯事，一將功成萬骨枯。", lineLimit: 1)
    }
}
