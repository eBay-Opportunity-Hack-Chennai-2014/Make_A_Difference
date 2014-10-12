//
//  SharedSingleton.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "SharedSingleton.h"

@implementation SharedSingleton

+ (SharedSingleton *)singleton {
    static SharedSingleton* singleton = nil;
    
    if (singleton == nil) {
        singleton = [[SharedSingleton alloc] init];
    }
    
    return singleton;
}

// Initializer method.
- (id)init {
    
    self = [super init];
    if (self) {
       _userInfo = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"userinfo"]];
    }
    
    return self;
}

- (void)setUserInfo:(UserInfo *)userInfo {
    
    _userInfo = userInfo;
    [[NSUserDefaults standardUserDefaults] setObject:[NSKeyedArchiver archivedDataWithRootObject:_userInfo] forKey:@"userinfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
@end
