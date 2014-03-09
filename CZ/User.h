//
//  User.h
//  CZ
//
//  Created by el1ven on 14-3-9.
//  Copyright (c) 2014年 el1ven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCoding>

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *email;
@property (nonatomic,copy)NSString *pwd;
@property (nonatomic,assign)int age;


@end
