//
//  ItemListScreen.swift
//  MindMatrix
//
//  Created by Joseph DeWeese on 11/30/24.
//

import SwiftUI
import SwiftData

struct ItemListScreen: View {
    /// View Properties
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var dateAdded: Date = Date.now
    @State private var startDate: Date = Date.distantPast
    @State private var endDate: Date =  Date.distantPast
    @State private var selectedCategory: Category = .Objectives
    @State private var addNewItem: Bool = false
    /// For Animation
    @Namespace private var animation
    
    @State private var createNewItem: Bool = false
    var body: some View {
        GeometryReader {
            let size = $0.size
            VStack {
                NavigationStack{
                    LogoView(size: size)
                    ScrollView(.vertical) {
                        VStack(spacing: 10) {
                            ForEach(items) { item in
                                NavigationLink{
                                    EditItemScreen()
                                } label: {
                                    ItemCardView(item: item)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
    }
    @ViewBuilder
    func LogoView( size: CGSize) -> some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 45, height: 40)
                .foregroundColor(.blue).opacity(0.6)
            Spacer()
            ZStack{
                Image(systemName: "scope")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .foregroundColor(.blue).opacity(0.3)
                HStack {
                    Text("Sniper")
                        .font(.callout)
                        .fontDesign(.serif)
                        .fontWeight(.bold)
                        
                        .foregroundColor(.blue)
                        .offset(x: 13, y: 7)
                    Text("Scope")
                        .font(.callout)
                        .fontDesign(.serif)
                        .fontWeight(.heavy)
                        .foregroundStyle(.primary)
                        .offset(x: 5, y: 7)
                    Text("1.0")
                        .font(.caption)
                        .fontDesign(.serif)
                        .fontWeight(.regular)
                        .padding(.leading, 10)
                        .foregroundColor(.blue)
                        .offset(x: -15, y: -2)
                }.offset(x: 5)
            }
            Spacer()
            Button{
                addNewItem = true
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 45)
                    .background(.blue.gradient, in: .circle)
                    .contentShape(.circle)
            }
            .sheet(isPresented: $addNewItem) {
                NewItemView()
                    .presentationDetents([.height(400)])
            }
        }
        .padding(.horizontal,4)
        .background {
            VStack(spacing: 0) {
                Rectangle()
                    .fill(.background)
            }
            .visualEffect { content, geometryProxy in
                content
                //  .opacity(headerBGOpacity(geometryProxy))
            }
            .padding(.horizontal, -15)
            .padding(.top, 15)
        }
    }
}
#Preview {
    ItemListScreen()
        .modelContainer(for: Item.self, inMemory: true)
}
