//
//  VolunteerRequest.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestHandler.h"

@class VolunteerRequest;

@protocol VolunteerRequestDelegate <NSObject>

- (void)volunteerRequestDidSucceded:(VolunteerRequest *)volunteerRequest;
- (void)volunteerRequestDidFailed:(VolunteerRequest *)VolunteerRequest withError:(NSString *)error;

@end


@interface VolunteerRequest : NSObject <RequestHandlerDelegate> {
    RequestHandler *requestHandler;
}

- (instancetype)initWithDelegate:(id<VolunteerRequestDelegate> )delegate;
@property (nonatomic, readwrite) __weak id<VolunteerRequestDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *volunteerArray;
- (void)startRequest;

@end
