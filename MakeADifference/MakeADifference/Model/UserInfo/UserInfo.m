//
//  UserInfo.m
//  MakeADifference
//
//  Created by Venkatachalam perumal on 10/11/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super self];
    
    if (self) {
        self.userID = [dictionary objectForKey:@"user_id"];
        self.mentor = [dictionary objectForKey:@"mentor"];
        self.userName = [dictionary objectForKey:@"name"];
        self.userKey = [dictionary objectForKey:@"key"];
        self.cityID = [dictionary objectForKey:@"city_id"];
        self.groups = [dictionary objectForKey:@"groups"];
    }
    return self;
}

#pragma mark - NSCoding support

-(void)encodeWithCoder:(NSCoder*)encoder {
    
    [encoder encodeObject:self.userID forKey:@"user_id"];
    [encoder encodeObject:self.mentor forKey:@"mentor"];
    [encoder encodeObject:self.userName forKey:@"name"];
    [encoder encodeObject:self.userKey forKey:@"key"];
    [encoder encodeObject:self.cityID forKey:@"cityID"];
    [encoder encodeObject:self.groups forKey:@"groups"];
}

-(id)initWithCoder:(NSCoder*)decoder {
    
    self.userID = [decoder decodeObjectForKey:@"user_id"];
    self.mentor = [decoder decodeObjectForKey:@"mentor"];
    self.userName = [decoder decodeObjectForKey:@"name"];
    self.userKey = [decoder decodeObjectForKey:@"key"];
    self.userName = [decoder decodeObjectForKey:@"id"];
    self.cityID = [decoder decodeObjectForKey:@"cityID"];
    self.groups = [decoder decodeObjectForKey:@"groups"];
    return self;
}

@end
