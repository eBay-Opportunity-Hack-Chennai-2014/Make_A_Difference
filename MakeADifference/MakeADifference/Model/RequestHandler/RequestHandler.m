//
//  RequestHandler.m
//  InstantEye
//
//  Created by iBeris Software Solutions Pvt. Ltd on 18/07/14.
//  Copyright (c) 2014 iBeris. All rights reserved.
//

#import "RequestHandler.h"

#define TIMEOUT_INTERVAL       25.0

@implementation RequestHandler

- (id)initWithURL:(NSURL *)url delegate:(id)delegate {
  
    self = [super init];
  
    if (self) {
    
        _request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:TIMEOUT_INTERVAL];
        _delegate = delegate;
        _postParameters = [[NSMutableDictionary alloc] init];
         _postString = [[NSMutableString alloc] init];
    }
  
    return self;
}
//
//- (void)setParameter:(id)parameter forKey:(NSString *)key {
//  
//    [_postParameters setObject:parameter forKey:key];
//}

-(void)setParameter:(id)parameter forKey:(NSString *)key {
    if (_postString.length == 0) {
        [_postString appendFormat:@"%@=%@",key,parameter];
    } else {
        [_postString appendFormat:@"&%@=%@",key,parameter];
    }
}
- (void)getRequest {
    

    [_request setHTTPMethod:@"POST"];
    [_request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    _connection = [[NSURLConnection alloc] initWithRequest:_request delegate:self startImmediately:TRUE];
}


- (void)startRequest {
  
    NSError *error;
    NSData *postdata = [NSJSONSerialization dataWithJSONObject:_postParameters options:NSJSONWritingPrettyPrinted error:&error];
    NSLog(@"-->%@", _postParameters);
    [_request setHTTPMethod:@"POST"];
    [_request setHTTPBody:[_postString dataUsingEncoding:NSUTF8StringEncoding]];
    _connection = [[NSURLConnection alloc] initWithRequest:_request delegate:self startImmediately:TRUE];
}

- (void)cancel {
  
    if (_connection) {
    
        [_connection cancel];
        _connection = nil;
        _request = nil;
        _data = nil;
    }
}


@synthesize delegate = _delegate;
@synthesize responseData = _responseData;

- (void)requestSucceeded {
  
    if (_delegate){
        [_delegate requestDidSucceed:self];
    }
}

- (void)requestFailed:(NSError*) error {
  
    if (_delegate) {
        [_delegate requestDidFailed:self withError:error];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
  
    _data = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
  
    [_data appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
  
    [self performSelectorOnMainThread:@selector(requestFailed:) withObject:error waitUntilDone:FALSE];
  
    _data = nil;
  
    _connection = nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {  
  
    NSString *stringValue = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *serverData = nil;
  
    @try
    {
        serverData =  [NSJSONSerialization JSONObjectWithData:[stringValue dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error];
        if (![serverData isKindOfClass:[NSDictionary class]])
        {
            error = [NSError errorWithDomain:@"JsonParseError" code:0 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Our server didnt understand your request.  Try again.", @"message", nil]];
            serverData = nil;
        }
    }
    @catch (NSException *exception)
    {
        error = [NSError errorWithDomain:@"JsonParseError" code:0 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Error processing server data", @"message", nil]];
    }
  
    _responseData = serverData;
    _status = [serverData objectForKey:@"status"];
    
    if (_status.intValue) {
        
        [self performSelectorOnMainThread:@selector(requestSucceeded) withObject:nil waitUntilDone:FALSE];
    } else {
        
        error = [NSError errorWithDomain:@"Error" code:0 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[serverData objectForKey:@"ResponseMessage"], @"message", nil]];
        [self performSelectorOnMainThread:@selector(requestFailed:) withObject:error waitUntilDone:FALSE];
    }
  
    _data = nil;
  
    _connection = nil;
  
}


@end
