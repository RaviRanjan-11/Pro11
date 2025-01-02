//
//  ImageButton.swift
//  Pro11
//
//  Created by Ravi Ranjan on 23/12/24.
//

import SwiftUI


enum ImageSizeValue {
    case small
    case medium
    case large
    var size: CGFloat {
        switch self {
        case .small: return 16
        case .medium: return 24
        case .large: return 32
        }
    }
}

struct ImageButton: View {
    var image: String
    var isSystemImage: Bool = false
    var tintcolor: Color = Color.red
    var height: ImageSizeValue = .large
    var width: ImageSizeValue = .large
    var callback: () -> Void = {}
    
    var body: some View {
        Button(action: callback) {
            if isSystemImage {
                Image(systemName: image)
                    .resizable()
                    .tint(tintcolor)
            } else {
                Image(image)
                    .resizable()
            }
        }
        .frame(width: width.size, height: height.size)
    }
}

#Preview {
    ImageButton(image: "chevron.backward", isSystemImage: true, height: .large, width: .large)
}
