//
//  LanguageCode.swift
//  
//
//  Created by Jorge Loc Rubio on 4/9/20.
//

import Foundation

/**
 Language Codes ISO 639-1
 - SeeAlso: `http://www.loc.gov/standards/iso639-2/php/English_list.php - ISO 639-1`
 */
public struct LanguageCode: RawRepresentable, Equatable, Hashable {

    public let rawValue: UInt16
    
    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }
}

// MARK: - CustomStringConvertible

extension LanguageCode: CustomStringConvertible {
    
    public var description: String {
        return name ?? rawValue.description
    }
}

// MARK: - ExpressibleByIntegerLiteral

extension LanguageCode: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: UInt16) {
        self.init(rawValue: value)
    }
}

extension LanguageCode: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        let array = [UInt8](value
                            .prefix(type(of: self).length)
                            .utf8)
        assert(array.count == 2)
        self.init(rawValue: UInt16(bigEndian: UInt16(bytes: (array[0], array[1]))))
    }
}

// MARK: - Definitions

public extension LanguageCode {
    
    /// Reset
    ///
    /// reset device to default Language.
    static var reset: LanguageCode { return 0x0000 }
    
    /// Abkhazian
    static var ab: LanguageCode { return "AB" }
    
    /// Afar
    static var aa: LanguageCode { return "AA" }
    
    /// Afrikaans
    static var af: LanguageCode { return "AF" }
    
    /// Akan
    static var ak: LanguageCode { return "AK" }
    
    /// Albanian
    static var sq: LanguageCode { return "SQ" }
    
    /// Amharic
    static var am: LanguageCode { return "AM" }
    
    /// Arabic
    static var ar: LanguageCode { return "AR" }
    
    /// Aragonese
    static var an: LanguageCode { return "AN" }
    
    /// Armenian
    static var hy: LanguageCode { return "HY" }
    
    /// Assamese
    static var `as`: LanguageCode { return "AS" }
    
    /// Avaric
    static var av: LanguageCode { return "AV" }
    
    /// Avestan
    static var ae: LanguageCode { return "AE" }
    
    /// Aymara
    static var ay: LanguageCode { return "AY" }
    
    /// Azerbaijani
    static var az: LanguageCode { return "AZ" }
    
    /// Bambara
    static var bm: LanguageCode { return "BM" }
    
    /// Bashkir
    static var ba: LanguageCode { return "BA" }
    
    /// Basque
    static var eu: LanguageCode { return "EU" }
    
    /// Belarusian
    static var be: LanguageCode { return "BE" }
    
    /// Bengali
    static var bn: LanguageCode { return "BN" }
    
    /// Bihari languages
    static var bh: LanguageCode { return "BH" }
    
    /// Bislama
    static var bi: LanguageCode { return "BI" }
    
    /// Bosnian
    static var bs: LanguageCode { return "BS" }
    
    /// Bokmål, Norwegian
    static var nb: LanguageCode { return "NB" }
    
    /// Breton
    static var br: LanguageCode { return "BR" }
    
    /// Bulgarian
    static var bg: LanguageCode { return "BG" }
    
    /// Burmese
    static var my: LanguageCode { return "MY" }
    
    /// Castilian
    static var es: LanguageCode { return "ES" }
    
    /// Catalan
    static var ca: LanguageCode { return "CA" }
    
    /// Central Khmer
    static var km: LanguageCode { return "KM" }
    
    /// Chamorro
    static var ch: LanguageCode { return "CH" }
    
    /// Chechen
    static var ce: LanguageCode { return "CE" }
    
    /// Chichewa
    static var ny: LanguageCode { return "NY" }
    
    /// Chinese
    static var zh: LanguageCode { return "ZH" }
    
    /// Chuang
    static var za: LanguageCode { return "ZA" }
    
    /// Church Slavic
    static var cu: LanguageCode { return "CU" }
    
    /// Chuvash
    static var cv: LanguageCode { return "CV" }
    
    /// Cornish
    static var kw: LanguageCode { return "KW" }
    
    /// Corsican
    static var co: LanguageCode { return "CO" }
    
