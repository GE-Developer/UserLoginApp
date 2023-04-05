//
//  Person.swift
//  UserLoginApp
//
//  Created by M I C H A E L on 04.04.2023.
//

struct User {
    let owner: Owner
    let guest: Guest
    
    static func getData() -> User {
        User(owner: Owner.aboutOwner(), guest: Guest.aboutGuest())
    }
}

struct Owner {
    let login: String
    let password: String
    let nickName: String
    let info: Info
    
    var welcomeMessage: String {
        "Welcome back \(nickName)!"
    }
    
    static func aboutOwner() -> Owner {
        Owner(
            login: "Mike",
            password: "Mike",
            nickName: "🅜🅘🅒🅗🅐🅔🅛",
            info: Info.getInfo()
        )
    }
}

struct Info {
    enum Photo {
        case first, second, third, fourth
    }
    
    let name: String
    let surname: String
    let age: String
    let contact: Contact
    let job: String
    let education: String
    let hobbies: String
    let photo: [Photo: String]
    
    var mainInfo: String {
        """
        • My name is \(name) \(surname)
        • I am \(age) years old
        """
    }
    
    static func getInfo() -> Info {
        Info(
            name: "Mikhail",
            surname: "Bukhrashvili",
            age: "27",
            contact: Contact.getContact(),
            job: """
                 • Real estate business
                 • Hookah business
                 • Currently trying to become an IOS-Developer
                 """,
            education: "• Gubkin's oil and gas university",
            hobbies: """
                     • Swift (Hope it will become not just hobby)
                     • Design
                     • Snowboading
                     • Listening music on Spotify
                     """,
            photo: [
                .first: "image1",
                .second: "image2",
                .third: "image3",
                .fourth: "image4"
            ]
        )
    }
}

struct Contact {
    let tel: String
    let telegram: String
    let city: String
    let country: String
    let location: Location
    let gitHub: String
    
    var fullAdress: String {
        "\(country), \(city)"
    }
    
    static func getContact() -> Contact {
        Contact(
            tel: "+7 (909) 999-32-79",
            telegram: "@mishabux",
            city: "Tbilisi",
            country: "Georgia",
            location: Location.getCoordinate(),
            gitHub: "https://github.com/GE-Developer/UserLoginApp"
        )
    }
}

struct Location {
    let latitude: Double
    let longitude: Double
    
    static func getCoordinate() -> Location {
        Location(latitude: 41.7191115731, longitude: 44.8023802042)
    }
}

struct Guest {
    let login: String
    let password: String
    let nickname: String
    
    var welcomeMessage: String {
        "Nice to meet you again \(nickname)!"
    }
    
    static func aboutGuest() -> Guest {
        Guest(login: "Alexey", password: "Efimov", nickname: "@Debash")
    }
}
