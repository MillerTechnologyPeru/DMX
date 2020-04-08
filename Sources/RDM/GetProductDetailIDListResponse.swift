//
//  GetProductDetailIDListResponse.swift
//
//
//  Created by Jorge Loc Rubio on 4/8/20.
//

import Foundation

/**
 This parameter shall be used for requesting technology details for a device.
 The response is a packed message containing up to six product detail identifications.
 Product Detail ID’s are defined in `ProductDetail`.
 
 Product details supplement the Product Category obtained using the `DEVICE_INFO` parameter as described in `GetDeviceInfo`.
 
 Product Detail information may be used by the controller for grouping or other sorting methods when patching or displaying system information.
 Not all Product Detail definitions may be appropriate for all Product Categories.
 
 This standard does not place any restrictions on the use of Product Categories and Product Detail, which are intended to convey general information about the product to the controller.
 Devices fitted with Residual Current Detectors (RCD) or Ground Fault Interrupt (GFI) devices may declare such functionality using this PID.
*/
public struct GetProductDetailIDListResponse: MessageDataBlockProtocol, Equatable, Hashable {
    
    // MARK: - Properties
    
    public static var commandClass: CommandClass { return .getResponse }
    
    public static var parameterID: ParameterID { return .productDetail }
    
    public let productDetailIDs: [ProductDetail]
    
    // MARK: - Initialization
    
    public init(productDetailIDs: [ProductDetail]) {
        assert(productDetailIDs.count > 0)
        self.productDetailIDs = productDetailIDs
    }
}

// MARK: - Data

public extension GetProductDetailIDListResponse {
    
    init?(data: Data) {
        guard data.count % ProductDetail.length == 0
            else { return nil }
        let count = data.count / ProductDetail.length
        let productDetailIDs = (0 ..< count)
            .map{ $0 * ProductDetail.length ..< ($0 + 1) * ProductDetail.length }
            .compactMap{ ProductDetail(data: data.subdataNoCopy(in: $0)) }
        assert(productDetailIDs.count == count)
        self.init(productDetailIDs: productDetailIDs)
    }
    
    var data: Data {
        return Data(self)
    }
}

// MARK: - DataConvertible

extension GetProductDetailIDListResponse: DataConvertible {
    
    var dataLength: Int {
        return productDetailIDs.count * ProductDetail.length
    }
    
    static func += (data: inout Data, value: GetProductDetailIDListResponse) {
        value.productDetailIDs.forEach { data += $0 }
    }
}
