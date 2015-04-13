//
//  AlipayPlugin.m
//  1001YE
//
//  Created by Bochun Bai on 4/12/15.
//
//

#import "AlipayPlugin.h"
#import <AlipaySDK/AlipaySDK.h>

@implementation AlipayPlugin

@synthesize appScheme;


- (void) initAppScheme:(CDVInvokedUrlCommand*) command {
    CDVPluginResult* pluginResult = nil;

    NSString* scheme = [command.arguments objectAtIndex:0];
    if (scheme != nil) {
        self.appScheme = scheme;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void) callAlipaySDK:(CDVInvokedUrlCommand*) command {
    CDVPluginResult* pluginResult = nil;
    
    NSString* orderStr = [command.arguments objectAtIndex:0];
    if (orderStr != nil) {
        [[AlipaySDK defaultService] payOrder:orderStr fromScheme:self.appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"AlipayResult = %@",resultDic);
        }];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


@end
