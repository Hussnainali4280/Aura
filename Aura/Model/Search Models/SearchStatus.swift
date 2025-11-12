//
//  SearchStatus.swift
//  Aura
//
//  Created by Max Dolensky on 8/26/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import Foundation

enum SearchStatus {
    
    // Everything goes well
    case success
    
    // Most likely no network connection
    case nilTranslation
    
    // Most likely incorrect spelling, incorrect input/output language parameters, or words don't exist in database
    case emptyTranslationNoExistingWordModels
    
    // Most likely incorrect input/output language parameters, incorrect spelling, or words don't exist in database
    case emptyTranslationMissingSomeWordModels
    
    // Most likely incorrect input/output language parameters
    case emptyTranslationWithAllWordModels
    
    // Most likely no network connection, incorrect spelling, or words don't exist in database
    case noExistingWordModels
    
    // Most likely incorrect spelling, or words don't exist in database
    case missingSomeWordModels
        
}
