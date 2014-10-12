//
//  CancellationRequest.h
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 12/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestHandler.h"
#import "Level.h"

@interface CancellationRequest : NSObject

@property (nonatomic, readwrite) Level *level;

- (instancetype)initWithLevel:(Level *)level;
- (void)startRequestWith:(NSString *)classType;

@end
