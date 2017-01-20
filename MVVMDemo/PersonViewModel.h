//
//  PersonViewModel.h
//  MVVMDemo
//
//  Created by buoumall on 2017/1/20.
//  Copyright © 2017年 buoumall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface PersonViewModel : NSObject

- (instancetype)initWithPerson:(Person *)person;

@property (nonatomic, strong, readonly) Person *person;
@property (nonatomic, copy, readonly) NSString *nameText;
@property (nonatomic, copy, readonly) NSString *birthdateText;

@end
