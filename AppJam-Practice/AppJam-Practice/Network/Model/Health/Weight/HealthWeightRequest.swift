//
//  HealthWeightRequest.swift
//  AppJam-Practice
//
//  Created by 소연 on 2022/06/24.
//

import Foundation

struct HealthWeight: Codable {
    let weight: Double
    let fatPercent: Double?
    let muscle: Double?
    let memo: String?
}
