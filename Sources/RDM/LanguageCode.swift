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
public enum LanguageCode: String, Equatable, CaseIterable {
    
    case ab = "AB"
    case aa = "AA"
    case af = "AF"
    case ak = "AK"
    case sq = "SQ"
    case am = "AM"
    case ar = "AR"
    case an = "AN"
    case hy = "HY"
    case `as` = "AS"
    case av = "AV"
    case ae = "AE"
    case ay = "AY"
    case az = "AZ"
    case bm = "BM"
    case ba = "BA"
    case eu = "EU"
    case be = "BE"
    case bn = "BN"
    case bh = "BH"
    case bi = "BI"
    case bs = "BS"
    case br = "BR"
    case bg = "BG"
    case my = "MY"
    case ca = "CA"
    case ch = "CH"
    case ce = "CE"
    case ny = "NY"
    case zh = "ZH"
    case cv = "CV"
    case kw = "KW"
    case co = "CO"
    case cr = "CR"
    case hr = "HR"
    case cs = "CS"
    case da = "DA"
    case dv = "DV"
    case nl = "NL"
    case dz = "DZ"
    case en = "EN"
    case eo = "EO"
    case et = "ET"
    case ee = "EE"
    case fo = "FO"
    case fj = "FJ"
    case fi = "FI"
    case fr = "FR"
    case ff = "FF"
    case gl = "GL"
    case ka = "KA"
    case de = "DE"
    case el = "EL"
    case gn = "GN"
    case gu = "GU"
    case ht = "HT"
    case ha = "HA"
    case he = "HE"
    case hz = "HZ"
    case hi = "HI"
    case ho = "HO"
    case hu = "HU"
    case ia = "IA"
    case id = "ID"
    case ie = "IE"
    case ga = "GA"
    case ig = "IG"
    case ik = "IK"
    case io = "IO"
    case `is` = "IS"
    case it = "IT"
    case iu = "IU"
    case ja = "JA"
    case jv = "JV"
    case kl = "KL"
    case kn = "KN"
    case kr = "KR"
    case ks = "KS"
    case kk = "KK"
    case km = "KM"
    case ki = "KI"
    case rw = "RW"
    case ky = "KY"
    case kv = "KV"
    case kg = "KG"
    case ko = "KO"
    case ku = "KU"
    case kj = "KJ"
    case la = "LA"
    case lb = "LB"
    case lg = "LG"
    case li = "LI"
    case ln = "LN"
    case lo = "LO"
    case lt = "LT"
    case lu = "LU"
    case lv = "LV"
    case gv = "GV"
    case mk = "MK"
    case mg = "MG"
    case ms = "MS"
    case ml = "ML"
    case mt = "MT"
    case mi = "MI"
    case mr = "MR"
    case mh = "MH"
    case mn = "MN"
    case na = "NA"
    case nv = "NV"
    case nd = "ND"
    case ne = "NE"
    case ng = "NG"
    case nb = "NB"
    case nn = "NN"
    case no = "NO"
    case ii = "II"
    case nr = "NR"
    case oc = "OC"
    case oj = "OJ"
    case cu = "CU"
    case om = "OM"
    case or = "OR"
    case os = "OS"
    case pa = "PA"
    case pi = "PI"
    case fa = "FA"
    case pox = "POX"
    case pl = "PL"
    case ps = "PS"
    case pt = "PT"
    case qu = "QU"
    case rm = "RM"
    case rn = "RN"
    case ro = "RO"
    case ru = "RU"
    case sa = "SA"
    case sc = "SC"
    case sd = "SD"
    case se = "SE"
    case sm = "SM"
    case sg = "SG"
    case sr = "SR"
    case gd = "GD"
    case sn = "SN"
    case si = "SI"
    case sk = "SK"
    case sl = "SL"
    case so = "SO"
    case st = "ST"
    case es = "ES"
    case su = "SU"
    case sw = "SW"
    case ss = "SS"
    case sv = "SV"
    case ta = "TA"
    case te = "TE"
    case tg = "TG"
    case th = "TH"
    case ti = "TI"
    case bo = "BO"
    case tk = "TK"
    case tl = "TL"
    case tn = "TN"
    case to = "TO"
    case tr = "TR"
    case ts = "TS"
    case tt = "TT"
    case tw = "TW"
    case ty = "TY"
    case ug = "UG"
    case uk = "UK"
    case ur = "UR"
    case uz = "UZ"
    case ve = "VE"
    case vi = "VI"
    case vo = "VO"
    case wa = "WA"
    case cy = "CY"
    case wo = "WO"
    case fy = "FY"
    case xh = "XH"
    case yi = "YI"
    case yo = "YO"
    case za = "ZA"
    case zu = "ZU"
    
    public static var length: Int { return 2 }
}

// MARK: - Data

public extension LanguageCode {
    
    init?(data: Data) {
        guard data.count == type(of: self).length,
            let string = String(data: data, encoding: .utf8)
            else { return nil }
        self.init(rawValue: string)
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
        let languageCode = value.rawValue
                           .prefix(type(of: value).length)
                           .utf8
        data.append(contentsOf: languageCode)
    }
}
