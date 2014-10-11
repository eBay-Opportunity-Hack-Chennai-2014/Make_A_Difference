//
//  RequestHandler.h
//  InstantEye
//
//  Created by iBeris Software Solutions Pvt. Ltd on 18/07/14.
//  Copyright (c) 2014 iBeris. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestHandlerDelegate.h"

@interface RequestHandler : NSObject {
    
    id<RequestHandlerDelegate> _delegate;
    NSURLConnection *_connection;
    NSMutableURLRequest *_request;
    NSMutableData *_data;
    NSMutableDictionary *_postParameters;
    NSMutableString *_postString;
    id _responseData;
    NSString *_status;
    NSString *_message;
}

@property (nonatomic, readwrite, strong) id<RequestHandlerDelegate> delegate;
@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, readonly) id responseData;
@property (nonatomic,readonly) NSString *status;

-(id)initWithURL:(NSURL*)url delegate:(id) delegate;

- (void)getRequest;

-(void)startRequest;

-(void)setParameter:(id)parameter forKey:(NSString*) key;

-(void)cancel;

@end
