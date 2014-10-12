//
//  Substitute.h
//  MakeADifference
//
//  Created by iBeris Software Solutions Pvt. Ltd on 12/10/14.
//  Copyright (c) 2014 venkatachalam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Substitute : NSObject

@property (nonatomic, copy) NSString *substituteId;
@property (nonatomic, copy) NSString *substituteName;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
