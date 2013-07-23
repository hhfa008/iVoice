//
//  Voice.m
//  iVoice
//
//  Created by luo lei on 13-7-22.
//  Copyright (c) 2013年 hhfa008. All rights reserved.
//

#import "Voice.h"

@implementation Voice

- (id)initWithPlayer:(id)p
{
    self = [super init];
    {
        self.range = NSMakeRange(0, 10);
    }

    return self;
}

-(BOOL)start
{
    return NO;
}

-(BOOL)stop
{
    return NO;
}

-(BOOL)pause
{
    return NO;
}

-(BOOL)reset
{
   return NO; 
}

-(BOOL)abort
{
    return NO;
}

@end
