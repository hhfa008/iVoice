//
//  VoiceCenter.m
//  iVoice
//
//  Created by luo lei on 13-7-22.
//  Copyright (c) 2013年 hhfa008. All rights reserved.
//

#import "VoiceCenter.h"
#import "BaseVoice.h"
#import "recordVoice.h"
#import "MyVoice.h"
@implementation VoiceCenter

- (id)init
{
    self = [super init];
    if (self) {
         recordedFile = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"RecordedFile"]];
        queue = [NSMutableArray arrayWithCapacity:3];
    }

    AVAudioSession *session = [AVAudioSession sharedInstance];

    NSError *sessionError;
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];

    if(session == nil)
        NSLog(@"Error creating session: %@", [sessionError description]);
    else
        [session setActive:YES error:nil];

    AVAudioPlayer* base = [[AVAudioPlayer alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"1" withExtension:@"mp3"] error:nil];
    Voice* v = [[BaseVoice alloc] initWithPlayer:base];
    v.delegate = self;
    [queue enqueue:v];

    AVAudioRecorder* recorder = [[AVAudioRecorder alloc] initWithURL:recordedFile settings:nil error:nil];

    v = [[recordVoice alloc] initWithPlayer:recorder];
    v.delegate = self;
    [queue enqueue:v];
    
    AVAudioPlayer* my = [[AVAudioPlayer alloc] initWithContentsOfURL:recordedFile error:nil];
    v = [[MyVoice alloc] initWithPlayer:my];
    v.delegate = self;
    [queue enqueue:v];

    return self;
}

-(void)start
{
    Voice* player = [queue peekHead];
    [player start];
}

-(void)startAtIndex:(int)index
{
    if (index == 3) {
        return;
        
    }
    Voice* player = [queue peekHead];
    if (player.index != index) {
        [player abort];
        [queue dequeue];
        [queue enqueue:player];
    }

    player = [queue peekHead];
    if (player.index != index) {
        [queue dequeue];
        [queue enqueue:player];
    }

    player = [queue peekHead];
    if (player.index != index) {
        [queue dequeue];
        [queue enqueue:player];
    }
    [self start];
}

-(BOOL)canStartVoice:(Voice*)voice
{
    return YES;
}

-(BOOL)shouldVoice:(Voice*)voice interruptBy:(id)flag
{
    return YES;
}

-(BOOL)shouldVoice:(Voice*)voice endWith:(id)flag
{
    return YES;
}

-(BOOL)didVoice:(Voice*)voice endWith:(id)flag
{
    [queue dequeue];
    [queue enqueue:voice];
    [self start];
    return YES;
}


@end
