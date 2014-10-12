//
//  SubstituteRequest.h
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 12/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestHandler.h"

@class SubstituteRequest;

@protocol SubstituteRequestDelegate <NSObject>

- (void)substituteRequestDidSucceded:(SubstituteRequest *)substituteRequest;
- (void)substituteRequestdidFailed:(SubstituteRequest *)substituteRequest withError:(NSString *)error;

@end
@interface SubstituteRequest : NSObject

@property (nonatomic, readwrite) NSMutableArray *teachers;

@property (nonatomic, weak) id<SubstituteRequestDelegate> delegate;

- (instancetype)initWithDelegate:(id<SubstituteRequestDelegate>)delegate;
- (void)startRequest;


@end