    /// Cree
    static var cr: LanguageCode { return "CR" }
    
    /// Croatian
    static var hr: LanguageCode { return "HR" }
    
    /// Czech
    static var cs: LanguageCode { return "CS" }
    
    /// Danish
    static var da: LanguageCode { return "DA" }
    
    /// Dhivehi
    static var dv: LanguageCode { return "DV" }
    
    /// Dutch
    static var nl: LanguageCode { return "NL" }
    
    /// Dzongkha
    static var dz: LanguageCode { return "DZ" }
    
    /// English
    static var en: LanguageCode { return "EN" }
    
    /// Esperanto
    static var eo: LanguageCode { return "EO" }
    
    /// Estonian
    static var et: LanguageCode { return "ET" }
    
    /// Ewe
    static var ee: LanguageCode { return "EE" }
    
    /// Faroese
    static var fo: LanguageCode { return "FO" }
    
    /// Fijian
    static var fj: LanguageCode { return "FJ" }
    
    /// Finnish
    static var fi: LanguageCode { return "FI" }
    
    /// French
    static var fr: LanguageCode { return "FR" }
    
    /// Fulah
    static var ff: LanguageCode { return "FF" }
    
    /// Gaelic
    static var gd: LanguageCode { return "GD" }
    
    /// Galician
    static var gl: LanguageCode { return "GL" }
    
    /// Ganda
    static var lg: LanguageCode { return "LG" }
    
    /// Georgian
    static var ka: LanguageCode { return "KA" }
    
    /// German
    static var de: LanguageCode { return "DE" }
    
    /// Gikuyu
    static var ki: LanguageCode { return "KI" }
    
    /// Greek, Modern
    static var el: LanguageCode { return "EL" }
    
    /// Greenlandic
    static var kl: LanguageCode { return "KL" }
    
    /// Guarani
    static var gn: LanguageCode { return "GN" }
    
    /// Gujarati
    static var gu: LanguageCode { return "GU" }
    
    /// Haitian
    static var ht: LanguageCode { return "HT" }
    
    /// Hausa
    static var ha: LanguageCode { return "HA" }
    
    /// Hebrew
    static var he: LanguageCode { return "HE" }
    
    /// Herero
    static var hz: LanguageCode { return "HZ" }
    
    /// Hindi
    static var hi: LanguageCode { return "HI" }
    
    /// Hiri Motu
    static var ho: LanguageCode { return "HO" }
    
    /// Hungarian
    static var hu: LanguageCode { return "HU" }
    
    /// Icelandic
    static var `is`: LanguageCode { return "IS" }
    
    /// Ido
    static var io: LanguageCode { return "IO" }
    
    /// Igbo
    static var ig: LanguageCode { return "IG" }
    
    /// Indonesian
    static var id: LanguageCode { return "ID" }
    
    /// Interlingua (International Auxiliary Language Association)
    static var ia: LanguageCode { return "IA" }
    
    /// Interlingue
    static var ie: LanguageCode { return "IE" }
    
    /// Inuktitut
    static var iu: LanguageCode { return "IU" }
    
    /// Inupiaq
    static var ik: LanguageCode { return "IK" }
    
    /// Irish
    static var ga: LanguageCode { return "GA" }
    
    /// Italian
    static var it: LanguageCode { return "IT" }
    
    /// Japanese
    static var ja: LanguageCode { return "JA" }
    
    /// Javanese
    static var jv: LanguageCode { return "JV" }
    
    /// Kannada
    static var kn: LanguageCode { return "KN" }
    
    /// Kanuri
    static var kr: LanguageCode { return "KR" }
    
    /// Kashmiri
    static var ks: LanguageCode { return "KS" }
    
    /// Kazakh
    static var kk: LanguageCode { return "KK" }
    
    /// Kinyarwanda
    static var rw: LanguageCode { return "RW" }
    
    /// Kirghiz
    static var ky: LanguageCode { return "KY" }
    
    /// Komi
    static var kv: LanguageCode { return "KV" }
    
    /// Kongo
    static var kg: LanguageCode { return "KG" }
    
    /// Korean
    static var ko: LanguageCode { return "KO" }
    
