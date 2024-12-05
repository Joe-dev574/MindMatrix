//
//  ItemCardView.swift
//  MindMatrix
//
//  Created by Joseph DeWeese on 11/30/24.
//

import SwiftUI

struct ItemCardView: View {
    @Environment(\.modelContext) private var context
    let item: Item
    var body: some View {
        NavigationStack{
            SwipeAction(cornerRadius: 7, direction: .trailing) {
                ZStack {
                    RoundedRectangle(cornerRadius: 7)
                        .fill(.ultraThinMaterial.opacity(.greatestFiniteMagnitude))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    VStack(alignment: .leading){
                        HStack{
                            ZStack {
                                RoundedRectangle(cornerRadius: 7)
                                    .fill(.taskColor23)
                                    .frame(height: 32, alignment: .leading)
                                Text(item.category)
                                    .foregroundStyle(.black)
                                    .fontDesign(.serif)
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 5)
                            }
                            .background(appTint.shadow(.drop(color: .black.opacity(0.65), radius: 2)), in: .rect(cornerRadius: 7))
                            .padding(.horizontal, 5)
                        }
                        //MARK:  MAIN BODY OF CARD
                        HStack{
                            //MARK:  ICON
                            item.icon
                                .font(.largeTitle)
                                .padding(.leading, 5)
                                .padding(.horizontal, 5)
                                .padding(.bottom, 30)
                                .foregroundStyle(appTint)
                            VStack(alignment: .leading){
                                Text(item.title )
                                    .fontDesign(.serif)
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.gray)
                                    .padding(.horizontal, 2)
                                    .padding(.bottom, 4.0)
                                Text(item.remarks)
                                    .fontDesign(.serif)
                                    .font(.system(size: 14))
                                    .foregroundStyle(.primary)
                                    .padding(.horizontal, 4)
                                    .padding(.bottom, 7)
                                    .lineLimit(3)
                            
                                HStack {
                                    if item.sniperScopeTags != nil{
                                        ViewThatFits {
                                            Text("SniperScopeStackView(sniperScope: sniperScopes)")
                                            ScrollView(.horizontal, showsIndicators: false) {
                                                Text("SniperScopeStackView(sniperScope: sniperScopes)")
                                            }
                                        }
                                    }
                               
                                }.padding(7)
                                HStack {
                                    //MARK:  DATE CREATED DATA LINE
                                    Text("Date Created: ")
                                        .foregroundStyle(.gray)
                                        .fontDesign(.serif)
                                    Image(systemName: "calendar.badge.clock")
                                        .font(.caption)
                                        .fontDesign(.serif)
                                        .foregroundStyle(.gray)
                                    Text(item.dateAdded.formatted(.dateTime))
                                        .fontDesign(.serif)
                                        .foregroundColor(.secondary)
                                }
                                .font(.system(size: 12))
                            }
                            
                        }.padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            } actions: {
                Action(tint: .red, icon: "trash", action: {
                    context.delete(item)
                    //WidgetCentrer.shared.reloadAllTimneLines
                })
            }
        }
   
    }
}
#Preview {
    ItemCardView(item: Item(title: "Sniper Scope Daily Planner", remarks: "A project for a daily planner that allows users to track their progress towards their goals."))
}

