//
//  VideoCategory.swift
//  Aura
//
//  Created by Maxwell Dolensky on 5/3/21.
//  Copyright © 2021 Max Dolensky. All rights reserved.
//

import Foundation

struct VideoGroup: Codable {
    var id: String
    var baseID: String
    var thumbnailURL: String
    var sections: [Section]
    var requiresPurchase: Bool
    var sectionLockStarts: Int
    var rowLockStarts: Int
    var purchaseIdentifier: String
}

struct Section: Codable {
    var title: String
    var videos: [Video]
}

struct Video: Codable {
    var title: String
    var thumbnailURL: String
    var videoURL: String
    var duration: String
}

struct VideoPosition: Codable {
    var baseID: String
    var section: Int
    var row: Int
    
    init(baseID: String, section: Int, row: Int) {
        self.baseID = baseID
        self.section = section
        self.row = row
    }
    
    init(data: Data) {
        do {
            let decoder = JSONDecoder()
            let position = try decoder.decode(VideoPosition.self, from: data)
            self = position
            self.baseID = position.baseID
            self.section = position.section
            self.row = position.row
        } catch {
            self.baseID = "intro"
            self.section = 0
            self.row = 0
        }
    }
    
    func encode() -> Data? {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            return data
        } catch {
            return nil
        }
    }
}

