//
//  PlayModel.swift
//  AncientEgypt
//
//  Created by Yurii Derzhylo on 05.12.2023.
//

import UIKit

struct AncientPlayModel {
    let ancientQuestion: String
    let ancientImage: UIImage
    let ancientValidAnswer: Int
    let ancientAnswers: [String]
}

let ancientPlayModel: [AncientPlayModel] = [
    AncientPlayModel(ancientQuestion: "Which ancient civilization is known for building the pyramids in Egypt?", ancientImage: UIImage(named: "1")!, ancientValidAnswer: 0, ancientAnswers: ["Egyptians", "Romans", "Greeks"]),
    
    AncientPlayModel(ancientQuestion: "What is the capital city of Egypt?", ancientImage: UIImage(named: "2")!, ancientValidAnswer: 1, ancientAnswers: ["Cairo", "Alexandria", "Luxor"]),
    
    AncientPlayModel(ancientQuestion: "Which famous queen ruled Egypt alongside Julius Caesar and Mark Antony?", ancientImage: UIImage(named: "3")!, ancientValidAnswer: 2, ancientAnswers: ["Cleopatra", "Nefertiti", "Hatshepsut"]),
    
    AncientPlayModel(ancientQuestion: "In what year did the construction of the Great Pyramid of Giza begin?", ancientImage: UIImage(named: "4")!, ancientValidAnswer: 0, ancientAnswers: ["2580 BC", "200 AD", "1200 BC"]),
    
    AncientPlayModel(ancientQuestion: "What is the name of the ancient Egyptian writing system consisting of logographic and alphabetic elements?", ancientImage: UIImage(named: "5")!, ancientValidAnswer: 1, ancientAnswers: ["Hieroglyphics", "Cuneiform", "Runes"]),
    
    AncientPlayModel(ancientQuestion: "Which ancient Egyptian god is often depicted with the head of a jackal?", ancientImage: UIImage(named: "6")!, ancientValidAnswer: 0, ancientAnswers: ["Anubis", "Ra", "Osiris"]),
    
    AncientPlayModel(ancientQuestion: "What was the purpose of the Rosetta Stone?", ancientImage: UIImage(named: "7")!, ancientValidAnswer: 2, ancientAnswers: ["Weapon", "Jewelry", "Hieroglyphics"]),
    
    AncientPlayModel(ancientQuestion: "Which pharaoh is known for the discovery of Tutankhamun's tomb in the Valley of the Kings?", ancientImage: UIImage(named: "8")!, ancientValidAnswer: 1, ancientAnswers: ["Hatshepsut", "Howard Carter", "Ramesses II"]),
    
    AncientPlayModel(ancientQuestion: "What is the ancient name of the southern region of ancient Egypt?", ancientImage: UIImage(named: "9")!, ancientValidAnswer: 0, ancientAnswers: ["Upper Egypt", "Lower Egypt", "Middle Egypt"]),
    
    AncientPlayModel(ancientQuestion: "Which famous river delta is located in northern Egypt, where the Nile River empties into the Mediterranean Sea?", ancientImage: UIImage(named: "10")!, ancientValidAnswer: 1, ancientAnswers: ["Amazon Delta", "Nile Delta", "Yangtze Delta"])
]

