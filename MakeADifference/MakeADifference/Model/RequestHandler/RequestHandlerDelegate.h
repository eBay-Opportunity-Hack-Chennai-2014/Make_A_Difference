//
//  RequestHandlerDelegate.h
//  InstantEye
//
//  Created by iBeris Software Solutions Pvt. Ltd on 18/07/14.
//  Copyright (c) 2014 iBeris. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RequestHandler;

@protocol RequestHandlerDelegate <NSObject>

- (void)requestDidSucceed:(RequestHandler *)request;

- (void)requestDidFailed:(RequestHandler *) request withError:(NSError*) error;

@end
