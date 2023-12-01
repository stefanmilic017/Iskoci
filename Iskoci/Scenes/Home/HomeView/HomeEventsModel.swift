//
//  HomeEventsModel.swift
//  Iskoci
//
//  Created by kancelarijazamlade Vranje on 16.10.23..
//

import Foundation

struct HomeEventsModel {
    var events: [Event] = [
        Event(id: 1, picture: "event-image", name: "DOWNHILL Festival II", description: "Kancelarija za mlade pod pokroviteljstvom Grada Vranja organizuje drugi po redu DOWNHILL festival u subotu 09.09.2023. godine u atrijumskom delu sale Okce sa početkom od 20h na kome će nastupiti 4 renomirana benda, koji su se proslavili u žanru southern/stoner/sludge/metal/rock.", timestamp: 1690923600, streetName: "Cara Dusana 14", placeName: "Niski kulturni centar", latitude: 43.31113882818083, longitude: 21.899212026720424, price: 0, link: "https://www.vranje.rs"),
        
        Event(id: 2, picture: "event-image", name: "Prva biciklijada u Vranju", description: "", timestamp: 1690923600, streetName: "Stanoja Bunusevca, Vranje", placeName: "Trg Kralja Milana", latitude: 43.321648030923626, longitude: 21.895723656068085, price: 150, link: "https://www.vranje.rs"),
        
        Event(id: 3, picture: "event-image", name: "Medjunarodni dan mladih", description: "", timestamp: 1690923600, streetName: "Cara Dusana 14", placeName: "Trg Kralja Milana", latitude: 42.553481354555835, longitude: 21.898356362408723, price: 0, link: "https://www.vranje.rs")
    ]
}
