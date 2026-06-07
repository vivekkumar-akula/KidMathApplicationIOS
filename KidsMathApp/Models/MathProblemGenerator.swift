//
//  MathProblemGenerator.swift
//  KidsMathApp
//
//  Created by Vanam, Lalith Koushik on 10/22/25.
//

import Foundation

struct MathProblem {
    let questionText: String
    let answer: Int
}

enum Difficulty: String { case Easy, Medium, Hard }

enum Operation: String { case plus = "+", minus = "−", multiply = "×", divide = "÷" }

struct MathProblemGenerator {
    static func make(_ op: Operation, difficulty: Difficulty) -> MathProblem {
        let range: ClosedRange<Int>
        switch difficulty {
        case .Easy:   range = 1...10
        case .Medium: range = 10...50
        case .Hard:   range = 50...100
        }
        var a = Int.random(in: range)
        var b = Int.random(in: range)

        if op == .divide {
            // force exact division for kids
            b = max(1, b)
            a = b * Int.random(in: 1...10)
        }

        let (text, ans): (String, Int)
        switch op {
        case .plus:     (text, ans) = ("\(a) + \(b) = ?", a + b)
        case .minus:    (text, ans) = ("\(a) − \(b) = ?", a - b)
        case .multiply: (text, ans) = ("\(a) × \(b) = ?", a * b)
        case .divide:   (text, ans) = ("\(a) ÷ \(b) = ?", a / b)
        }
        return MathProblem(questionText: text, answer: ans)
    }
}

