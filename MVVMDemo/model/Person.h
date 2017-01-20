//
//  Person.h
//  MVVMDemo
//
//  Created by buoumall on 2017/1/20.
//  Copyright © 2017年 buoumall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (instancetype)initwithSalutation:(NSString *)salutation firstName:(NSString *)firstName lastName:(NSString *)lastName birthdate:(NSDate *)birthdate;

@property (nonatomic, copy, readonly) NSString *salutation;
@property (nonatomic, copy, readonly) NSString *firstName;
@property (nonatomic, copy, readonly) NSString *lastName;
@property (nonatomic, copy, readonly) NSDate *birthdate;

@end
