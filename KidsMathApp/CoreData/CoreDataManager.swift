//
//  CoreDataManager.swift
//  KidsMathApp
//
//  Created by Vanam, Lalith Koushik on 10/16/25.
//

import UIKit
import CoreData

final class CoreDataManager {
    // MARK: - Singleton Instance
    static let shared = CoreDataManager()
    private init() {}

    // MARK: - Managed Object Context
    var context: NSManagedObjectContext {
        // Get the container from AppDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    // MARK: - Save Function
    func saveRecord(name: String,
                    mode: String,
                    op: String,
                    difficulty: String,
                    score: Int,
                    correct: Int,
                    incorrect: Int,
                    durationSec: Int) {

        // Create new record (GameRecord entity must exist in .xcdatamodeld)
        let record = GameRecord(context: context)
        record.playerName = name
        record.mode = mode
        record.operation = op
        record.difficulty = difficulty
        record.score = Int16(score)
        record.correctCount = Int16(correct)
        record.incorrectCount = Int16(incorrect)
        record.durationSec = Int32(durationSec)
        record.date = Date()

        do {
            try context.save()
            print("Record saved successfully.")
        } catch {
            print("Error saving record: \(error.localizedDescription)")
        }
    }

    // MARK: - Fetch Function
    func fetchAllRecords() -> [GameRecord] {
        do {
            return try context.fetch(GameRecord.fetchRequest())
        } catch {
            print("Fetch failed: \(error.localizedDescription)")
            return []
        }
    }

    // MARK: - Delete Function (optional)
    func deleteRecord(_ record: GameRecord) {
        context.delete(record)
        do {
            try context.save()
        } catch {
            print("Error deleting record: \(error.localizedDescription)")
        }
    }
}
