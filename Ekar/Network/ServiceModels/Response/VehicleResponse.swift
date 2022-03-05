//
//  VehicleResponse.swift
//  Ekar
//
//  Created by Ali TANIRLAR on 5.03.2022.
//

import Foundation

import Foundation

// MARK: - VehicleResponse
struct VehicleResponse: Codable {
    let success: Bool?
    let message: String?
    let error: String?
    let attributes: Attributes?
    let colors: [Color]?
    let equipment: [String: Equipment]?
    let warranties: [Warranty]?


    enum CodingKeys: String, CodingKey {
        case success = "success"
        case message = "message"
        case error = "error"
        case attributes = "attributes"
        case colors = "colors"
        case equipment = "equipment"
        case warranties = "warranties"

    }
}

// MARK: - Attributes
struct Attributes: Codable {
    let year: String?
    let make: String?
    let model: String?
    let trim: String?
    let style: String?
    let fuelType: String?
    let transmissionShort: String?
    let exteriorColor: [String]?
    
    enum CodingKeys: String, CodingKey {
        case year = "year"
        case make = "make"
        case model = "model"
        case trim = "trim"
        case style = "style"
        case fuelType = "fuel_type"
        case transmissionShort = "transmission_short"
        case exteriorColor = "exterior_color"

    }
}

// MARK: - Color
struct Color: Codable {
    let category: Category?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case category = "category"
        case name = "name"
    }
}

enum Category: String, Codable {
    case exterior = "Exterior"
    case interior = "Interior"
}

enum Equipment: String, Codable {
    case nA = "N/A"
    case opt = "Opt."
    case std = "Std."
}

// MARK: - Input
struct Input: Codable {
    let key: String?
    let vin: String?

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case vin = "vin"
    }
}

// MARK: - Warranty
struct Warranty: Codable {
    let type: String?
    let miles: String?
    let months: String?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case miles = "miles"
        case months = "months"
    }
}
