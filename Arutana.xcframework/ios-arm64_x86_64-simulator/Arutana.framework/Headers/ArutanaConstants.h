//
//  ArutanaConstants.h
//  Arutana
//
//  Created by MacBookPro002 on 2024/05/23.
//

#ifndef ArutanaConstants_h
#define ArutanaConstants_h

typedef NS_ENUM(NSUInteger, ArutanaAdType) {
    ArutanaAdType_Sp = 0,
    ArutanaAdType_Large,
    ArutanaAdType_Rect,
    ArutanaAdType_Tablet,
    ArutanaAdType_Free
};

typedef NS_ENUM(NSUInteger, kArutanaErrorCode) {
    kArutanaErrorCodeUnknown,
    kArutanaErrorCodeCommunicationError,
    kArutanaErrorCodeReceivedFiller,
    kArutanaErrorCodeNoAd,
    kArutanaErrorCodeNeedConnection,
    kArutanaErrorCodeExceedLimit,
    kArutanaErrorCodeTemplateFailed
};

#endif /* ArutanaConstants_h */
