//
//  MyVoice.m
//  iVoice
//
//  Created by luo lei on 13-7-22.
//  Copyright (c) 2013年 hhfa008. All rights reserved.
//

#import "MyVoice.h"

@implementation MyVoice

-(id) initWithPlayer:(id)p
{
    self = [super initWithPlayer:p];
    if (self) {
        player = p;
        player.delegate  = self;
        self.index = 2;
    }
    return self;
}

-(BOOL)start
{
    if ([self.delegate canStartVoice:self]) {
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"RecordedFile"]] error:nil];
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
        [player stop];
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
    [player stop];
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