    /// Kurdish
    static var ku: LanguageCode { return "KU" }
    
    /// Kuanyama
    static var kj: LanguageCode { return "KJ" }
    
    /// Latin
    static var la: LanguageCode { return "LA" }
    
    /// Letzeburgesch
    static var lb: LanguageCode { return "LB" }
        
    /// Limburgan
    static var li: LanguageCode { return "LI" }
    
    /// Lingala
    static var ln: LanguageCode { return "LN" }
    
    /// Lao
    static var lo: LanguageCode { return "LO" }
    
    /// Lithuanian
    static var lt: LanguageCode { return "LT" }
    
    /// Luba-Katanga
    static var lu: LanguageCode { return "LU" }
    
    /// Latvian
    static var lv: LanguageCode { return "LV" }
    
    /// Manx
    static var gv: LanguageCode { return "GV" }
    
    /// Macedonian
    static var mk: LanguageCode { return "MK" }
    
    /// Malagasy
    static var mg: LanguageCode { return "MG" }
    
    /// Malay
    static var ms: LanguageCode { return "MS" }
    
    /// Malayalam
    static var ml: LanguageCode { return "ML" }
    
    /// Maltese
    static var mt: LanguageCode { return "MT" }
    
    /// Maori
    static var mi: LanguageCode { return "MI" }
     
    /// Marathi
    static var mr: LanguageCode { return "MR" }
    
    /// Marshallese
    static var mh: LanguageCode { return "MH" }
    
    /// Mongolian
    static var mn: LanguageCode { return "MN" }
    
    /// Nauru
    static var na: LanguageCode { return "NA" }
    
    /// Navaho
    static var nv: LanguageCode { return "NV" }
    
    /// Ndebele, North
    static var nd: LanguageCode { return "ND" }
    
    /// Nepali
    static var ne: LanguageCode { return "NE" }
    
    /// Ndonga
    static var ng: LanguageCode { return "NG" }
    
    /// Norwegian Nynorsk
    static var nn: LanguageCode { return "NN" }
    
    /// Norwegian
    static var no: LanguageCode { return "NO" }
    
    /// Nuosu
    static var ii: LanguageCode { return "II" }
    
    /// Ndebele, South
    static var nr: LanguageCode { return "NR" }
    
    /// Occitan (post 1500)
    static var oc: LanguageCode { return "OC" }
    
    /// Ojibwa
    static var oj: LanguageCode { return "OJ" }
    
    /// Oromo
    static var om: LanguageCode { return "OM" }
    
    /// Oriya
    static var or: LanguageCode { return "OR" }
    
    /// Ossetian
    static var os: LanguageCode { return "OS" }
    
    /// Panjabi
    static var pa: LanguageCode { return "PA" }
    
    /// Pali
    static var pi: LanguageCode { return "PI" }
    
    /// Persian
    static var fa: LanguageCode { return "FA" }
    
    /// Polish
    static var pl: LanguageCode { return "PL" }
    
    /// Pushto
    static var ps: LanguageCode { return "PS" }
    
    /// Portuguese
    static var pt: LanguageCode { return "PT" }
    
    /// Quechua
    static var qu: LanguageCode { return "QU" }
    
    /// Romansh
    static var rm: LanguageCode { return "RM" }
    
    /// Rundi
    static var rn: LanguageCode { return "RN" }
    
    /// Romanian
    static var ro: LanguageCode { return "RO" }
    
    /// Russian
    static var ru: LanguageCode { return "RU" }
    
    /// Sanskrit
    static var sa: LanguageCode { return "SA" }
    
    /// Sardinian
    static var sc: LanguageCode { return "SC" }
    
    /// Sindhi
    static var sd: LanguageCode { return "SD" }
    
    /// Northern Sami
    static var se: LanguageCode { return "SE" }
    
    /// Samoan
    static var sm: LanguageCode { return "SM" }
    
    /// Sango
    static var sg: LanguageCode { return "SG" }
    
    /// Serbian
    static var sr: LanguageCode { return "SR" }
    
    /// Shona
    static var sn: LanguageCode { return "SN" }
    
    /// Sinhala
    static var si: LanguageCode { return "SI" }
    
