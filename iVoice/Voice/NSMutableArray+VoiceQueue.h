//
//  NSMutableArray+VoiceQueue.h
//  iVoice
//
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (VoiceQueue)
-(id) addVoice:(id)voice delegate:(id)d;
-(id) dequeue;
-(void) enqueue:(id)obj;
-(id) peek:(int)index;
-(id) peekHead;
-(id) peekTail;
-(BOOL) empty;
@end
