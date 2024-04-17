//
//  GamesDetailCellView.swift
//  AllGames
//
//  Created by Yery Castro on 8/4/24.
//

import SwiftUI

struct GamesDetailCellView: View {
    var title: String
    var label: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .bold()
            Text(label)
                .font(.subheadline)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    GamesDetailCellView(title: "Name", label: "Description")
}
