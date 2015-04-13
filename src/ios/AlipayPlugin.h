//
//  AlipayPlugin.h
//  1001YE
//
//  Created by Bochun Bai on 4/12/15.
//
//

#import <Cordova/CDVPlugin.h>

@interface AlipayPlugin : CDVPlugin

@property (nonatomic, strong) NSString* appScheme;

- (void) initAppScheme:(NSString*) scheme;
- (void) callAlipaySDK:(NSString*) orderStr;

@end
