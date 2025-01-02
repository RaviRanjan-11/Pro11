//
//  TabSwitcher.swift
//  Pro11
//
//  Created by Ravi Ranjan on 27/12/24.
//

import SwiftUI

struct TabItem<Content: View>: Identifiable {
    let id = UUID()
    let title: String
    let view: Content
}

struct ScrollableTabSwitcher<Content: View>: View {
    let tabs: [TabItem<Content>]
    @State private var selectedTabIndex: Int = 0
    var selectedColor: Color // The selected tab color

    var body: some View {
        VStack(spacing: 0) {
            // Scrollable Tab Bar
            ScrollableTabBar(
                tabs: tabs.map { $0.title },
                selectedIndex: $selectedTabIndex,
                selectedColor: selectedColor
            )

            // Swipeable Content
            TabView(selection: $selectedTabIndex) {
                ForEach(Array(tabs.enumerated()), id: \.element.id) { index, tab in
                    tab.view
                        .tag(index)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

struct ScrollableTabBar: View {
    let tabs: [String]
    @Binding var selectedIndex: Int
    var selectedColor: Color

    var body: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(Array(tabs.enumerated()), id: \.offset) { index, title in
                        TabButton(
                            title: title,
                            isSelected: selectedIndex == index,
                            selectedColor: selectedColor,
                            onTap: {
                                withAnimation {
                                    selectedIndex = index
                                }
                            }
                        )
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            }
            Spacer()
        }
        .background(Color.gray.opacity(0.1))
        .frame(maxWidth: .infinity)
    }
}

struct TabButton: View {
    let title: String
    let isSelected: Bool
    let selectedColor: Color
    let onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(isSelected ? selectedColor : .gray)
                if isSelected {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(selectedColor)
                        .frame(height: 2)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

#Preview {
    ScrollableTabSwitcher(
        tabs: [
            TabItem(title: "Tab 1", view: Text("Tab 1")),
            TabItem(title: "Tab 2", view: Text("Tab 2")),
            TabItem(title: "Tab 3", view: Text("Tab 3")),
        ],
        selectedColor: .red // Set the color of the selected tab here
    )
}
