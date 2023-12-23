class SpaceAge {
  private enum PlanetsInEarthYears: Double, CaseIterable {
    case earth = 1.0
    case jupiter = 11.862615
    case mars = 1.8808158
    case mercury = 0.2408467
    case neptune = 164.79132
    case saturn = 29.447498
    case uranus = 84.016846
    case venus = 0.61519726
  }
  
  var onEarth: Double {
    calculateAgeInYears(for: .earth)
  }
  
  var onMercury: Double {
    calculateAgeInYears(for: .mercury)
  }
  
  var onVenus: Double {
    calculateAgeInYears(for: .venus)
  }
  
  var onMars: Double {
    calculateAgeInYears(for: .mars)
  }
  
  var onJupiter: Double {
    calculateAgeInYears(for: .jupiter)
  }
  
  var onSaturn: Double {
    calculateAgeInYears(for: .saturn)
  }
  
  var onUranus: Double {
    calculateAgeInYears(for: .uranus)
  }
  
  var onNeptune: Double {
    calculateAgeInYears(for: .neptune)
  }

  private let ageInSeconds: Double
  init(_ ageInSeconds: Double) {
    self.ageInSeconds = ageInSeconds
  }

  private func calculateAgeInYears(for planet: PlanetsInEarthYears) -> Double {
    let earthHours: Double = 24
    let earthMinutesInAnHour: Double = 60
    let earthSecondsInAMinute: Double = 60
    let daysOnEarth = 365.25 * planet.rawValue
    
    let earthYears = ((((ageInSeconds / earthSecondsInAMinute) / earthMinutesInAnHour) / earthHours) / daysOnEarth)
    return earthYears
  }
}