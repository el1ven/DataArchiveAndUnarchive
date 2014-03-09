//
//  main.m
//  CZ
//
//  Created by el1ven on 14-2-21.
//  Copyright (c) 2014年 el1ven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        //运行其中一段代码要注释掉其他代码，因为有些变量名字是重复使用的
 //---------------------------第一种归档方式-----------------------------
        
        //归档
        NSArray *arr = @[@"123",@"abc",@456];
        NSString *homePath = NSHomeDirectory();
        NSString *path = [homePath stringByAppendingString:@"/DeskTop/test.txt"];
        BOOL success = [NSKeyedArchiver archiveRootObject:arr toFile:path];
        if(success){
            NSLog(@"Archive Successfully!");
        }
        
        
        //解归档
        NSString *homePath = NSHomeDirectory();
        NSString *path = [homePath stringByAppendingString:@"/DeskTop/test.arc"];
        NSArray *arr = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        NSLog(@"解归档的数组为：%@",arr);
        
        
        
//----------------------------第二种归档方式-------------------------------
        //归档对象
    
        NSArray *arr = @[@"123",@"456"];
        NSString *homePath = NSHomeDirectory();
        NSString *path = [homePath stringByAppendingString:@"/DeskTop/lily.arc"];//创建归档文件
        NSMutableData *data = [NSMutableData data];
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
        [archiver encodeInt:100 forKey:@"age"];
        [archiver encodeObject:arr forKey:@"name"];
        [archiver finishEncoding];
        
        BOOL success = [data writeToFile:path atomically:YES];//archiver先操纵data,data在把存储的数据写到文件中
        
        if (success) {
            NSLog(@"write successfully!");
        }
     
    
        
        //解归档对象
        
        NSString *homePath = NSHomeDirectory();
        NSString *path = [homePath stringByAppendingString:@"/DeskTop/lily.arc"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        int age = [unArchiver decodeIntForKey:@"age"];
        NSArray *name = [unArchiver decodeObjectForKey:@"name"];
        NSLog(@"age:%d",age);
        NSLog(@"arr:%@",name);
        
        
        
        
        
        
        
        //---------------自定义User类对象的归档与解归档实例--------------------
        //初始化对象
        User *user = [[User alloc]init];
        user.age = 22;
        user.name = @"jack";
        user.email = @"123@qq.com";
        user.pwd = @"1234";
        
        //归档
        NSString *homePath = NSHomeDirectory();
        NSString *path = [homePath stringByAppendingString:@"/Desktop/haha.arc"];
        BOOL success = [NSKeyedArchiver archiveRootObject:user toFile:path];
        if (success) {
            NSLog(@"Archiver Success!");
        }
        
        
        //解归档
        NSString *homePath = NSHomeDirectory();
        NSString *path = [homePath stringByAppendingString:@"/Desktop/haha.arc"];
        User *user2 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        NSLog(@"解归档的结果为user2: age: %d, email:%@",user2.age,user2.email);
        
        
        
        
        
        
        
        
        
      
        
        
        
       
    }
    
    
    return 0;
}

