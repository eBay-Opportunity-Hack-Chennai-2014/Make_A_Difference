//
//  SharedSingleton.h
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"
@interface SharedSingleton : NSObject

// returns single instance of this class.
+ (SharedSingleton *)singleton;

@property (nonatomic, strong) UserInfo *userInfo;

@end
