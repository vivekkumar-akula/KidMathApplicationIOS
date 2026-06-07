//
//  GameRecord+CoreDataProperties.swift
//  KidsMathApp
//
//  Created by Vanam, Lalith Koushik on 10/16/25.
//
//

import Foundation
import CoreData


extension GameRecord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameRecord> {
        return NSFetchRequest<GameRecord>(entityName: "GameRecord")
    }

    @NSManaged public var playerName: String?
    @NSManaged public var mode: String?
    @NSManaged public var operation: String?
    @NSManaged public var difficulty: String?
    @NSManaged public var score: Int16
    @NSManaged public var correctCount: Int16
    @NSManaged public var incorrectCount: Int16
    @NSManaged public var durationSec: Int32
    @NSManaged public var date: Date?

}

extension GameRecord : Identifiable {

}
