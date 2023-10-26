//
//  Animation.swift
//  SpringApp
//
//  Created by Андрей Платунов on 26.10.2023.
//

struct Animation: CustomStringConvertible {
    
    let name: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    var description: String {
        """
preset: \(name)
curve: \(curve)
force: \(String(format: "%.02f", force))
duration: \(String(format: "%.02f", duration))
delay: \(String(format: "%.02f", delay))
"""
    }
    
    static func getRandomAnimation() -> Animation {
        Animation(
            name: DataStore.shared.animations.randomElement()?.rawValue ?? "slideLeft",
            curve: DataStore.shared.animations.randomElement()?
                .rawValue ?? "easeIn",
            force: Double.random(in: 1...1.5),
            duration: Double.random(in: 0.8...1.6),
            delay: 2
            
        )
    }
}
