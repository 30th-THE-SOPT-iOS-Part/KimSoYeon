//
//  HealthMainResponse.swift
//  AppJam-Practice
//
//  Created by 소연 on 2022/06/24.
//

import Foundation

// MARK: - HealthResponse
struct HealthResponse: Codable {
    let step: Step
    let calorie: Calorie
    let sleep: Sleep
    let weight: Double?
    let water: Int
    
    enum CodingKeys: String, CodingKey {
        case step
        case calorie
        case sleep
        case weight
        case water
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        step = (try? values.decode(Step.self, forKey: .step)) ?? Step(count: 0, target: 0, time: 0, activity: 0, percent: 0)
        calorie = (try? values.decode(Calorie.self, forKey: .calorie)) ?? Calorie(intake: 0, target: 0)
        sleep = (try? values.decode(Sleep.self, forKey: .sleep)) ?? Sleep(hour: 0, minute: 0, time: "")
        weight = (try? values.decode(Double.self, forKey: .weight)) ?? 0.0
        water = (try? values.decode(Int.self, forKey: .water)) ?? 0
    }
}

// MARK: - Step
struct Step: Codable {
    let count, target, time, activity: Int
    let percent: Int
}

// MARK: - Calorie
struct Calorie: Codable {
    let intake, target: Int
}

// MARK: - Sleep
struct Sleep: Codable {
    let hour, minute: Int
    let time: String
}
