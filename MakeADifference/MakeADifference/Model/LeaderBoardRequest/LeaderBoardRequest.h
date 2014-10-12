//
//  LeaderBoardRequest.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/12/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestHandler.h"

@class LeaderBoardRequest;

@protocol LeaderBoardRequestDelegate <NSObject>

- (void)leaderBoardRequestDidSucceded:(LeaderBoardRequest *)leaderBoardRequest;
- (void)leaderBoardRequesttDidFailed:(LeaderBoardRequest *)leaderBoardRequest withError:(NSString *)error;

@end


@interface LeaderBoardRequest : NSObject{
    RequestHandler *requestHandler;
    
}

- (instancetype)initWithDelegate:(id<LeaderBoardRequestDelegate> )delegate;
@property (nonatomic, readwrite) __weak id<LeaderBoardRequestDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *creditsArray;
- (void)startRequest;

@end
