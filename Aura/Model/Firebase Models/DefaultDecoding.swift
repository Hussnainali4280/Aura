//
//  DefaultDecoding.swift
//  Aura
//
//  Created by Maxwell Dolensky on 10/15/20.
//  Copyright © 2020 Max Dolensky. All rights reserved.
//

import Foundation

// Anything that inherits this protocol must have a variable called defaultValue of type Value,
// which is a placeholder. The actual type to use for that associated type isn’t specified until
// the protocol is adopted.
protocol DecodableDefaultSource {
    associatedtype Value: Codable
    static var defaultValue: Value { get }
}

// We use an enum to create a namespace for the decoding code that we're about to write -- which
// will both give us a really nice syntax, and also provide a neat degree of code encapsulation.
// The advantage of using case-less enums to implement namespaces is that they can’t be initialized,
// which makes them act as pure wrappers, rather than stand-alone types that can be instantiated.
enum DecodableDefault {}

// Source is a Generic that inherits the DecodableDefaultSource protocol, aka it must have a
// a variable called defaultValue. Source defines a placeholder name for a type to be provided
// later. This future type can be referred to as Source anywhere within the structure’s definition.
// The definition of typealias Value = Source.Value turns the abstract type of Value into a concrete
// type of Source.Value for this implementation of the DecodableDefaultSource Protocol.
// All property wrappers must have a variable called wrappedValue. We set the wrappedValue
// to the defaultValue of the Source.
extension DecodableDefault {
    @propertyWrapper
    struct Wrapper<Source: DecodableDefaultSource> {
        typealias Value = Source.Value
        var wrappedValue = Source.defaultValue
    }
}

// We make the property wrapper conform to Decodable
// The reason we conform to Decodable through an extension is to not override our type’s
// memberwise initializer.
extension DecodableDefault.Wrapper: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = try container.decode(Value.self)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}

// We only continue decoding in case a value exists for the given key, otherwise we’ll fall
// back to an empty instance of our wrapper
extension KeyedDecodingContainer {
    func decode<T>(_ type: DecodableDefault.Wrapper<T>.Type,
                   forKey key: Key) throws -> DecodableDefault.Wrapper<T> {
        try decodeIfPresent(type, forKey: key) ?? .init()
    }
}

// With the above base infrastructure in place, let’s now go ahead and implement a few default value
// sources. We’ll again use an enum to provide an additional level of namespacing for our sources
extension DecodableDefault {
    typealias Source = DecodableDefaultSource
    typealias List = Codable & ExpressibleByArrayLiteral
    typealias Map = Codable & ExpressibleByDictionaryLiteral

    enum Sources {
        enum True: Source {
            static var defaultValue: Bool { true }
        }

        enum False: Source {
            static var defaultValue: Bool { false }
        }

        enum EmptyString: Source {
            static var defaultValue: String { "" }
        }
        
        enum NegativeOne: Source {
            static var defaultValue: Double { -1 }
        }

        enum EmptyList<T: List>: Source {
            static var defaultValue: T { [] }
        }

        enum EmptyMap<T: Map>: Source {
            static var defaultValue: T { [:] }
        }
    }
}

extension DecodableDefault {
    typealias True = Wrapper<Sources.True>
    typealias False = Wrapper<Sources.False>
    typealias EmptyString = Wrapper<Sources.EmptyString>
    typealias NegativeOne = Wrapper<Sources.NegativeOne>
    typealias EmptyList<T: List> = Wrapper<Sources.EmptyList<T>>
    typealias EmptyMap<T: Map> = Wrapper<Sources.EmptyMap<T>>
}


// EXAMPLE USAGE

//struct Article: Decodable {
//    var title: String
//    @DecodableDefault.EmptyString var body: String
//    @DecodableDefault.False var isFeatured: Bool
//    @DecodableDefault.True var isActive: Bool
//    @DecodableDefault.EmptyList var comments: [Comment]
//    @DecodableDefault.EmptyMap var flags: [String : Bool]
//}

