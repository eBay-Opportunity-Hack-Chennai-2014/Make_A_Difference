//
//  UserInfo.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *userKey;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *mentor;
@property (nonatomic, copy) NSString *cityID;
@property (nonatomic, copy) NSArray *groups;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
