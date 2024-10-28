//
//  ArutanaConstants.h
//  Arutana
//
//  Created by MacBookPro002 on 2024/05/23.
//

#ifndef ArutanaConstants_h
#define ArutanaConstants_h

#define kArutanaSDKVerion @"0.0.11"

typedef NS_ENUM(NSUInteger, ArutanaAdType) {
    ArutanaAdType_Sp = 0
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

typedef NS_ENUM(NSUInteger, kArutanaVEnv) {
    Arutana_ENV_PRODUCTION,
    Arutana_ENV_TEST,
    Arutana_ENV_DEVELOPMENT
};

typedef NS_ENUM(NSUInteger, kArutanaVPreloadType) {
    kArutanaVPreloadTypeMeta,
    kArutanaVPreloadTypeAll
};

#endif /* ArutanaConstants_h */
