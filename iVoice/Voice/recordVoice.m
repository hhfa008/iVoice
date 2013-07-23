//
//  recordVioce.m
//  iVoice
//
//  Created by luo lei on 13-7-22.
//  Copyright (c) 2013年 hhfa008. All rights reserved.
//

#import "recordVoice.h"

@implementation recordVoice

-(id) initWithPlayer:(id)p
{
      self = [super initWithPlayer:p];

    if (self) {
       recorder = p;
       self.index = 1;
    }

    return self;
}

-(BOOL)start
{
    recorder.meteringEnabled = YES;
    [recorder prepareToRecord];
    [recorder record];
    timer = [NSTimer scheduledTimerWithTimeInterval:self.range.length target:self selector:@selector(timeout) userInfo:nil repeats:YES];

    mictimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(detectionVoice) userInfo:nil repeats:YES];

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
        [recorder stop];
        [mictimer invalidate];
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
    [recorder stop];
    [mictimer invalidate];
    return NO;
}

- (void)detectionVoice
{
    [recorder updateMeters];//刷新音量数据
    //获取音量的平均值  [recorder averagePowerForChannel:0];
    //音量的最大值  [recorder peakPowerForChannel:0];
    double a =  pow(10, (0.05 * [recorder averagePowerForChannel:0]));
    NSLog(@"%lf", a);
    if (a <= 0.010) {
        NSLog(@"play %lf", a);
//        if ([self.delegate shouldVoice:self endWith:@{@"nosie": @(a)}]) {
//            [recorder stop];
//            [self.delegate didVoice:self endWith:nil];
//        }
    }
    //最大50  0
    //图片 小-》大
}

@end
