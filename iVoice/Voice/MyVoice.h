//
//  MyVoice.h
//  iVoice
//
//  Created by luo lei on 13-7-22.
//  Copyright (c) 2013年 hhfa008. All rights reserved.
//

#import "Voice.h"

@interface MyVoice :Voice <AVAudioPlayerDelegate>
{
    AVAudioPlayer* player;
    NSTimer* timer;
}

@end