    /// Slovak
    static var sk: LanguageCode { return "SK" }
    
    /// Slovenian
    static var sl: LanguageCode { return "SL" }
    
    /// Somali
    static var so: LanguageCode { return "SO" }
    
    /// Sotho, Southern
    static var st: LanguageCode { return "ST" }
    
    /// Sundanese
    static var su: LanguageCode { return "SU" }
    
    /// Swahili
    static var sw: LanguageCode { return "SW" }
    
    /// Swati
    static var ss: LanguageCode { return "SS" }
    
    /// Swedish
    static var sv: LanguageCode { return "SV" }
    
    /// Tamil
    static var ta: LanguageCode { return "TA" }
    
    /// Telugu
    static var te: LanguageCode { return "TE" }
    
    /// Tajik
    static var tg: LanguageCode { return "TG" }
    
    /// Thai
    static var th: LanguageCode { return "TH" }
    
    /// Tigrinya
    static var ti: LanguageCode { return "TI" }
    
    /// Tibetan
    static var bo: LanguageCode { return "BO" }
    
    /// Turkmen
    static var tk: LanguageCode { return "TK" }
    
    /// Tagalog
    static var tl: LanguageCode { return "TL" }
    
    /// Tswana
    static var tn: LanguageCode { return "TN" }
    
    /// Tonga (Tonga Islands)
    static var to: LanguageCode { return "TO" }
    
    /// Turkish
    static var tr: LanguageCode { return "TR" }
    
    /// Tsonga
    static var ts: LanguageCode { return "TS" }
    
    /// Tatar
    static var tt: LanguageCode { return "TT" }
    
    /// Twi
    static var tw: LanguageCode { return "TW" }
    
    /// Tahitian
    static var ty: LanguageCode { return "TY" }
    
    /// Uighur
    static var ug: LanguageCode { return "UG" }
    
    /// Ukrainian
    static var uk: LanguageCode { return "UK" }
    
    /// Urdu
    static var ur: LanguageCode { return "UR" }
    
    /// Uzbek
    static var uz: LanguageCode { return "UZ" }
    
    /// Venda
    static var ve: LanguageCode { return "VE" }
    
    /// Vietnamese
    static var vi: LanguageCode { return "VI" }
    
    /// Volapük
    static var vo: LanguageCode { return "VO" }
    
    /// Walloon
    static var wa: LanguageCode { return "WA" }
    
    /// Welsh
    static var cy: LanguageCode { return "CY" }
    
    /// Wolof
    static var wo: LanguageCode { return "WO" }
    
    /// Western Frisian
    static var fy: LanguageCode { return "FY" }
    
    /// Xhosa
    static var xh: LanguageCode { return "XH" }
    
    /// Yiddish
    static var yi: LanguageCode { return "YI" }
    
    /// Yoruba
    static var yo: LanguageCode { return "YO" }
    
    /// 
    static var zu: LanguageCode { return "ZU" }
}

// MARK: - Names

public extension LanguageCode {
    
    var name: String? {
        return type(of: self).names[self]
    }
    
