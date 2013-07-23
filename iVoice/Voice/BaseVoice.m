//
//  BaseVoice.m
//  iVoice
//
//  Created by luo lei on 13-7-22.
//  Copyright (c) 2013年 hhfa008. All rights reserved.
//

#import "BaseVoice.h"

@implementation BaseVoice

-(id) initWithPlayer:(id)p
{
    self = [super initWithPlayer:p];
    if (self) {
        player = p;
        player.delegate  = self;
        self.index = 0;
    }
    return self;
}

-(BOOL)start
{
    if ([self.delegate canStartVoice:self]) {
        [player play];
        timer = [NSTimer scheduledTimerWithTimeInterval:self.range.length target:self selector:@selector(timeout) userInfo:nil repeats:YES];
        return YES;
    }
    return NO;
}

-(void)timeout
{
    [timer invalidate];
    [self stop];
}

-(BOOL)stop
{
    if ([self.delegate shouldVoice:self endWith:nil]) {
        [player pause];
        [self.delegate didVoice:self endWith:nil];
        return YES;
    }
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
    [timer invalidate];
    [player pause];
    return NO;
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self.delegate didVoice:self endWith:nil];
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
    
}

@end