func populateLessonsDB() {
    
//    let video1_0 = Video(title: "Introduction",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.0_THUMB.png?alt=media&token=0af6dbf8-6675-42ad-88d8-ac2c777cb1c2",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.0_MAIN_INTRO.m4v?alt=media&token=8b59dada-7ea5-4eda-98a4-063dc1929731",
//                            duration: "3 minutes, 22 seconds")
//    
//    let video1_1 = Video(title: "How to Listen",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.1_THUMB.png?alt=media&token=063ec5bb-cc40-4ce4-b6bb-5ad904fd899a",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.1_LISTEN_INTRO.m4v?alt=media&token=ffa5a62d-00db-4f6c-8ae2-5cea7bdc39b3",
//                            duration: "1 minute, 33 seconds")
//
//    let video1_2 = Video(title: "How to Mimic",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.2_THUMB.png?alt=media&token=27a239bb-8623-42f3-9212-e9f2d957c5c5",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.2_MIMIC_INTRO.m4v?alt=media&token=2f638176-dee3-4f43-bff0-5ba1cf5ae4a2",
//                            duration: "2 minutes, 21 seconds")
//
//    let video1_3 = Video(title: "How to Rehearse",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.3_THUMB.png?alt=media&token=29a8baf0-d81a-4a6e-8b18-6cc2c057825c",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.3_REHEARSE_INTRO.m4v?alt=media&token=27487645-2e40-4969-b61b-98778bf2b95c",
//                            duration: "3 minutes, 55 seconds")
//
//    let video1_4 = Video(title: "What are Vowels & Consonants",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.4_THUMB.png?alt=media&token=38003671-f776-4d1d-89f7-9d36e9ecf09f",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1.4_CLASSROOM_INTRO.mp4?alt=media&token=22a9e3a5-bd2d-4632-b53b-ab5e1d4477a9",
//                            duration: "1 minute, 48 seconds")
//
//    let video2_0 = Video(title: "Vowels Introduction",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2.0_THUMB.png?alt=media&token=402dfada-7d72-4d20-9bef-e89f4c13abf8",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2.0_CLASSROOM_VOWEL_INTRO.mp4?alt=media&token=4c84ef66-a2ef-4345-a264-8fdc3217ccc1",
//                            duration: "0 minutes, 58 seconds")
//
//    let video3_0 = Video(title: "KY Classroom - BOT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3.0_THUMB.png?alt=media&token=e7f3b9bf-5bf0-4edb-9b06-5088a938ebd4",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3.0_CLASSROOM_VOWELS_BOT.mp4?alt=media&token=afea33f1-c753-48cd-a9c6-1c370f693f74",
//                            duration: "0 minutes, 11 seconds")
//
//    let video3_1 = Video(title: "Listen - BOT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3.1_THUMB.png?alt=media&token=ca1bc757-d794-468b-834f-13a8302cc6c7",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3.1_BOT_LISTEN.mp4?alt=media&token=2f21acb3-73df-45b6-ae49-8a98900ad23b",
//                            duration: "1 minute, 39 seconds")
//
//    let video3_2 = Video(title: "Mimic - BOT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3.2_THUMB.png?alt=media&token=c748f171-2145-4c0a-976f-8cdc15669327",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3.2_BOT_MIMIC.mp4?alt=media&token=05a85a4f-1dd8-422b-bec0-00882ff584c9",
//                            duration: "1 minute, 38 seconds")
//
//    let video4_0 = Video(title: "KY Classroom - BAT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4.0_THUMB.png?alt=media&token=8043cf5e-a959-4f51-b18a-9847fd4aaa5f",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4.0_CLASSROOM_VOWELS_BAT.mp4?alt=media&token=e8adf9f8-d42f-46bd-86f9-52366ecaf131",
//                            duration: "0 minutes, 35 seconds")
//
//    let video4_1 = Video(title: "Listen - BAT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4.1_THUMB.png?alt=media&token=96b22daa-df04-41f5-91a5-c4a628bbc219",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4.1_BAT_LISTEN.mp4?alt=media&token=cc612027-cb04-4e01-ac62-8b49902e0d21",
//                            duration: "1 minute, 10 seconds")
//
//    let video4_2 = Video(title: "Mimic - BAT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4.2_THUMB.png?alt=media&token=5f77d685-c11e-40f8-a86a-8e56b18c0bb7",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4.2_BAT_MIMIC.mp4?alt=media&token=a0cfc773-1cb5-49fc-ac87-aae4b93e9ae6",
//                            duration: "1 minute, 9 seconds")
//
//    let video5_0 = Video(title: "KY Classroom - BOUT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5.0_THUMB.png?alt=media&token=573de8c6-4f47-47ff-be5b-3d3dfee8e48b",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5.0_CLASSROOM%20VOWELS_BOUT.mp4?alt=media&token=27b5d2c3-1409-47d1-905b-11a921fc39b6",
//                            duration: "0 minutes, 26 seconds")
//
//    let video5_1 = Video(title: "Listen - BOUT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5.1_THUMB.png?alt=media&token=6024c321-4286-4984-908c-d03389b00179",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5.1_BOUT_LISTEN.mp4?alt=media&token=01cf69e6-870a-4261-b4c1-2c696661aa6e",
//                            duration: "1 minute, 16 seconds")
//
//    let video5_2 = Video(title: "Mimic - BOUT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5.2_THUMB.png?alt=media&token=b9c20cb3-dc57-48bc-ad7b-937f262ecaa0",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5.2_BOUT_MIMIC.mp4?alt=media&token=aad85665-2375-42f4-9aa2-889b5b0b29a3",
//                            duration: "1 minute, 15 seconds")
//
//    let video6_0 = Video(title: "KY Classroom - BOOT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6.0_THUMB.png?alt=media&token=c30048f4-0621-42df-802a-a9d4559d34ee",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6.0_CLASSROOM%20VOWELS_BOOT.mp4?alt=media&token=fbfde34f-6ff2-474f-817f-2e12b460fe94",
//                            duration: "0 minutes, 14 seconds")
//
//    let video6_1 = Video(title: "Listen - BOOT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6.1_THUMB.png?alt=media&token=aca25522-675f-445d-abbf-443887e80d66",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6.1_BOOT_LISTEN.mp4?alt=media&token=d1016878-7007-4d1f-a7a8-d52f578e9d24",
//                            duration: "1 minute, 53 seconds")
//
//    let video6_2 = Video(title: "Mimic - BOOT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6.2_THUMB.png?alt=media&token=6f4b22a9-0e26-4c7d-aaab-ad740e5cd27b",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6.2_BOOT_MIMIC.mp4?alt=media&token=0268b5e0-461f-49ed-9e09-b011f82bdc4c",
//                            duration: "1 minute, 52 seconds")
//
//    let video7_0 = Video(title: "KY Classroom - BUT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7.0_THUMB.png?alt=media&token=332cfa8f-39ac-4951-90a6-c9a62b10b04c",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7.0_CLASSROOM_VOWELS_BUT.mp4?alt=media&token=b530e8b9-f82e-4d4c-831d-abeb6ce43150",
//                            duration: "0 minutes, 39 seconds")
//
//    let video7_1 = Video(title: "Listen - BUT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7.1_THUMB.png?alt=media&token=57d5bcf5-3e1a-4691-a3ca-053d6e2c8e0b",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7.1_BUT_LISTEN.mp4?alt=media&token=6f26185e-4675-44f5-8f77-51aee1ef3ee5",
//                            duration: "2 minutes, 48 seconds")
//
//    let video7_2 = Video(title: "Mimic - BUT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7.2_THUMB.png?alt=media&token=bf44b519-75ca-4735-913b-3c9a8b21f32d",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7.2_BUT_MIMIC.mp4?alt=media&token=40384ada-5703-424e-8fcf-6942953160f0",
//                            duration: "2 minutes, 47 seconds")
//
//    let video8_0 = Video(title: "KY Classroom - BOOK",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/8.0_THUMB.png?alt=media&token=0c1eb4ba-1595-4757-9d0b-b4556825b084",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/8.0_CLASSROOM_VOWELS_BOOK.mp4?alt=media&token=0755e298-ec6d-42fe-a5ae-1aa50f648109",
//                            duration: "0 minutes, 33 seconds")
//
//    let video8_1 = Video(title: "Listen - BOOK",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/8.1_THUMB.png?alt=media&token=31c905a5-557f-4543-b6b3-d94ba7b25490",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/8.1_BOOK_LISTEN.mp4?alt=media&token=dfcda9f8-7ce6-406f-a1e0-5f1ef08c4eed",
//                            duration: "1 minute, 16 seconds")
//
//    let video8_2 = Video(title: "Mimic - BOOK",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/8.2_THUMB.png?alt=media&token=6ba91016-6c55-43fc-ba19-f794d657c16f",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/8.2_BOOK_MIMIC.mp4?alt=media&token=d3a767a1-37df-42be-b7cd-d7a45324d6ee",
//                            duration: "1 minute, 15 seconds")
//
//    let video9_0 = Video(title: "KY Classroom - BEAT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/9.0_THUMB.png?alt=media&token=225f8768-623d-46f3-b7d3-c55979876fd7",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/9.0_CLASSROOM_VOWELS_BEAT.mp4?alt=media&token=dbe0f185-b1b4-46c5-ba3f-07d651d43946",
//                            duration: "0 minutes, 12 seconds")
//
//    let video9_1 = Video(title: "Listen - BEAT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/9.1_THUMB.png?alt=media&token=0e6d0d95-ad2d-4991-bb04-dc15658e7f89",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/9.1_BEAT_LISTEN.mp4?alt=media&token=88caddc6-95b4-4624-bfd2-003e993aef70",
//                            duration: "2 minutes, 14 seconds")
//
//    let video9_2 = Video(title: "Mimic - BEAT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/9.2_THUMB.png?alt=media&token=5982a3f1-2460-4808-b8e1-65876466e79a",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/9.2_BEAT_MIMIC.mp4?alt=media&token=d5a2af13-aa0e-4241-a47a-1adb9e74f5e4",
//                            duration: "2 minutes, 13 seconds")
//
//    let video10_0 = Video(title: "KY Classroom - BIT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/10.0_THUMB.png?alt=media&token=74761026-40ff-4dfb-aa9a-906c3ad5622f",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/10.0_CLASSROOM_VOWELS_BIT.mp4?alt=media&token=9a1348b9-7d95-458e-bebd-5c3b97943d9e",
//                            duration: "0 minutes, 20 seconds")
//
//    let video10_1 = Video(title: "Listen - BIT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/10.1_THUMB.png?alt=media&token=3082d919-c1df-4355-b4a5-fcf3a2aa1d69",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/10.1_BIT_LISTEN.mp4?alt=media&token=70a5f4ac-54e0-425c-8246-19386cc43622",
//                            duration: "2 minutes, 37 seconds")
//
//    let video10_2 = Video(title: "Mimic - BIT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/10.2_THUMB.png?alt=media&token=b1afc0be-0d08-40ec-9680-23bcd90d9aab",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/10.2_BIT_MIMIC.mp4?alt=media&token=91363fdf-63f1-4642-b221-dba907300527",
//                            duration: "2 minutes, 36 seconds")
//
//    let video11_0 = Video(title: "KY Classroom - BET",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/11.0_THUMB.png?alt=media&token=6632ae58-c94a-4add-8e4c-9f7097dd3278",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/11.0_CLASSROOM_VOWELS_BET.mp4?alt=media&token=4f8fddf5-dca0-4845-a5dd-fd4915fd96ef",
//                            duration: "0 minutes, 6 seconds")
//
//    let video11_1 = Video(title: "Listen - BET",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/11.1_THUMB.png?alt=media&token=995ce334-5fda-4d57-8b61-36e58ea4b787",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/11.1_BET_LISTEN.mp4?alt=media&token=13239749-b881-4878-a4a6-35ca5acba41b",
//                            duration: "1 minute, 50 seconds")
//
//    let video11_2 = Video(title: "Mimic - BET",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/11.2_THUMB.png?alt=media&token=30858a96-52a4-4be8-9ee6-323145971b1b",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/11.2_BET_MIMIC.mp4?alt=media&token=5e942f35-6af7-411f-b5b2-db29a27327af",
//                            duration: "1 minute, 49 seconds")
//
//    let video12_0 = Video(title: "KY Classroom - BAIT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/12.0_THUMB.png?alt=media&token=73bbd17d-4400-4cb8-88b1-bec00cae0aab",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/12.0_CLASSROOM_VOWELS_BAIT.mp4?alt=media&token=9fd4cd57-5e53-4fac-9d8a-8d5c81869fd2",
//                            duration: "0 minutes, 25 seconds")
//
//    let video12_1 = Video(title: "Listen - BAIT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/12.1_THUMB.png?alt=media&token=7a0bc9c4-535d-4a6d-b555-2bbbf9022bf9",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/12.1_BAIT_LISTEN.mp4?alt=media&token=312525ad-c4e7-4ad3-9872-e5c942fb9dad",
//                            duration: "1 minute, 56 seconds")
//
//    let video12_2 = Video(title: "Mimic - BAIT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/12.2_THUMB.png?alt=media&token=cecd08ac-71ff-48f4-aa3c-c89ed3bd999e",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/12.2_BAIT_MIMIC.mp4?alt=media&token=5b91b694-920e-4920-a293-ab7a140790d6",
//                            duration: "1 minute, 55 seconds")
//
//    let video13_0 = Video(title: "KY Classroom - BITE",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/13.0_THUMB.png?alt=media&token=dec2a581-5748-45c6-80d6-c20bd6beadc6",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/13.0_CLASSROOM_VOWELS_BITE.mp4?alt=media&token=b342627a-ed0b-4565-a7b9-2892119f504a",
//                            duration: "0 minutes, 18 seconds")
//
//    let video13_1 = Video(title: "Listen - BITE",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/13.1_THUMB.png?alt=media&token=dfa39d61-e17c-4176-a721-f22c097ebe69",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/13.1_BITE_LISTEN.mp4?alt=media&token=e0b4cb47-634d-48d9-8f71-c5094697673c",
//                            duration: "2 minutes, 8 seconds")
//
//    let video13_2 = Video(title: "Mimic - BITE",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/13.2_THUMB.png?alt=media&token=7cadc2f3-e7a0-4364-bb44-c3db93328261",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/13.2_BITE_MIMIC.mp4?alt=media&token=57126d38-491c-42f9-a285-4f18b0ccf61f",
//                            duration: "2 minutes, 7 seconds")
//
//    let video14_0 = Video(title: "KY Classroom - BOAT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/14.0_THUMB.png?alt=media&token=d0788473-0e5f-4b77-9f3f-0a338f03fc2c",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/14.0_CLASSROOM_VOWELS_BOAT.mp4?alt=media&token=28a5c934-de58-425f-a934-fc122f22a826",
//                            duration: "0 minutes, 48 seconds")
//
//    let video14_1 = Video(title: "Listen - BOAT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/14.1_THUMB.png?alt=media&token=6b725d1f-51f0-462a-9ebc-772e785e57b1",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/14.1_BOAT_LISTEN.mp4?alt=media&token=1590ee2a-8032-4323-8792-ed12fea5a4f8",
//                            duration: "1 minute, 27 seconds")
//
//    let video14_2 = Video(title: "Mimic - BOAT",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/14.2_THUMB.png?alt=media&token=c70b453f-f3b2-4361-8499-a79f70fa285d",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/14.2_BOAT_MIMIC.mp4?alt=media&token=a888a9f3-ea73-4d3e-8fa0-53780ce736e1",
//                            duration: "1 minute, 26 seconds")
//
//    let video15_0 = Video(title: "KY Classroom - BOYD",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/15.0_THUMB.png?alt=media&token=66cfb19b-649b-4def-b39c-4210421ff420",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/15.0_CLASSROOM_VOWELS_BOYD.mp4?alt=media&token=8c453e2a-fae8-41d5-8262-5fb5543666c0",
//                            duration: "0 minutes, 16 seconds")
//
//    let video15_1 = Video(title: "Listen - BOYD",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/15.1_THUMB.png?alt=media&token=a67957d8-3280-4852-9d96-46e6c5967463",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/15.1_BOYD_LISTEN.mp4?alt=media&token=9586b6fc-3618-4090-93a7-3afe3ef46257",
//                            duration: "1 minute, 21 seconds")
//
//    let video15_2 = Video(title: "Mimic - BOYD",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/15.2_THUMB.png?alt=media&token=e82d8a4a-1e06-45b4-9222-123548114faa",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/15.2_BOYD_MIMIC.mp4?alt=media&token=3be11386-eb16-4013-b5f0-84c0c97feec3",
//                            duration: "1 minute, 20 seconds")
//
//    let video16_0 = Video(title: "Consonants Intro - True & Flip",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/16.0_THUMB.png?alt=media&token=6520eb3a-7cae-4550-9c78-b6940e890826",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/16.0_CLASSROOM_%20CONSONANTS_INTRO.mp4?alt=media&token=54bf607d-f4d6-4aea-ae91-834d0743bcae",
//                            duration: "3 minutes, 24 seconds")
//
//    let video17_0 = Video(title: "KY Classroom - B",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/17.0_THUMB.png?alt=media&token=b25fb82f-799f-4c36-8ad8-acad35c5b684",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/17.0_CLASSROOM_CONSONANTS%20B.mp4?alt=media&token=c6fcb9c1-1c81-48fe-b6b4-35c2778fb515",
//                            duration: "0 minutes, 10 seconds")
//
//    let video17_1 = Video(title: "Listen - True B",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/17.1_THUMB.png?alt=media&token=21cf934d-4365-4767-94d6-34d8253636cd",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/17.1_TRUE_B_LISTEN.mp4?alt=media&token=01e4c37b-50fb-4a41-bd38-6b1d0a16cb36",
//                            duration: "0 minutes, 46 seconds")
//
//    let video17_2 = Video(title: "Mimic - True B",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/17.2_THUMB.png?alt=media&token=46c515ee-29d7-40e8-bab6-035432de7a2f",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/17.2_TRUE_B_MIMIC.mp4?alt=media&token=a5b5609a-d1dc-4192-9a9f-3b21e3bb4e68",
//                            duration: "0 minutes, 45 seconds")
//
//    let video18_0 = Video(title: "KY Classroom - C",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.0_THUMB.png?alt=media&token=d2d2403e-5059-4284-bbd3-726037d0d140",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.0_CLASSROOM_CONSONANTS_C.mp4?alt=media&token=9ce3da08-2070-47ce-ba21-8ca9a784cdb4",
//                            duration: "0 minutes, 24 seconds")
//
//    let video18_1 = Video(title: "Listen - True C",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.1_THUMB.png?alt=media&token=ec4daa84-f827-4417-811f-bf1ed3e6d732",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.1_TRUE_C_LISTEN.mp4?alt=media&token=e548c4d5-28f8-42b1-bd09-209b3d5834c6",
//                            duration: "0 minutes, 46 seconds")
//
//    let video18_2 = Video(title: "Mimic - True C",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.2_THUMB.png?alt=media&token=c2432976-1881-4a42-8b51-e08e9ad8c58c",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.2_TRUE_C_MIMIC.mp4?alt=media&token=60ef9668-3e08-4804-b941-ee0d2930374a",
//                            duration: "0 minutes, 45 seconds")
//
//    let video18_3 = Video(title: "Listen - Flip C",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.3_THUMB.png?alt=media&token=bded8944-2488-4837-9962-776517fe7c57",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.3_FLIP_C_LISTEN.mp4?alt=media&token=5637d129-ff5e-41a9-af6b-d6818ff21422",
//                            duration: "0 minutes, 46 seconds")
//
//    let video18_4 = Video(title: "Mimic - Flip C",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.4_THUMB.png?alt=media&token=525c1643-6aac-4ab0-bf2c-732444df00de",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/18.4_FLIP_C_MIMIC.mp4?alt=media&token=e2d7c246-be7c-4cb3-ab69-f198048a5df2",
//                            duration: "0 minutes, 45 seconds")
//
//    let video19_0 = Video(title: "KY Classroom - D",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.0_THUMB.png?alt=media&token=30273af1-6d82-41e7-b0f1-216b6f861a5f",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.0_CLASSROOM_CONSONANTS_D.mp4?alt=media&token=03fdcd4b-7942-453e-ab6f-bf323e15833f",
//                            duration: "0 minutes, 23 seconds")
//
//    let video19_1 = Video(title: "Listen - True D",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.1_THUMB.png?alt=media&token=59fb740c-9a38-4679-8265-9d01d7a77dda",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.1_TRUE_D_LISTEN.mp4?alt=media&token=73381e62-1bc9-4d0b-b498-79971233676b",
//                            duration: "0 minutes, 46 seconds")
//
//    let video19_2 = Video(title: "Mimic - True D",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.2_THUMB.png?alt=media&token=aa175844-93cf-4dd5-bb06-07c7220e48ed",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.2_TRUE_D_MIMIC.mp4?alt=media&token=1d15b1d7-6c00-4e1a-a14d-b77d01e9085a",
//                            duration: "0 minutes, 45 seconds")
//
//    let video19_3 = Video(title: "Listen - Flip D",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.3_THUMB.png?alt=media&token=af2e6014-0ec7-4158-93bc-a867e180844e",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.3_FLIP_D_LISTEN.mp4?alt=media&token=167b4558-2873-4884-9ed7-4ae833c8f648",
//                            duration: "0 minutes, 46 seconds")
//
//    let video19_4 = Video(title: "Mimic - Flip D",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.4_THUMB.png?alt=media&token=5bb6683f-656a-4618-a3e1-0465e5015c5e",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/19.4_FLIP_D_MIMIC.mp4?alt=media&token=06e1f167-9dd7-4346-9907-d85e5d4a1087",
//                            duration: "0 minutes, 45 seconds")
//
//    let video20_0 = Video(title: "KY Classroom - F",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.0_THUMB.png?alt=media&token=95e7a9c9-3a8d-4a9f-9788-75ba6b874c0d",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.0_CLASSROOM_CONSONANTS_F.mp4?alt=media&token=94420078-c571-42ac-a94f-70fa8e494cb9",
//                            duration: "0 minutes, 57 seconds")
//
//    let video20_1 = Video(title: "Listen - True F",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.1_THUMB.png?alt=media&token=e8bcce99-c5e8-4d1c-8d89-448faa59f0f0",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.1_TRUE_F_LISTEN.mp4?alt=media&token=d456bf7f-ab1a-40f5-8446-96228962b794",
//                            duration: "0 minutes, 46 seconds")
//
//    let video20_2 = Video(title: "Mimic - True F",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.2_THUMB.png?alt=media&token=e05ae39c-e30c-4fa6-a7a8-176e762581c9",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.2_TRUE_F_MIMIC.mp4?alt=media&token=b48ad785-4961-4220-a2a4-39409a508475",
//                            duration: "0 minutes, 45 seconds")
//
//    let video20_3 = Video(title: "Listen - Flip F",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.3_THUMB.png?alt=media&token=5fe0d74e-54e9-42b1-8668-26c55242a41d",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.3_FLIP_F_LISTEN.mp4?alt=media&token=dc767408-f664-48c0-ae01-25be0e1b6bfb",
//                            duration: "0 minutes, 34 seconds")
//
//    let video20_4 = Video(title: "Mimic - Flip F",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.4_THUMB.png?alt=media&token=80c054a0-ec2f-47e0-9ea2-b5cfb7017f38",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/20.4_FLIP_F_MIMIC.mp4?alt=media&token=ea60fd30-19b3-4481-a77a-d7ccf5b2dad7",
//                            duration: "0 minutes, 33 seconds")
//
//    let video21_0 = Video(title: "KY Classroom - G",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/21.0_THUMB.png?alt=media&token=e4b9d0c0-a919-4bd5-8f42-5279b1a35d52",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/21.0_CLASSROOM_CONSONANTS_G.mp4?alt=media&token=1a78294b-a4d0-4903-9bd3-53c55c5097c1",
//                            duration: "0 minutes, 11 seconds")
//
//    let video21_1 = Video(title: "Listen - True G",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/21.1_THUMB.png?alt=media&token=0b982779-a5d5-46f9-a8a7-c29eb994d5d7",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/21.1_TRUE_G_LISTEN.mp4?alt=media&token=17ca4336-fbf5-43df-b7f0-544d9edb07b7",
//                            duration: "0 minutes, 46 seconds")
//
//    let video21_2 = Video(title: "Mimic - True G",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/21.2_THUMB.png?alt=media&token=39c0f5af-178a-455a-9cc0-27e16b71b364",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/21.2_TRUE_G_MIMIC.mp4?alt=media&token=c71e73d2-50f4-43bf-8d8e-bfc045d8bd1b",
//                            duration: "0 minutes, 45 seconds")
//
//    let video22_0 = Video(title: "KY Classroom - H",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/22.0_THUMB.png?alt=media&token=f4d4ec38-7080-4e35-903f-debe6ce05665",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/22.0_CLASSROOM_CONSONANTS_H.mp4?alt=media&token=5a1f9777-7c0d-4936-ba04-188cf3ddbf8a",
//                            duration: "0 minutes, 15 seconds")
//
//    let video22_1 = Video(title: "Listen - True H",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/22.1_THUMB.png?alt=media&token=a95b0252-e0d0-41d2-960e-1df13903f657",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/22.1_TRUE_H_LISTEN.mp4?alt=media&token=802d4097-8673-4fa8-9baa-cf6ca57bde69",
//                            duration: "0 minutes, 42 seconds")
//
//
//    let video22_2 = Video(title: "Mimic - True H",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/22.2_THUMB.png?alt=media&token=d409340d-5e4a-476e-a067-0889d0c1102d",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/22.2_TRUE_H_MIMIC.mp4?alt=media&token=ab7d3c11-964e-4897-8b87-eb4d0ee91221",
//                            duration: "0 minutes, 41 seconds")
//
//    let video23_0 = Video(title: "KY Classroom - K",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/23.0_THUMB.png?alt=media&token=029d0583-2d66-4ecf-9d80-cd568027661a",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/23.0_CLASSROOM_CONSONANTS_K.mp4?alt=media&token=c4e20afb-d783-4c17-a4bb-fa4a9359dda8",
//                            duration: "0 minutes, 12 seconds")
//
//    let video23_1 = Video(title: "Listen - True K",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/23.1_THUMB.png?alt=media&token=fdb8fdf5-5090-47ab-9138-0d6f88710af2",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/23.1_TRUE_K_LISTEN.mp4?alt=media&token=d32cfb6c-948d-4926-a638-02d15bd725e2",
//                            duration: "0 minutes, 49 seconds")
//
//    let video23_2 = Video(title: "Mimic - True K",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/23.2_THUMB.png?alt=media&token=cee8fbe4-632f-40ad-81a4-7f477731891d",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/23.2_TRUE_K_MIMIC.mp4?alt=media&token=8ea65fc3-8d94-4fac-80e9-c8e1c7b76728",
//                            duration: "0 minutes, 48 seconds")
//
//    let video24_0 = Video(title: "KY Classroom - L",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.0_THUMB.png?alt=media&token=c3e28d7a-54e5-4158-b924-5217cb3d37e4",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.0_CLASSROOM_CONSONANTS_L.mp4?alt=media&token=e0ae54ba-5a00-4cf0-8d7f-9cdf7716e50d",
//                            duration: "1 minute, 24 seconds")
//
//    let video24_1 = Video(title: "Listen - True L",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.1_THUMB.png?alt=media&token=f19e55d5-ac3a-4c46-aedc-4c249da620b7",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.1_TRUE_L_LISTEN.mp4?alt=media&token=902fe1a6-bd25-4cf5-877d-bd79c3718deb",
//                            duration: "0 minutes, 46 seconds")
//
//    let video24_2 = Video(title: "Mimic - True L",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.2_THUMB.png?alt=media&token=3663d014-602f-4dde-8b5b-6ac98c285fec",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.2_TRUE_L_MIMIC.mp4?alt=media&token=471e0e69-c463-44a7-938a-1457d2c8626c",
//                            duration: "0 minutes, 45 seconds")
//
//    let video24_3 = Video(title: "Listen - Flip L",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.3_THUMB.png?alt=media&token=6fe0f255-513b-4a81-bc90-7a6c43cce09b",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.3_FLIP_L_LISTEN.mp4?alt=media&token=82aca982-f24b-40b1-ac7f-fc5d16e2b9f8",
//                            duration: "0 minutes, 46 seconds")
//
//    let video24_4 = Video(title: "Mimic - Flip L",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.4_THUMB.png?alt=media&token=d62efca5-3f9a-4f98-91f5-cea3a65d86be",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/24.4_FLIP_L_MIMIC.mp4?alt=media&token=f4009e76-dcb2-4693-b49c-0ca2b0ffb372",
//                            duration: "0 minutes, 45 seconds")
//
//    let video25_0 = Video(title: "KY Classroom - M",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/25.0_THUMB.png?alt=media&token=ea3cbef5-a013-4dd4-b5d8-42514fcafa4b",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/25.0_CLASSROOM_CONSONANTS_M.mp4?alt=media&token=537e705f-a443-469f-941f-87d2ddd10065",
//                            duration: "0 minutes, 7 seconds")
//
//    let video25_1 = Video(title: "Listen - True M",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/25.1_THUMB.png?alt=media&token=35b39687-1b60-4e2b-8cb3-4ab0f904214a",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/25.1_TRUE_M_LISTEN.mp4?alt=media&token=0a418343-ee8b-479e-8a13-84f8f6883e94",
//                            duration: "0 minutes, 46 seconds")
//
//    let video25_2 = Video(title: "Mimic - True M",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/25.2_THUMB.png?alt=media&token=92caee28-36fe-41da-a82b-834505608581",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/25.2_TRUE_M_MIMIC.mp4?alt=media&token=cee2af04-b3a7-473e-ab60-3af8b61cf0a5",
//                            duration: "0 minutes, 45 seconds")
//
//    let video26_0 = Video(title: "KY Classroom - N",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.0_THUMB.png?alt=media&token=fab14f45-e8ae-4f67-8020-c48542d78945",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.0_CLASSROOM_CONSONANTS_N.mp4?alt=media&token=45df793f-1519-40f5-b73c-52b70f0f7d52",
//                            duration: "0 minutes, 44 seconds")
//
//    let video26_1 = Video(title: "Listen - True N",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.1_THUMB.png?alt=media&token=5c3df39d-97cd-4b13-8d51-e4538c7d899e",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.1_TRUE_N_LISTEN.mp4?alt=media&token=72edbbbb-9936-45b1-be24-6b5fbe0469a7",
//                            duration: "0 minutes, 46 seconds")
//
//
//    let video26_2 = Video(title: "Mimic - True N",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.2_THUMB.png?alt=media&token=778e7af7-3177-4d06-ae78-c92369ae22ae",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.2_TRUE_N_MIMIC.mp4?alt=media&token=a9747de7-a3a9-4a04-8e05-9ad4e44c3194",
//                            duration: "0 minutes, 45 seconds")
//
//    let video26_3 = Video(title: "Listen - Flip N",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.3_THUMB.png?alt=media&token=010a6c09-8949-4376-b026-71398d82e883",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.3_FLIP_N_LISTEN.mp4?alt=media&token=d07b5fc6-1cac-4406-b884-b08874d8f70e",
//                            duration: "0 minutes, 46 seconds")
//
//    let video26_4 = Video(title: "Mimic - Flip N",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.4_THUMB.png?alt=media&token=61b6349b-2150-4e00-85ac-3a15998891d3",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/26.4_FLIP_N_MIMIC.mp4?alt=media&token=2b75de06-4959-4dfd-9dad-d6bdc328c22a",
//                            duration: "0 minutes, 45 seconds")
//
//    let video27_0 = Video(title: "KY Classroom - P",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/27.0_THUMB.png?alt=media&token=8a3ccaa3-92db-4239-b265-d5d3ac55b70e",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/27.0_CLASSROOM_CONSONANTS_P.mp4?alt=media&token=4dcece48-f9ea-4f53-934c-3e06dff5888b",
//                            duration: "0 minutes, 27 seconds")
//
//    let video27_1 = Video(title: "Listen - True P",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/27.1_THUMB.png?alt=media&token=0f631ca2-30c1-4247-acd0-700e62626fd4",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/27.1_TRUE_P_LISTEN.mp4?alt=media&token=6b38bb4a-bc8d-4043-80a7-a29a8500f881",
//                            duration: "0 minutes, 46 seconds")
//
//    let video27_2 = Video(title: "Mimic - True P",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/27.2_THUMB.png?alt=media&token=2735bfa3-ef9b-4383-a161-7f64ed39ae45",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/27.2_TRUE_P_MIMIC.mp4?alt=media&token=8ed69f4d-1be9-4186-951f-56506485de3b",
//                            duration: "0 minutes, 45 seconds")
//
//    let video28_0 = Video(title: "KY Classroom - QU",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/28.0_THUMB.png?alt=media&token=1cf78682-e16d-4664-ac36-1695a077caf7",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/28.0_CLASSROOM_CONSONANTS_Qu.mp4?alt=media&token=2c516122-d7bc-4fa8-b4d3-ba27b77e3d3a",
//                            duration: "0 minutes, 29 seconds")
//
//    let video28_1 = Video(title: "Listen - QU",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/28.1_THUMB.png?alt=media&token=527b0364-9608-4af9-84fe-c25ac70bebdf",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/28.1_TRUE_QU_LISTEN.mp4?alt=media&token=2e4ecc4a-c092-4a47-afa1-37b0396e7d9c",
//                            duration: "0 minutes, 46 seconds")
//
//    let video28_2 = Video(title: "Mimic - QU",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/28.2_THUMB.png?alt=media&token=81beba2c-60d7-454a-8cbb-deea1be9cd22",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/28.2_TRUE_QU_MIMIC.mp4?alt=media&token=fa95e6df-a7ce-4bbb-bf16-a3b6e59f149b",
//                            duration: "0 minutes, 45 seconds")
//
//    let video29_0 = Video(title: "KY Classroom - R",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.0_THUMB.png?alt=media&token=2b7598ca-104e-43d5-a726-9a45a6e85a31",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.0_CLASSROOM_CONSONANTS_R.mp4?alt=media&token=be9534b5-60fc-4ca2-acb7-5d732e3dc119",
//                            duration: "0 minutes, 56 seconds")
//
//    let video29_1 = Video(title: "Listen - True R",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.1_THUMB.png?alt=media&token=d8d02b5e-e721-46d1-b02f-04305954ea9e",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.1_TRUE_R_LISTEN.mp4?alt=media&token=dd976385-ffc2-4822-84e7-5b3e5b09aa71",
//                            duration: "0 minutes, 40 seconds")
//
//    let video29_2 = Video(title: "Mimic - True R",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.2_THUMB.png?alt=media&token=56dcf55d-c6ac-4d76-948e-107a797ce2bc",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.2_TRUE_R_MIMIC.mp4?alt=media&token=b9552298-3400-48aa-b037-7b11eca4c4b0",
//                            duration: "0 minutes, 39 seconds")
//
//    let video29_3 = Video(title: "Listen - Flip R",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.3_THUMB.png?alt=media&token=6fb9347c-4655-4f82-af19-1a6369666195",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.3_FLIP_R_LISTEN.mp4?alt=media&token=a98ff012-cf4d-4eb0-a81e-3d3087024547",
//                            duration: "0 minutes, 46 seconds")
//
//    let video29_4 = Video(title: "Mimic - Flip R",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.4_THUMB.png?alt=media&token=bb494280-476b-43d0-9830-6d996fb3bf81",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/29.4_FLIP_R_MIMIC.mp4?alt=media&token=82c197cd-60fd-4fe4-a81d-3e2e0c26479b",
//                            duration: "0 minutes, 45 seconds")
//
//    let video30_0 = Video(title: "KY Classroom - S",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.0_THUMB.png?alt=media&token=82a09a39-a4c1-4cbc-b9e6-647a07ef0a74",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.0_CLASSROOM_CONSONANTS_S.mp4?alt=media&token=2de61bd0-6be8-43fb-a43c-fa096190322b",
//                            duration: "0 minutes, 30 seconds")
//
//    let video30_1 = Video(title: "Listen - True S",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.1_THUMB.png?alt=media&token=0d8ae29b-c049-4258-a24d-c825f922f025",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.1_TRUE_S_LISTEN.mp4?alt=media&token=6b3357a2-9153-47e3-bc93-72a171bc0830",
//                            duration: "0 minutes, 46 seconds")
//
//    let video30_2 = Video(title: "Mimic - True S",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.2_THUMB.png?alt=media&token=cde472ee-3586-4a66-95d7-bb9901318bb8",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.2_TRUE_S_MIMIC.mp4?alt=media&token=ccb73f7c-b00a-41f4-ac89-f9d5e140650b",
//                            duration: "0 minutes, 45 seconds")
//
//    let video30_3 = Video(title: "Listen - Flip S",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.3_THUMB.png?alt=media&token=540e1a26-721a-44fc-99c8-cb8cc39b917a",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.3_FLIP_S_LISTEN.mp4?alt=media&token=dba6085d-9486-4ccc-af4d-ad847a0fab5d",
//                            duration: "0 minutes, 46 seconds")
//
//    let video30_4 = Video(title: "Mimic - Flip S",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.4_THUMB.png?alt=media&token=571db319-028e-4337-8390-9785dfb0a553",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/30.4_FLIP_S_MIMIC.mp4?alt=media&token=1e8c40ad-91f3-471a-b046-c221fcf7af2c",
//                            duration: "0 minutes, 45 seconds")
//
//    let video31_0 = Video(title: "KY Classroom - T",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.0_THUMB.png?alt=media&token=fe41ca28-f503-4571-9ebb-e2fd67be9533",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.0_CLASSROOM_CONSONANTS_T.mp4?alt=media&token=a0dd4175-145a-4e22-8795-096f2e509b45",
//                            duration: "0 minutes, 25 seconds")
//
//    let video31_1 = Video(title: "Listen - True T",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.1_THUMB.png?alt=media&token=29fe2f5d-dc43-4376-a0ae-56563911c7ed",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.1_TRUE_T_LISTEN.mp4?alt=media&token=6a57104b-160d-4f2a-ace4-9161f563397e",
//                            duration: "0 minutes, 46 seconds")
//
//    let video31_2 = Video(title: "Mimic - True T",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.2_THUMB.png?alt=media&token=ba2bc6d4-805b-48f4-a434-4a11fe79be83",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.2_TRUE_T_MIMIC.mp4?alt=media&token=3c4a1e60-563f-4d4a-8921-7684128691b1",
//                            duration: "0 minutes, 45 seconds")
//
//    let video31_3 = Video(title: "Listen - Flip T",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.3_THUMB.png?alt=media&token=b81c3339-690e-48ea-b3c5-ee724da53a30",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.3_FLIP_T_LISTEN.mp4?alt=media&token=fbe9c68b-21c2-42ad-82d8-9e9df0e76c91",
//                            duration: "0 minutes, 46 seconds")
//
//    let video31_4 = Video(title: "Mimic - Flip T",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.4_THUMB.png?alt=media&token=e230d8a3-f1af-4823-b3c1-1ec4bff9c736",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/31.4_FLIP_T_MIMIC.mp4?alt=media&token=a4b5de6d-e513-4c51-af61-4d2687ed2539",
//                            duration: "0 minutes, 45 seconds")
//
//    let video32_0 = Video(title: "KY Classroom - TH",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.0_THUMB.png?alt=media&token=e3996625-41dc-4268-b1f0-e644274b4fea",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.0_CLASSROOM_CONSONANTS_Th.mp4?alt=media&token=df2bbd38-80cb-443c-9622-38a219e26f3a",
//                            duration: "1 minute, 1 second")
//
//    let video32_1 = Video(title: "Listen - True TH",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.1_THUMB.png?alt=media&token=6198ef57-c379-410f-934e-7ac752ac2680",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.1_TRUE_TH_LISTEN.mp4?alt=media&token=a4cf06b9-6bf8-4a32-8ba9-eee84053d36c",
//                            duration: "0 minutes, 46 seconds")
//
//    let video32_2 = Video(title: "Mimic - True TH",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.2_THUMB.png?alt=media&token=0bc9e59e-ed5c-4241-9d12-ad61b2b53a17",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.2_TRUE_TH_MIMIC.mp4?alt=media&token=ab072541-ffe2-45df-a7f8-dcb0455b3875",
//                            duration: "0 minutes, 45 seconds")
//
//    let video32_3 = Video(title: "Listen - Flip TH",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.3_THUMB.png?alt=media&token=1bcbe40f-b301-4c4f-9541-37b2ab1aab42",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.3_FLIP_TH_LISTEN.mp4?alt=media&token=fc79233f-0570-425f-9064-ff5efe71a79d",
//                            duration: "0 minutes, 46 seconds")
//
//    let video32_4 = Video(title: "Mimic - Flip TH",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.4_THUMB.png?alt=media&token=63f0f104-b615-463d-9be6-35bc8510ac19",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/32.4_FLIP_TH_MIMIC.mp4?alt=media&token=4ed95d8f-f23a-4bb6-a3b4-831af7edb912",
//                            duration: "0 minutes, 45 seconds")
//
//    let video33_0 = Video(title: "KY Classroom - V",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/33.0_THUMB.png?alt=media&token=9c371e10-1b2f-4da0-8f68-0c9ac0ead5e0",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/33.0_CLASSROOM_CONSONANTS_V.mp4?alt=media&token=b42c77c2-b1d0-44a1-8acb-b1a3abfb942a",
//                            duration: "0 minutes, 33 seconds")
//
//    let video33_1 = Video(title: "Listen - True V",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/33.1_THUMB.png?alt=media&token=5cfa6230-d7af-401e-a282-bdf9357682ee",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/33.1_TRUE_V_LISTEN.mp4?alt=media&token=3163a346-8c87-4507-a477-73f2a5ecf881",
//                            duration: "0 minutes, 46 seconds")
//
//    let video33_2 = Video(title: "Mimic - True V",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/33.2_THUMB.png?alt=media&token=035bcc63-a328-4296-84f3-989778937305",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/33.2_TRUE_V_MIMIC.mp4?alt=media&token=09ece034-44ca-42c0-a3a1-a5f5742f06aa",
//                            duration: "0 minutes, 45 seconds")
//
//    let video34_0 = Video(title: "KY Classroom - W",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/34.0_THUMB.png?alt=media&token=ec15c31f-8e5f-4a8c-a9f2-1f016092948e",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/34.0_CLASSROOM_CONSONANTS_W.mp4?alt=media&token=905d8b58-a61b-45bb-a784-ebac013eab8b",
//                            duration: "0 minutes, 41 seconds")
//
//    let video34_1 = Video(title: "Listen - True W",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/34.1_THUMB.png?alt=media&token=ada2709f-c519-4065-bb6d-a16b45840a24",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/34.1_TRUE_W_LISTEN.mp4?alt=media&token=21446aec-d758-40f1-8890-1d8ec8dba09b",
//                            duration: "0 minutes, 46 seconds")
//
//    let video34_2 = Video(title: "Mimic - True W",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/34.2_THUMB.png?alt=media&token=9dff2e98-ee7f-4fc2-beb7-6c4661f0d42e",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/34.2_TRUE_W_MIMIC.mp4?alt=media&token=7ed423a6-a4bf-4c02-b107-d1b7c7933678",
//                            duration: "0 minutes, 45 seconds")
//
//    let video35_0 = Video(title: "KY Classroom - X",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.0_THUMB.png?alt=media&token=e56be045-9482-45be-b608-4425a6dda646",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.0_CLASSROOM_CONSONANTS_X.mp4?alt=media&token=a4bf2b13-4759-4722-a3a0-6f362fdc3223",
//                            duration: "0 minutes, 34 seconds")
//
//    let video35_1 = Video(title: "Listen - True X",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.1_THUMB.png?alt=media&token=00a3f17e-ef9f-43ef-b404-9cc8f14cfbd3",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.1_TRUE_X_LISTEN.mp4?alt=media&token=a241e7b4-9472-4c6f-bb66-e0101fb66792",
//                            duration: "0 minutes, 40 seconds")
//
//    let video35_2 = Video(title: "Mimic - True X",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.2_THUMB.png?alt=media&token=b9eac94c-96da-4bb1-b609-886160dfb217",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.2_TRUE_X_MIMIC.mp4?alt=media&token=28ffea5a-9209-46e4-8659-5ec1417be69f",
//                            duration: "0 minutes, 39 seconds")
//
//    let video35_3 = Video(title: "Listen - Flip X",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.3_THUMB.png?alt=media&token=7dd42241-77ed-4a96-9a7b-a115faf01d1c",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.3_FLIP_X_LISTEN.mp4?alt=media&token=4ca3ce74-b64a-4045-9825-bccf774706b7",
//                            duration: "0 minutes, 46 seconds")
//
//    let video35_4 = Video(title: "Mimic - Flip X",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.4_THUMB.png?alt=media&token=ed4ec495-5721-4adc-8fd2-95a8fbbfcb5e",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/35.4_FLIP_X_MIMIC.mp4?alt=media&token=e9d0dbb8-0d02-4217-a3d3-38d16af05e04",
//                            duration: "0 minutes, 45 seconds")
//
//    let video36_0 = Video(title: "KY Classroom - Z",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.0_THUMB.png?alt=media&token=881bf411-9f65-4ccd-bf55-56c63fec2b10",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.0_CLASSROOM_CONSONANTS_Z.mp4?alt=media&token=676ebb5a-8e8a-4768-9a6a-8bfc36ee6c97",
//                            duration: "0 minutes, 22 seconds")
//
//    let video36_1 = Video(title: "Listen - True Z",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.1_THUMB.png?alt=media&token=12e138f0-12df-4259-b88c-1535935b81ad",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.1_TRUE_Z_LISTEN.mp4?alt=media&token=dcebd5a4-f116-4508-9192-d786ae5f3d07",
//                            duration: "0 minutes, 46 seconds")
//
//    let video36_2 = Video(title: "Mimic - True Z",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.2_THUMB.png?alt=media&token=33b63f9d-ad7d-4cd6-846e-9c4b7a2b0519",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.2_TRUE_Z_MIMIC.mp4?alt=media&token=dcbb4a18-14ef-4267-a421-ac13e223e907",
//                            duration: "0 minutes, 45 seconds")
//
//    let video36_3 = Video(title: "Listen - Flip Z",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.3_THUMB.png?alt=media&token=c047fb93-f757-4437-be87-caac1679d8fa",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.3_FLIP_Z_LISTEN.mp4?alt=media&token=6e6442c8-40c3-469d-9c96-5aed0bd9aca3",
//                            duration: "0 minutes, 46 seconds")
//
//    let video36_4 = Video(title: "Mimic - Flip Z",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.4_THUMB.png?alt=media&token=494e632c-0e0e-46bb-a0db-99a07615aff4",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/36.4_FLIP_Z_MIMIC.mp4?alt=media&token=f8c394e0-813d-4126-ae82-c56449111c70",
//                            duration: "0 minutes, 45 seconds")
//
//    let video37_0 = Video(title: "Consonants Intro - Fluid",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/37.0_THUMB.png?alt=media&token=61a91c23-67f5-4890-b81f-996caf1e8d15",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/37.0_CLASSROOM_FLUID_INTRO.mp4?alt=media&token=6750c375-d2f7-47f5-97be-7d8a54557e4a",
//                            duration: "0 minutes, 41 seconds")
//
//    let video38_0 = Video(title: "KY Classroom - MISSION",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/38.0_THUMB.png?alt=media&token=2264338c-140e-4e4f-a29a-85949a340f55",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/38.0_CLASSROOM_FLUID_MISSION.mp4?alt=media&token=f17c3664-cdb0-43b3-afd3-bfb6b5d7e0bd",
//                            duration: "0 minutes, 15 seconds")
//
//    let video38_1 = Video(title: "Listen - MISSION",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/38.1_THUMB.png?alt=media&token=b45ca0af-aae4-40b8-b368-28d1dc7107ad",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/38.1_FLUID_MISSION_LISTEN.mp4?alt=media&token=e4d35e28-079b-45a3-b281-d3dd310bf30c",
//                            duration: "1 minute, 33 seconds")
//
//    let video38_2 = Video(title: "Mimic - MISSION",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/38.2_THUMB.png?alt=media&token=d7b78ff7-fe3e-4d6c-a949-675f29d485d9",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/38.2_FLUID_MISSION_MIMIC.mp4?alt=media&token=7bc78806-0cb9-4240-aea2-d7225a6ff134",
//                            duration: "1 minute, 32 seconds")
//
//    let video39_0 = Video(title: "KY Classroom - VISION",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/39.0_THUMB.png?alt=media&token=fb564ff9-4115-46b7-be5c-f45c2d1aff7a",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/39.0_CLASSROOM_FLUID_VISION.mp4?alt=media&token=b249f64a-14ab-4eb4-bad6-8805680fb280",
//                            duration: "0 minutes, 38 seconds")
//
//    let video39_1 = Video(title: "Listen - VISION",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/39.1_THUMB.png?alt=media&token=84a87032-b1e6-490f-b6bd-0d60dd878101",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/39.1_FLUID_VISION_LISTEN.mp4?alt=media&token=d1e7bc3f-979f-468c-9410-10e2af27bb84",
//                            duration: "1 minute, 15 seconds")
//
//    let video39_2 = Video(title: "Mimic - VISION",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/39.2_THUMB.png?alt=media&token=80013912-d98e-4261-aa7b-30d51b921fca",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/39.2_FLUID_VISION_MIMIC.mp4?alt=media&token=143dbec9-6dc2-4261-a0ab-0676cd968521",
//                            duration: "1 minute, 14 seconds")
//
//    let video40_0 = Video(title: "KY Classroom - CHOKE",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/40.0_THUMB.png?alt=media&token=9b42132b-f624-495f-8341-1e7a15b6e277",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/40.0_CLASSROOM_FLUID_CHOKE.mp4?alt=media&token=a9980e97-2522-4ed0-b15f-8713936a5d7b",
//                            duration: "0 minutes, 14 seconds")
//
//    let video40_1 = Video(title: "Listen - CHOKE",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/40.1_THUMB.png?alt=media&token=44135188-1c1b-49b9-b2fa-98b9b52b18b1",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/40.1_FLUID_CHOKE_LISTEN.mp4?alt=media&token=330754ea-b571-420b-bb1f-80fa9872e6de",
//                            duration: "1 minute, 27 seconds")
//
//    let video40_2 = Video(title: "Mimic - CHOKE",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/40.2_THUMB.png?alt=media&token=85c21a38-9338-41de-ae68-29508adca440",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/40.2_FLUID_CHOKE_MIMIC.mp4?alt=media&token=488fb3b3-8fe6-4f38-bab1-bd159ea0425a",
//                            duration: "1 minute, 26 seconds")
//
//    let video41_0 = Video(title: "KY Classroom - JOKE",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/41.0_THUMB.png?alt=media&token=ca31a95a-3ea3-4541-b0ee-76540ea76642",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/41.0_CLASSROOM_FLUID_JOKE.mp4?alt=media&token=5177caf1-9a75-4798-ac97-2f4b1a9f8c19",
//                            duration: "0 minutes, 20 seconds")
//
//    let video41_1 = Video(title: "Listen - JOKE",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/41.1_THUMB.png?alt=media&token=c03497fe-81a2-49be-8cf3-81b58c03192a",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/41.1_FLUID_JOKE_LISTEN.mp4?alt=media&token=9574dcf9-b730-4e8f-815a-3ed4e83f5be8",
//                            duration: "1 minute, 33 seconds")
//
//    let video41_2 = Video(title: "Mimic - JOKE",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/41.2_THUMB.png?alt=media&token=a93c4d01-bbdb-4d17-b29f-1010bb70a580",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/41.2_FLUID_JOKE_MIMIC.mp4?alt=media&token=8b652453-ee6f-47d3-967e-4b6e66e9f869",
//                            duration: "1 minute, 32 seconds")
//
//    let video42_0 = Video(title: "KY Classroom - YOU",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/42.0_THUMB.png?alt=media&token=2b4799b9-5e61-4ca4-a748-a87d94fe5dcb",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/42.0_CLASSROOM_FLUID_YOKE.mp4?alt=media&token=34b04069-7a18-407b-8820-03dfd6877f2b",
//                            duration: "0 minutes, 40 seconds")
//
//    let video42_1 = Video(title: "Listen - YOU",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/42.1_THUMB.png?alt=media&token=43b88b5d-d3e8-4f17-9b54-74a374c02b4b",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/42.1_FLUID_YOKE_LISTEN.mp4?alt=media&token=65be0744-6e07-4b93-958e-d8518ac85674",
//                            duration: "1 minute, 39 seconds")
//
//    let video42_2 = Video(title: "Mimic - YOU",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/42.2_THUMB.png?alt=media&token=32f9b977-6e5f-4411-819d-a26827fdb0c0",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/42.2_FLUID_YOKE_MIMIC.mp4?alt=media&token=a06463ce-882e-4ad9-9282-88104c4feed2",
//                            duration: "1 minute, 38 seconds")
//
//    let video43_0 = Video(title: "KY Classroom - Silents",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/43.0_THUMB.png?alt=media&token=4a6e87a4-9d7b-4ac8-94ab-aebd60b480d8",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/43.0_CLASSROOM_SILENT.mp4?alt=media&token=8a6924bf-5251-4e31-9665-45ccbe3736d0",
//                            duration: "0 minutes, 32 seconds")
//
//    let video43_1 = Video(title: "Listen - Silents",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/43.1_THUMB.png?alt=media&token=567a075d-efb7-4c49-94e3-011b83aa35a4",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/43.1_SILENT_LISTEN.mp4?alt=media&token=775bc249-5afa-405b-b779-e7868d730a45",
//                            duration: "0 minutes, 41 seconds")
//
//    let video43_2 = Video(title: "Mimic - Silents",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/43.2_THUMB.png?alt=media&token=a5dba091-c36f-4ca0-b048-cb998237512f",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/43.2_SILENT_MIMIC.mp4?alt=media&token=1ff7b955-5834-411b-a879-f896ea7c1b8b",
//                            duration: "0 minutes, 40 seconds")
//
//    let video44_0 = Video(title: "KY Classroom - Wildcards",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/44.0_THUMB.png?alt=media&token=97abb1a9-37f9-46e2-8bd5-85c986f13e34",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/44.0_CLASSROOM_WILDCARDS.mp4?alt=media&token=f2ce4cce-ddad-4b2a-be9d-801e54b62140",
//                            duration: "1 minutes, 21 seconds")
//
//    let video45_0 = Video(title: "KY Classroom - AN & AM",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/45.0_THUMB.png?alt=media&token=ff23670b-c8f3-473d-b567-11ae46ba1ab7",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/45.0_BONUS_AN_AM.mp4?alt=media&token=802da2c7-a34c-41c7-9881-d2c3a901c29e",
//                            duration: "1 minute, 32 seconds")
//
//    let video45_1 = Video(title: "KY Classroom - L & R",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/45.1_THUMB.png?alt=media&token=92fde0eb-8f0b-441b-a5f7-dc7de6afb0b0",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/45.1_BONUS_L%26R.mp4?alt=media&token=422e3fdc-3fea-469d-9a0e-f0233d52d3de",
//                            duration: "1 minute, 13 seconds")
//
//    let video45_2 = Video(title: "KY Classroom - R Colored Vowels",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/45.2_THUMB.png?alt=media&token=eebf0fb9-bb92-451c-b9f5-7eb21567b08d",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/45.2_BONUS_R_COLORED_VOWELS.mp4?alt=media&token=8a7388d3-d606-461f-a1e0-a304fee63467",
//                            duration: "2 minutes, 0 seconds")
//
//    let video46_0 = Video(title: "Summary",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/46.0_THUMB.png?alt=media&token=c99b6a44-d7b6-4eb4-9970-1cdb4c8ea1c7",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/46.0_OUTRO.mp4?alt=media&token=f438cb4b-2a7d-4e5d-9a9f-536d33038ffc",
//                            duration: "0 minutes, 56 seconds")
//
//    let section_1 = Section(
//        title: "Introduction",
//        videos: [video1_0, video1_1, video1_2, video1_3, video1_4]
//    )
//
//    let section_2 = Section(
//        title: "Vowels",
//        videos: [video2_0]
//    )
//
//    let section_3 = Section(
//        title: "BOT",
//        videos: [video3_0, video3_1, video3_2]
//    )
//
//    let section_4 = Section(
//        title: "BAT",
//        videos: [video4_0, video4_1, video4_2]
//    )
//
//    let section_5 = Section(
//        title: "BOUT",
//        videos: [video5_0, video5_1, video5_2]
//    )
//
//    let section_6 = Section(
//        title: "BOOT",
//        videos: [video6_0, video6_1, video6_2]
//    )
//
//    let section_7 = Section(
//        title: "BUT",
//        videos: [video7_0, video7_1, video7_2]
//    )
//
//    let section_8 = Section(
//        title: "BOOK",
//        videos: [video8_0, video8_1, video8_2]
//    )
//
//    let section_9 = Section(
//        title: "BEAT",
//        videos: [video9_0, video9_1, video9_2]
//    )
//
//    let section_10 = Section(
//        title: "BIT",
//        videos: [video10_0, video10_1, video10_2]
//    )
//
//    let section_11 = Section(
//        title: "BET",
//        videos: [video11_0, video11_1, video11_2]
//    )
//
//    let section_12 = Section(
//        title: "BAIT",
//        videos: [video12_0, video12_1, video12_2]
//    )
//
//    let section_13 = Section(
//        title: "BITE",
//        videos: [video13_0, video13_1, video13_2]
//    )
//
//    let section_14 = Section(
//        title: "BOAT",
//        videos: [video14_0, video14_1, video14_2]
//    )
//
//    let section_15 = Section(
//        title: "BOYD",
//        videos: [video15_0, video15_1, video15_2]
//    )
//
//    let section_16 = Section(
//        title: "True & Flip Consonants",
//        videos: [video16_0]
//    )
//
//    let section_17 = Section(
//        title: "B",
//        videos: [video17_0, video17_1, video17_2]
//    )
//
//    let section_18 = Section(
//        title: "C",
//        videos: [video18_0, video18_1, video18_2, video18_3, video18_4]
//    )
//
//    let section_19 = Section(
//        title: "D",
//        videos: [video19_0, video19_1, video19_2, video19_3, video19_4]
//    )
//
//    let section_20 = Section(
//        title: "F",
//        videos: [video20_0, video20_1, video20_2, video20_3, video20_4]
//    )
//
//    let section_21 = Section(
//        title: "G",
//        videos: [video21_0, video21_1, video21_2]
//    )
//
//    let section_22 = Section(
//        title: "H",
//        videos: [video22_0, video22_1, video22_2]
//    )
//
//    let section_23 = Section(
//        title: "K",
//        videos: [video23_0, video23_1, video23_2]
//    )
//
//    let section_24 = Section(
//        title: "L",
//        videos: [video24_0, video24_1, video24_2, video24_3, video24_4]
//    )
//
//    let section_25 = Section(
//        title: "M",
//        videos: [video25_0, video25_1, video25_2]
//    )
//
//    let section_26 = Section(
//        title: "N",
//        videos: [video26_0, video26_1, video26_2, video26_3, video26_4]
//    )
//
//    let section_27 = Section(
//        title: "P",
//        videos: [video27_0, video27_1, video27_2]
//    )
//
//    let section_28 = Section(
//        title: "QU",
//        videos: [video28_0, video28_1, video28_2]
//    )
//
//    let section_29 = Section(
//        title: "R",
//        videos: [video29_0, video29_1, video29_2, video29_3, video29_4]
//    )
//
//    let section_30 = Section(
//        title: "S",
//        videos: [video30_0, video30_1, video30_2, video30_3, video30_4]
//    )
//
//    let section_31 = Section(
//        title: "T",
//        videos: [video31_0, video31_1, video31_2, video31_3, video31_4]
//    )
//
//    let section_32 = Section(
//        title: "TH",
//        videos: [video32_0, video32_1, video32_2, video32_3, video32_4]
//    )
//
//    let section_33 = Section(
//        title: "V",
//        videos: [video33_0, video33_1, video33_2]
//    )
//
//    let section_34 = Section(
//        title: "W",
//        videos: [video34_0, video34_1, video34_2]
//    )
//
//    let section_35 = Section(
//        title: "X",
//        videos: [video35_0, video35_1, video35_2, video35_3, video35_4]
//    )
//
//    let section_36 = Section(
//        title: "Z",
//        videos: [video36_0, video36_1, video36_2, video36_3, video36_4]
//    )
//
//    let section_37 = Section(
//        title: "Fluid Consonants",
//        videos: [video37_0]
//    )
//
//    let section_38 = Section(
//        title: "MISSION",
//        videos: [video38_0, video38_1, video38_2]
//    )
//
//    let section_39 = Section(
//        title: "VISION",
//        videos: [video39_0, video39_1, video39_2]
//    )
//
//    let section_40 = Section(
//        title: "CHOKE",
//        videos: [video40_0, video40_1, video40_2]
//    )
//
//    let section_41 = Section(
//        title: "JOKE",
//        videos: [video41_0, video41_1, video41_2]
//    )
//
//    let section_42 = Section(
//        title: "YOU",
//        videos: [video42_0, video42_1, video42_2]
//    )
//
//    let section_43 = Section(
//        title: "Silents",
//        videos: [video43_0, video43_1, video43_2]
//    )
//
//    let section_44 = Section(
//        title: "Wildcards",
//        videos: [video44_0]
//    )
//
//    let section_45 = Section(
//        title: "Bonus",
//        videos: [video45_0, video45_1, video45_2, video46_0]
//    )
//
//    let videoGroup = VideoGroup(
//        id: "ja_ehd_master_course",
//        baseID: "ehd_master_course",
//        thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/MasterCourseThumbnail.png?alt=media&token=99ade6c0-597d-4d8b-bdca-2b17f4a97819",
//        sections: [
//            section_1, section_2, section_3, section_4,
//            section_5, section_6, section_7, section_8,
//            section_9, section_10, section_11, section_12,
//            section_13, section_14, section_15, section_16,
//            section_17, section_18, section_19, section_20,
//            section_21, section_22, section_23, section_24,
//            section_25, section_26, section_27, section_28,
//            section_29, section_30, section_31, section_32,
//            section_33, section_34, section_35, section_36,
//            section_37, section_38, section_39, section_40,
//            section_41, section_42, section_43, section_44,
//            section_45
//        ],
//        requiresPurchase: true,
//        sectionLockStarts: 3,
//        rowLockStarts: 0,
//        purchaseIdentifier: "EHDMasterCourse"
//    )
//    FirebaseManager.shared.updateLesson(videoGroup: videoGroup)
    
// =================================================================================================
// =================================================================================================
    
//
//    let secretsVideo = Video(title: "Mastering English with Aura",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/Secret_1_Thumbnail.png?alt=media&token=9e8d1582-15f9-4b6a-848a-2d41c2858245",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/aura_intro.mp4?alt=media&token=c60acd50-5c29-4998-b2a2-8d47671b4a3d",
//                            duration: "26 minutes, 13 seconds")
//
//    let secretsSection = Section(
//        title: "3 Secrets",
//        videos: [secretsVideo]
//    )
//
//    let secretsGroup = VideoGroup(
//        id: "ja_intro",
//        baseID: "intro",
//        thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/SecretsThumbnail.png?alt=media&token=07d430d1-5aa9-4756-b476-501e00d285b8",
//        sections: [secretsSection],
//        requiresPurchase: false,
//        sectionLockStarts: 100,
//        rowLockStarts: 0,
//        purchaseIdentifier: "intro"
//    )
//
//    FirebaseManager.shared.updateLesson(videoGroup: secretsGroup)

// =================================================================================================
// =================================================================================================
    
//    let secretsMediumVideo = Video(title: "Mastering English with Aura",
//                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/Secret_1_Thumbnail.png?alt=media&token=9e8d1582-15f9-4b6a-848a-2d41c2858245",
//                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/aura_Intro_medium.mp4?alt=media&token=b34d450b-adcf-4e0a-aa4f-820b55ad8a0c",
//                            duration: "18 minutes, 23 seconds")
//
//    let secretsMediumSection = Section(
//        title: "3 Secrets",
//        videos: [secretsMediumVideo]
//    )
//
//    let secretsMediumGroup = VideoGroup(
//        id: "ja_intro_medium",
//        baseID: "intro_medium",
//        thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/SecretsThumbnail.png?alt=media&token=07d430d1-5aa9-4756-b476-501e00d285b8",
//        sections: [secretsMediumSection],
//        requiresPurchase: false,
//        sectionLockStarts: 100,
//        rowLockStarts: 0,
//        purchaseIdentifier: "intro"
//    )
//
//    FirebaseManager.shared.updateLesson(videoGroup: secretsMediumGroup)

// =================================================================================================
// =================================================================================================
    
    let kygVideo0 = Video(title: "Why This Course?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/0_kyg_sales_thumbnail.png?alt=media&token=402475ed-23ae-413c-a205-00e290daa6cf",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/0_kyg_sales_video_2.mp4?alt=media&token=ca4bd2c9-c210-48cb-a7d5-8fb44679d1e8",
                            duration: "8 minutes 37 seconds")
    
    let kygVideo1_0 = Video(title: "Course Intro",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1_0_kyg_intro_thumbnail.png?alt=media&token=158453af-8617-4aa1-83eb-0895c738497c",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1_0_kyg_intro.mp4?alt=media&token=868591bb-15aa-4fc8-8633-f6e5bc323b6e",
                            duration: "1 minute 10 seconds")
    
    let kygVideo1_1 = Video(title: "You & I",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/1_1_kyg_you_i_intro%20.mp3?alt=media&token=ca45a1b8-19ca-477b-bce4-1c5719144ce8",
                            duration: "1 minute 46 seconds")
    
    let kygVideo2_0 = Video(title: "What are you?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2_0_what_are_you_thumbnail.png?alt=media&token=9c9f11bd-38ea-48e4-b4ac-d293b298fddb",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2_0_kyg_what_are_you.mp4?alt=media&token=ff32c6ea-a32c-4e32-be11-839aa6f30fd2",
                            duration: "0 minutes 11 seconds")
    
    let kygVideo2_1 = Video(title: "Intro",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2_1_now_intro.mp3?alt=media&token=c06b23d1-d5ca-40a2-ab65-e4c58c97e490",
                            duration: "2 minutes 41 seconds")
    
    let kygVideo2_2 = Video(title: "Whudiya - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2_2_whudiya_question.mp3?alt=media&token=6f38054f-6c1b-495e-ba8e-e10ae7d75056",
                            duration: "2 minutes 14 seconds")
    
    let kygVideo2_3 = Video(title: "Whudiya - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2_3_whudiya_answer.mp3?alt=media&token=d48e99a6-0908-4c06-8942-db2ff82c1db4",
                            duration: "1 minute 55 seconds")
    
    let kygVideo2_4 = Video(title: "When are you?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2_4_when_are_you_thumbnail.png?alt=media&token=4aa3a247-a7fd-4545-891f-786d7aa8200e",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2_4_kyg_when_are_you.mp4?alt=media&token=7ba6ae86-60a5-4216-b9b5-12a217778ba4",
                            duration: "0 minutes 11 seconds")
    
    let kygVideo2_5 = Video(title: "Wheniya - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2_5_wheniya_question.mp3?alt=media&token=db2cc4bf-6e8f-4446-bfa8-b24cd9de5037",
                            duration: "2 minutes 25 seconds")
    
    let kygVideo2_6 = Video(title: "Wheniya - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2_6_wheniya_answer.mp3?alt=media&token=04c88af4-8a7b-475a-9fda-d1ec6c60f687",
                            duration: "2 minutes 1 second")
    
    let kygVideo2_7 = Video(title: "Where are you?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2_7_where_are_you_thumbnail.png?alt=media&token=84b77740-40dd-40a7-a0b0-92ed5cc5ea5d",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2_7_kyg_where_are_you.mp4?alt=media&token=f27c3e57-208d-475d-a8db-959c2440ea77",
                            duration: "0 minutes 11 seconds")
    
    let kygVideo2_8 = Video(title: "Wheriya - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2_8_whereiya_question.mp3?alt=media&token=4f316c46-61a4-4d81-b5cb-f7f239a612ee",
                            duration: "2 minutes 20 seconds")
    
    let kygVideo2_9 = Video(title: "Wheriya - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2_9_wheriya_answer.mp3?alt=media&token=1bc34c58-f41f-4fba-8cb6-4e129035600c",
                            duration: "1 minute 56 seconds")
    
    let kygVideo2_10 = Video(title: "Review",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2_10_now_review.mp3?alt=media&token=88c07b68-9c3e-449e-bcf2-e42a340aa41e",
                            duration: "2 minutes 48 seconds")
    
    let kygVideo2_11 = Video(title: "Who? Why? How?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2_11_who_now_thumbnail.png?alt=media&token=57f2daf2-d6aa-4331-848d-00fac41f49e9",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/2_11_kyg_who_why_how_now.mp4?alt=media&token=55a29e9e-7d1f-46d4-be93-13e466f0dfd5",
                            duration: "0 minutes 49 seconds")
    
    let kygVideo3_0 = Video(title: "What are you going to?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3_0_what_are_you_going_to_thumbnail.png?alt=media&token=74debd3c-7080-4ad1-b4ca-f4782e220021",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3_0_kyg_what_are_you_going_to.mp4?alt=media&token=2606b192-9894-40d9-9624-cca4d39653fd",
                            duration: "0 minutes 12 seconds")
    
    let kygVideo3_1 = Video(title: "Intro",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3_1_from_now_intro.mp3?alt=media&token=95617aa4-30e0-4f75-b0f4-408b3a0997a2",
                            duration: "2 minutes 30 seconds")
    
    let kygVideo3_2 = Video(title: "Whadiya gonna - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3_2_whadiya_gonna_question.mp3?alt=media&token=77ae40e5-20c5-4b03-9765-4242e81f07cd",
                            duration: "2 minutes 28 seconds")
    
    let kygVideo3_3 = Video(title: "Whadiya gonna - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3_3_whudiya_gonna_answer.mp3?alt=media&token=6bce0ec5-706e-432c-a8e2-8a5256e40886",
                            duration: "2 minutes 16 seconds")
    
    let kygVideo3_4 = Video(title: "When are you going to?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3_4_when_are_you_going_to_thumbnail.png?alt=media&token=92bcba40-02a3-42b5-afab-89c2712582fc",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3_4_kyg_when_are_you_going_to.mp4?alt=media&token=32fe8828-ca8f-4d7a-9fbf-6350873e4f92",
                            duration: "0 minutes 11 seconds")
    
    
    let kygVideo3_5 = Video(title: "Wheniya gonna - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3_5_wheniya_gonna_question.mp3?alt=media&token=6b8ceeba-839c-4739-8db5-44e68fc0413d",
                            duration: "2 minutes 39 seconds")
    
    let kygVideo3_6 = Video(title: "Wheniya gonna - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3_6_wheniya_gonna_answer.mp3?alt=media&token=cf96fc9e-d35f-43ee-af51-4d793b3db18f",
                            duration: "2 minutes 13 seconds")
    
    let kygVideo3_7 = Video(title: "Where are you going to?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3_7_where_are_you_going_to_thumbnail.png?alt=media&token=8428951a-fbca-45a7-adff-c63c3301ce1b",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3_7_kyg_where_are_you_going_to.mp4?alt=media&token=e63457d3-21a6-4c3b-915a-08750de81f3c",
                            duration: "0 minutes 14 seconds")
    
    let kygVideo3_8 = Video(title: "Wheriya gonna - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3_8_wheriya_gonna_question.mp3?alt=media&token=aa727e55-01ee-4d93-952f-e6580e32823c",
                            duration: "2 minutes 32 seconds")
    
    let kygVideo3_9 = Video(title: "Wheriya gonna - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3_9_wheriya_gonna_answer.mp3?alt=media&token=fdca3fe9-9d04-456b-8ab0-036e56501e2a",
                            duration: "2 minutes 14 seconds")
    
    let kygVideo3_10 = Video(title: "Review",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3_10_from_now_review.mp3?alt=media&token=1fe4f1e2-aebd-437e-b4b1-7f4d77c07b91",
                            duration: "2 minutes 51 seconds")
    
    let kygVideo3_11 = Video(title: "Who? Why? How?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3_11_who_from_now_thumbnail.png?alt=media&token=bc6ffcb0-f408-45c2-a775-a5f48b92ede6",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/3_11_kyg_who_why_how_from_now.mp4?alt=media&token=e1c971cf-ed4b-455b-8a8c-01b3a9c4be40",
                            duration: "0 minutes 56 seconds")
    
    let kygVideo4_0 = Video(title: "What did you?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4_0_what_did_you_thumbnail.png?alt=media&token=433e658d-91b9-4860-815a-84e438087121",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4_0_kyg_what_did_you.mp4?alt=media&token=f3f6581d-a5ed-422c-910d-6bf0744647b1",
                            duration: "0 minutes 11 seconds")
    
    let kygVideo4_1 = Video(title: "Intro",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4_1_until_now_intro.mp3?alt=media&token=2d48e952-a4e1-43aa-b428-d36bb73e84bf",
                            duration: "2 minutes 21 seconds")
    
    let kygVideo4_2 = Video(title: "Whuja - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4_2_whuja_question.mp3?alt=media&token=6775d98c-01af-4731-a176-97b228711e5f",
                            duration: "2 minutes 2 seconds")
    
    let kygVideo4_3 = Video(title: "Whuja - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4_3_whuja_answer.mp3?alt=media&token=10449001-9f46-44ab-b7bd-908493c04d00",
                            duration: "1 minute 45 seconds")
    
    let kygVideo4_4 = Video(title: "When did you?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4_4_when_did_you_thumbnail.png?alt=media&token=ac9e383c-53a3-4e87-8305-1b21baf0dcaa",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4_4_kyg_when_did_you.mp4?alt=media&token=2ce1cb6e-5d9a-4391-929b-c9ec2e39b9cc",
                            duration: "0 minutes 11 seconds")
    
    let kygVideo4_5 = Video(title: "Whenja - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4_5_whenja_question.mp3?alt=media&token=d2b29396-84ce-4f28-bc30-31e0dea8455c",
                            duration: "2 minutes 16 seconds")
    
    let kygVideo4_6 = Video(title: "Whenja - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4_6_whenja_answer.mp3?alt=media&token=27c36cfd-a406-4f20-bf24-f102e24f9bdf",
                            duration: "1 minute 58 seconds")
    
    let kygVideo4_7 = Video(title: "Where did you?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4_7_where_did_you_thumbnail.png?alt=media&token=057d67a9-46a2-43c0-a859-bf39ee01c5e7",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4_7_kyg_where_did_you.mp4?alt=media&token=63f879b0-3342-4519-8042-82e8a3d76227",
                            duration: "0 minutes 11 seconds")
    
    let kygVideo4_8 = Video(title: "Wherja - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4_8_wherja_question.mp3?alt=media&token=b162af74-ac75-44cc-a0db-d430d81c0497",
                            duration: "2 minutes 2 seconds")
    
    let kygVideo4_9 = Video(title: "Wherja - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4_9_wherja_answer.mp3?alt=media&token=4a58331b-277d-400d-b446-c704e5a26cd4",
                            duration: "1 minute 56 seconds")
    
    let kygVideo4_10 = Video(title: "Review",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4_10_until_now_review.mp3?alt=media&token=609fcbca-a496-4e2e-a824-968ebc3eeda8",
                            duration: "2 minutes 44 seconds")
    
    let kygVideo4_11 = Video(title: "Who? Why? How?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4_11_who_until_now_thumbnail.png?alt=media&token=ff359bf9-d1cc-4a51-8688-0fc59819cf55",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/4_11_kyg_who_why_how_until_now.mp4?alt=media&token=b8413e96-8574-44c8-b083-561e4b4a55d1",
                            duration: "0 minutes 45 seconds")
    
    let kygVideo5_0 = Video(title: "What do you?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5_0_what_do_you_thumbnail.png?alt=media&token=52f990b8-d01d-4069-9264-8c1aa59c903a",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5_0_kyg_what_do_you.mp4?alt=media&token=dd199db3-0e37-4b71-ae67-ca344ac99486",
                            duration: "0 minutes 10 seconds")
    
    let kygVideo5_1 = Video(title: "Intro",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5_1_usually_intro.mp3?alt=media&token=c5864bd1-420a-4eac-92e6-31f4bc0c8180",
                            duration: "3 minutes 33 seconds")
    
    let kygVideo5_2 = Video(title: "Whudoya - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5_2_whuDOya_question.mp3?alt=media&token=aafc6e61-be0a-413c-bce1-10dcbe8e7845",
                            duration: "2 minutes 22 seconds")
    
    let kygVideo5_3 = Video(title: "Whudoya - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5_3_whuDOya_answer.mp3?alt=media&token=7e975fb2-ea2e-4ee7-af30-5f5ffbf6bc1b",
                            duration: "1 minute 55 seconds")
    
    let kygVideo5_4 = Video(title: "When do you?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5_4_when_do_you_thumbnail.png?alt=media&token=95f79300-d612-4911-b30a-3d52119e5144",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5_4_kyg_when_do_you.mp4?alt=media&token=eb24aca8-ab20-4d49-9dcc-698fb22bebb6",
                            duration: "0 minutes 8 seconds")
    
    let kygVideo5_5 = Video(title: "Whendiya - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5_5_whendiya_question.mp3?alt=media&token=6a3c7766-8732-444f-adb6-a3540cf44d83",
                            duration: "2 minutes 24 seconds")
    
    let kygVideo5_6 = Video(title: "Whendiya - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5_6_whendiya_answer.mp3?alt=media&token=a27830ef-0380-4cd9-a97a-9ca307b54ded",
                            duration: "2 minutes 0 seconds")
    
    let kygVideo5_7 = Video(title: "Where do you?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5_7_where_do_you_thumbnail.png?alt=media&token=13ce5be3-42fa-49cf-bd6e-5cf6821c0821",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5_7_kyg_where_do_you.mp4?alt=media&token=d2b5a287-a467-4aaa-9bb6-0934da9b4e0c",
                            duration: "0 minutes 8 seconds")
    
    let kygVideo5_8 = Video(title: "Wherdiya - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5_8_wherdiya_question.mp3?alt=media&token=d585cfcb-5a7c-4d41-b4a9-760fdd689bec",
                            duration: "2 minutes 25 seconds")
    
    let kygVideo5_9 = Video(title: "Wherdiya - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5_9_wherdiya_answer.mp3?alt=media&token=732dd5ac-6231-4127-9797-eabb3bb8efcd",
                            duration: "2 minutes 10 seconds")
    
    let kygVideo5_10 = Video(title: "Review",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5_10_usually_review.mp3?alt=media&token=e654051a-7c2b-44cf-8c10-028b2172bffa",
                            duration: "2 minutes 43 seconds")
    
    let kygVideo5_11 = Video(title: "Who? Why? How?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5_11_who_usually_thumbnail.png?alt=media&token=c7e967e6-5e7a-4351-9cd5-e17e1f00cffc",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/5_11_kyg_who_why_how_usually.mp4?alt=media&token=82e1e816-ee0a-4d9b-a1a2-9919d92ba97a",
                            duration: "0 minutes 47 seconds")
    
    let kygVideo6_0 = Video(title: "What do you want to?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6_0_what_do_you_want_to_thumbnail.png?alt=media&token=d0755843-4888-422a-96c9-c85df0a57b55",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6_0_kyg_what_do_you_want_to.mp4?alt=media&token=0e1f1332-7dcb-485d-915e-2d7f11832ae3",
                            duration: "0 minutes 12 seconds")
    
    let kygVideo6_1 = Video(title: "Intro",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6_1_wanna_intro.mp3?alt=media&token=61b914b1-90de-4880-8e7d-5c68ba3fed81",
                            duration: "2 minutes 23 seconds")
    
    let kygVideo6_2 = Video(title: "Whudiya wanna - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6_2_whudiya_wanna_question.mp3?alt=media&token=2f579966-3587-42d5-aff6-ea8302bcf078",
                            duration: "2 minutes 36 seconds")
    
    let kygVideo6_3 = Video(title: "Whudiya wanna - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6_3_whudiya_wanna_answer.mp3?alt=media&token=0d580294-ec21-4b9b-8926-e1dfb85c89d5",
                            duration: "2 minutes 19 seconds")
    
    let kygVideo6_4 = Video(title: "When do you want to?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6_4_when_do_you_want_to_thumbnail.png?alt=media&token=eda49d85-9109-4968-9ca0-4c9071916898",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6_4_kyg_when_do_you_want_to.mp4?alt=media&token=2defa923-fc88-4209-b675-0fde697e8cce",
                            duration: "0 minutes 11 seconds")
    
    let kygVideo6_5 = Video(title: "Whendiya wanna - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6_5_whendiya_wanna_question.mp3?alt=media&token=b8d00db4-6227-4220-a829-0b6388398fe4",
                            duration: "2 minutes 23 seconds")
    
    let kygVideo6_6 = Video(title: "Whendiya wanna - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6_6_whendiya_wanna_answer.mp3?alt=media&token=2eeef5b3-2123-410b-8a46-f10c8bf99e6d",
                            duration: "2 minutes 14 seconds")
    
    let kygVideo6_7 = Video(title: "Where do you want to?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6_7_where_do_you_want_to_thumbnail.png?alt=media&token=a43a0d19-5a4d-40c1-93b7-14cb7a60cd03",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6_7_kyg_where_do_you_want_to.mp4?alt=media&token=a6e85f26-2e95-4a8c-8bf3-d1b5970a7da1",
                            duration: "0 minutes 13 seconds")
    
    let kygVideo6_8 = Video(title: "Wherdiya wanna - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6_8_wherdiya_wanna_question.mp3?alt=media&token=3b0fb978-7b35-41e7-aaea-02fa6ebf3c0a",
                            duration: "2 minutes 21 seconds")
    
    let kygVideo6_9 = Video(title: "Wherdiya wanna - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6_9_wherdiya_wanna_answer.mp3?alt=media&token=8166f254-fcee-438a-b8c7-c08816c0c93c",
                            duration: "2 minutes 20 seconds")
    
    let kygVideo6_10 = Video(title: "Review",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6_10_wanna_review.mp3?alt=media&token=0f1029cf-6c69-4e37-8be8-a51b865d2d05",
                            duration: "2 minutes 45 seconds")
    
    let kygVideo6_11 = Video(title: "Who? Why? How?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6_11_who_wanna_thumbnail.png?alt=media&token=04bebb07-80fc-43cc-85d0-5cc2fd8b5f2a",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/6_11_kyg_who_why_how_wanna.mp4?alt=media&token=950455d3-aa92-4775-8d58-ec95c49b33c5",
                            duration: "0 minutes 54 seconds")
    
    let kygVideo7_0 = Video(title: "What do you got to?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7_0_what_do_you_got_to_thumbnail.png?alt=media&token=7d4f9f2f-0984-4e9f-ad80-d6f7bbef0f57",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7_0_kyg_what_do_you_got_to.mp4?alt=media&token=bb101530-85d1-411d-903f-65bd26458849",
                            duration: "0 minutes 11 seconds")
    
    let kygVideo7_1 = Video(title: "Intro",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7_1_gotta_intro.mp3?alt=media&token=a3d99f2c-a629-468e-b034-3f626618f95c",
                            duration: "2 minutes 27 seconds")
    
    let kygVideo7_2 = Video(title: "Whudiya gotta - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7_2_whudiya_gotta_question.mp3?alt=media&token=d1b7e7ca-5817-44c0-99ef-1d65b2b0571d",
                            duration: "2 minutes 23 seconds")
    
    let kygVideo7_3 = Video(title: "Whudiya gotta - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7_3_whudiya_gotta_answer.mp3?alt=media&token=bf84a1a2-9bf1-4125-9de6-c3c51bf55777",
                            duration: "2 minutes 14 seconds")
    
    let kygVideo7_4 = Video(title: "When do you got to?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7_4_when_do_you_got_to_thumbnail.png?alt=media&token=c5d0775f-7c68-49cb-9471-e95519a5aede",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7_4_kyg_when_do_you_got_to.mp4?alt=media&token=7239ce9a-af08-4e75-92cb-7f40392f82ea",
                            duration: "0 minutes 10 seconds")
    
    let kygVideo7_5 = Video(title: "Whendiya gotta - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7_5_whendiya_gotta_question.mp3?alt=media&token=818ca422-68ab-4809-a226-6b145f0722dd",
                            duration: "2 minutes 27 seconds")
    
    let kygVideo7_6 = Video(title: "Whendiya gotta - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7_6_whendiya_gotta_answer.mp3?alt=media&token=4e2ab9fd-e589-493c-b24e-ec63beed9630",
                            duration: "2 minutes 17 seconds")
    
    let kygVideo7_7 = Video(title: "Where do you got to?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7_7_where_do_you_got_to_thumbnail.png?alt=media&token=dbb75061-5b25-4763-b766-286349bc01e8",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7_7_kyg_where_do_you_got_to.mp4?alt=media&token=e4cbb1a1-b02c-470e-94a5-9d1f1007526b",
                            duration: "0 minutes 11 seconds")
    
    let kygVideo7_8 = Video(title: "Wherdiya gotta - Question",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7_8_wherdiya_gotta_question.mp3?alt=media&token=d02ec5bc-4755-4d66-b4f5-e783f96fabf1",
                            duration: "2 minutes 17 seconds")
    
    let kygVideo7_9 = Video(title: "Wherdiya gotta - Answer",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7_9_wherdiya_gotta_answer.mp3?alt=media&token=30dc679d-34f7-4a2d-9a70-5b6b923c13f9",
                            duration: "2 minutes 34 seconds")
    
    let kygVideo7_10 = Video(title: "Review",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7_10_gotta_review.mp3?alt=media&token=6232a45e-974e-49b1-8bb1-9ba26ca1d979",
                            duration: "2 minutes 54 seconds")
    
    let kygVideo7_11 = Video(title: "Who? Why? How?",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7_11_who_gotta_thumbnail.png?alt=media&token=bae3d89c-7251-449e-a8e3-9ec2ef4a1cd7",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/7_11_kyg_who_why_how_gotta.mp4?alt=media&token=ae29b438-f68c-4077-bbfc-88cdd080ffd4",
                            duration: "0 minutes 53 seconds")
    
    let kygVideo8_0 = Video(title: "Answers Challenge",
                            thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGAudioThumbnail.png?alt=media&token=b2e97edb-d44b-4eb5-944f-35d088058679",
                            videoURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/8_0_bonus_answers_challenge.mp3?alt=media&token=62a79817-3ede-4dfa-bc09-5135019bd64b",
                            duration: "1 minute 54 seconds")
    
    let kygSection1 = Section(
        title: "Introduction",
        videos: [
            kygVideo0, kygVideo1_0, kygVideo1_1,
        ]
    )
    
    let kygSection2 = Section(
        title: "Present Progressive",
        videos: [
            kygVideo2_0, kygVideo2_1, kygVideo2_2,
            kygVideo2_3, kygVideo2_4, kygVideo2_5,
            kygVideo2_6, kygVideo2_7, kygVideo2_8,
            kygVideo2_9, kygVideo2_10, kygVideo2_11
        ]
    )
    
    let kygSection3 = Section(
        title: "Future",
        videos: [
            kygVideo3_0, kygVideo3_1, kygVideo3_2,
            kygVideo3_3, kygVideo3_4, kygVideo3_5,
            kygVideo3_6, kygVideo3_7, kygVideo3_8,
            kygVideo3_9, kygVideo3_10, kygVideo3_11
        ]
    )
    
    let kygSection4 = Section(
        title: "Past",
        videos: [
            kygVideo4_0, kygVideo4_1, kygVideo4_2,
            kygVideo4_3, kygVideo4_4, kygVideo4_5,
            kygVideo4_6, kygVideo4_7, kygVideo4_8,
            kygVideo4_9, kygVideo4_10, kygVideo4_11
        ]
    )
    
    let kygSection5 = Section(
        title: "Simple Present",
        videos: [
            kygVideo5_0, kygVideo5_1, kygVideo5_2,
            kygVideo5_3, kygVideo5_4, kygVideo5_5,
            kygVideo5_6, kygVideo5_7, kygVideo5_8,
            kygVideo5_9, kygVideo5_10, kygVideo5_11
        ]
    )
    
    let kygSection6 = Section(
        title: "Want to",
        videos: [
            kygVideo6_0, kygVideo6_1, kygVideo6_2,
            kygVideo6_3, kygVideo6_4, kygVideo6_5,
            kygVideo6_6, kygVideo6_7, kygVideo6_8,
            kygVideo6_9, kygVideo6_10, kygVideo6_11
        ]
    )
    
    let kygSection7 = Section(
        title: "Got to",
        videos: [
            kygVideo7_0, kygVideo7_1, kygVideo7_2,
            kygVideo7_3, kygVideo7_4, kygVideo7_5,
            kygVideo7_6, kygVideo7_7, kygVideo7_8,
            kygVideo7_9, kygVideo7_10, kygVideo7_11
        ]
    )
    
    let kygSection8 = Section(
        title: "Bonus",
        videos: [kygVideo8_0]
    )
    
    let kygGroup = VideoGroup(
        id: "ja_kyg_course",
        baseID: "kyg_course",
        thumbnailURL: "https://firebasestorage.googleapis.com/v0/b/simply-english-10f6f.appspot.com/o/KYGCourseThumbnail.png?alt=media&token=8890e67f-28eb-414f-afee-13240f7b1167",
        sections: [
            kygSection1, kygSection2, kygSection3,
            kygSection4, kygSection5, kygSection6,
            kygSection7, kygSection8
        ],
        requiresPurchase: true,
        sectionLockStarts: 2,
        rowLockStarts: 4,
        purchaseIdentifier: "KYGCourse"
    )
    
    FirebaseManager.shared.updateLesson(videoGroup: kygGroup)
    
}