    internal static let names: [LanguageCode: String] = [
        .reset: "Reset",
        .ab: "AB",
        .aa: "AA",
        .af: "AF",
        .ak: "AK",
        .sq: "SQ",
        .am: "AM",
        .ar: "AR",
        .an: "AN",
        .hy: "HY",
        .as: "AS",
        .av: "AV",
        .ae: "AE",
        .ay: "AY",
        .az: "AZ",
        .bm: "BM",
        .ba: "BA",
        .eu: "EU",
        .be: "BE",
        .bn: "BN",
        .bh: "BH",
        .bi: "BI",
        .bs: "BS",
        .br: "BR",
        .bg: "BG",
        .my: "MY",
        .ca: "CA",
        .ch: "CH",
        .ce: "CE",
        .ny: "NY",
        .zh: "ZH",
        .cv: "CV",
        .kw: "KW",
        .co: "CO",
        .cr: "CR",
        .hr: "HR",
        .cs: "CS",
        .da: "DA",
        .dv: "DV",
        .nl: "NL",
        .dz: "DZ",
        .en: "EN",
        .eo: "EO",
        .et: "ET",
        .ee: "EE",
        .fo: "FO",
        .fj: "FJ",
        .fi: "FI",
        .fr: "FR",
        .ff: "FF",
        .gl: "GL",
        .ka: "KA",
        .de: "DE",
        .el: "EL",
        .gn: "GN",
        .gu: "GU",
        .ht: "HT",
        .ha: "HA",
        .he: "HE",
        .hz: "HZ",
        .hi: "HI",
        .ho: "HO",
        .hu: "HU",
        .ia: "IA",
        .id: "ID",
        .ie: "IE",
        .ga: "GA",
        .ig: "IG",
        .ik: "IK",
        .io: "IO",
        .is: "IS",
        .it: "IT",
        .iu: "IU",
        .ja: "JA",
        .jv: "JV",
        .kl: "KL",
        .kn: "KN",
        .kr: "KR",
        .ks: "KS",
        .kk: "KK",
        .km: "KM",
        .ki: "KI",
        .rw: "RW",
        .ky: "KY",
        .kv: "KV",
        .kg: "KG",
        .ko: "KO",
        .ku: "KU",
        .kj: "KJ",
        .la: "LA",
        .lb: "LB",
        .lg: "LG",
        .li: "LI",
        .ln: "LN",
        .lo: "LO",
        .lt: "LT",
        .lu: "LU",
        .lv: "LV",
        .gv: "GV",
        .mk: "MK",
        .mg: "MG",
        .ms: "MS",
        .ml: "ML",
        .mt: "MT",
        .mi: "MI",
        .mr: "MR",
        .mh: "MH",
        .mn: "MN",
        .na: "NA",
        .nv: "NV",
        .nd: "ND",
        .ne: "NE",
        .ng: "NG",
        .nb: "NB",
        .nn: "NN",
        .no: "NO",
        .ii: "II",
        .nr: "NR",
        .oc: "OC",
        .oj: "OJ",
        .cu: "CU",
        .om: "OM",
        .or: "OR",
        .os: "OS",
        .pa: "PA",
        .pi: "PI",
        .fa: "FA",
        .pl: "PL",
        .ps: "PS",
        .pt: "PT",
        .qu: "QU",
        .rm: "RM",
        .rn: "RN",
        .ro: "RO",
        .ru: "RU",
        .sa: "SA",
        .sc: "SC",
        .sd: "SD",
        .se: "SE",
        .sm: "SM",
        .sg: "SG",
        .sr: "SR",
        .gd: "GD",
        .sn: "SN",
        .si: "SI",
        .sk: "SK",
        .sl: "SL",
        .so: "SO",
        .st: "ST",
        .es: "ES",
        .su: "SU",
        .sw: "SW",
        .ss: "SS",
        .sv: "SV",
        .ta: "TA",
        .te: "TE",
        .tg: "TG",
        .th: "TH",
        .ti: "TI",
        .bo: "BO",
        .tk: "TK",
        .tl: "TL",
        .tn: "TN",
        .to: "TO",
        .tr: "TR",
        .ts: "TS",
        .tt: "TT",
        .tw: "TW",
        .ty: "TY",
        .ug: "UG",
        .uk: "UK",
        .ur: "UR",
        .uz: "UZ",
        .ve: "VE",
        .vi: "VI",
        .vo: "VO",
        .wa: "WA",
        .cy: "CY",
        .wo: "WO",
        .fy: "FY",
        .xh: "XH",
        .yi: "YI",
        .yo: "YO",
        .za: "ZA",
        .zu: "ZU"
    ]
}

// MARK: - Data

public extension LanguageCode {
    
    internal static var length: Int { return 2 }
    
    init?(data: Data) {
        guard data.count == type(of: self).length,
            let string = String(data: data, encoding: .utf8)
            else { return nil }
        self.init(stringLiteral: string)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension LanguageCode: DataConvertible {
    
    var dataLength: Int {
        return MemoryLayout<UInt16>.size
    }
    
    static func += (data: inout Data, value: LanguageCode) {
        data += value.rawValue.bigEndian
    }
}
