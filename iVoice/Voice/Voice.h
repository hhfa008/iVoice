//
//  Voice.h
//  iVoice
//
//  Created by luo lei on 13-7-22.
//  Copyright (c) 2013年 hhfa008. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@class Voice;

@protocol VoiceDelegate <NSObject>

-(BOOL)canStartVoice:(Voice*)voice;
-(BOOL)shouldVoice:(Voice*)voice interruptBy:(id)flag;
-(BOOL)shouldVoice:(Voice*)voice endWith:(id)flag;
-(BOOL)didVoice:(Voice*)voice endWith:(id)flag;
@end

@interface Voice : NSObject
{
}
-(id) initWithPlayer:(id)p;
-(BOOL)start;
-(BOOL)stop;
-(BOOL)pause;
-(BOOL)reset;
-(BOOL)abort;

@property NSRange range;
@property int index;

@property (assign) id<VoiceDelegate> delegate;

@end
