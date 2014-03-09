//
//  User.m
//  CZ
//
//  Created by el1ven on 14-3-9.
//  Copyright (c) 2014年 el1ven. All rights reserved.
//

#import "User.h"

//宏定义
#define AGE @"age"
#define NAME @"name"
#define EMAIL @"email"
#define PWD @"pwd"

@implementation User

//对属性进行编码，归档的时候调用
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInt:_age forKey:AGE];
    [aCoder encodeObject:_name forKey:NAME];
    [aCoder encodeObject:_email forKey:EMAIL];
    [aCoder encodeObject:_pwd forKey:PWD];
    
}

//对属性进行解码，解归档的时候就会调用,当对象初始化的时候进行解码
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        self.age = [aDecoder decodeIntForKey:AGE];
        self.name = [aDecoder decodeObjectForKey:NAME];
        self.email = [aDecoder decodeObjectForKey:EMAIL];
        self.pwd = [aDecoder decodeObjectForKey:PWD];
       
    }
    return self;
    
}

@end
