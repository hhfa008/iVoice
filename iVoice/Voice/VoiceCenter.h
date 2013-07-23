//
//  VoiceCenter.h
//  iVoice
//
//  Created by luo lei on 13-7-22.
//  Copyright (c) 2013年 hhfa008. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Voice.h"
#import "NSMutableArray+VoiceQueue.h"

@interface VoiceCenter : NSObject <VoiceDelegate>
{
    NSMutableArray* queue;
    NSURL *recordedFile;
}

-(void)start;
-(void)startAtIndex:(int)index;

@end
