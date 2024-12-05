//
//  Item.swift
//  MindMatrix
//
//  Created by Joseph DeWeese on 11/30/24.
//

import SwiftUI
import SwiftData


@Model
final class Item: Codable{
    var title: String = ""
    var remarks: String = ""
    var category: String = ""
    var dateAdded: Date = Date.now
    var dateStarted: Date = Date.distantPast
    var dateCompleted: Date = Date.distantPast
    var itemTint: String = ""
    var tintColor: String
    var status: Status.RawValue = Status.Hold.rawValue
    @Relationship(deleteRule: .cascade)
    var notes: [Note]?
    @Relationship(inverse: \SniperScopeTag.items)
    var sniperScopeTags: [SniperScopeTag]?
    
    
    init(
        title: String = "",
        remarks: String = "",
        dateAdded: Date = Date.now,
        dateStarted: Date = Date .distantPast,
        dateCompleted: Date = Date.distantPast,
        category: String = "",
        itemTint: String = "",
        tintColor: String = "",
        status: Status = .Hold,
        sniperScopeTags: [SniperScopeTag]? = nil
    ) {
        self.title = title
        self.remarks = remarks
        self.dateAdded = dateAdded
        self.dateStarted = dateStarted
        self.dateCompleted = dateCompleted
        self.category = category
        self.tintColor = tintColor
        self.itemTint = itemTint
        self.status = status.rawValue
        self.sniperScopeTags = sniperScopeTags
    }
    /// Conforming Codable Protocol
    enum CodingKeys: CodingKey {
        case title
        case remarks
        case dateAdded
        case dateStarted
        case dateCompleted
        case category
        case tintColor
        case itemTint
        case status
        case notes
        case sniperScopeTags
        
        
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        remarks = try container.decode(String.self, forKey: .remarks)
        dateAdded = try container.decode(Date.self, forKey: .dateAdded)
        dateStarted = try container.decode(Date.self, forKey: .dateStarted)
        dateCompleted = try container.decode(Date.self, forKey: .dateCompleted)
        category = try container.decode(String.self, forKey: .category)
        tintColor = try container.decode(String.self, forKey: .tintColor)
        itemTint = try container.decode(String.self, forKey: .itemTint)
        category = try container.decode(String.self, forKey: .category)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(remarks, forKey: .remarks)
        try container.encode(dateAdded, forKey: .dateAdded)
        try container.encode(dateStarted, forKey: .dateStarted)
        try container.encode(dateCompleted, forKey: .dateCompleted)
        try container.encode(category, forKey: .category)
        try container.encode(tintColor, forKey: .tintColor)
        try container.encode(itemTint, forKey: .itemTint)
        
    }
    var icon: Image {
        switch Status(rawValue: status)! {
        case .Hold:
            Image(systemName: "checkmark.diamond.fill")
        case .inProgress:
            Image(systemName: "book.fill")
        case .Completed:
            Image(systemName: "books.vertical.fill")
        }
    }
    var tint: Color {
        switch itemTint {
            case "TaskColor 1": return .taskColor1
            case "TaskColor 2": return .taskColor2
            case "TaskColor 3": return .taskColor3
            case "TaskColor 4": return .taskColor4
            case "TaskColor 5": return .taskColor5
            case "TaskColor 6": return .taskColor6
            case "TaskColor 7": return .taskColor7
            case "TaskColor 8": return .taskColor8
            case "TaskColor 9": return .taskColor9
            case "TaskColor 10": return .taskColor10
            case "TaskColor 11": return .taskColor11
            case "TaskColor 12": return .taskColor12
            case "TaskColor 13": return .taskColor13
            case "TaskColor 14": return .taskColor14
            case "TaskColor 15": return .taskColor15
            case "TaskColor 16": return .taskColor16
            case "TaskColor 17": return .taskColor17
            case "TaskColor 18": return .taskColor18
            case "TaskColor 19": return .taskColor19
            case "TaskColor 20": return .taskColor20
            case "TaskColor 21": return .taskColor21
            case "TaskColor 22": return .taskColor22
            case "TaskColor 23": return .taskColor23
            case "TaskColor 24": return .taskColor24
            case "TaskColor 25": return .taskColor25
            case "TaskColor 26": return .taskColor26
            case "TaskColor 27": return .taskColor27
            case "TaskColor 28": return .taskColor28
            case "TaskColor 29": return .taskColor29
            case "TaskColor 30": return .taskColor30
        default: return .gray
        }
    }
}
enum Status: Int, Codable, Identifiable, CaseIterable {
    case Hold, inProgress, Completed
    var id: Self {
        self
    }
    var descr: LocalizedStringResource {
        switch self {
        case .Hold:
            "On Shelf"
        case .inProgress:
            "In Progress"
        case .Completed:
            "Completed"
        }
    }
}
