//
//  SpeakLIneAppDelegate.m
//  SpeakLine
//
//  Created by Shawn Hooton on 1/22/14.
//  Copyright (c) 2014 Sixpanel LLC. All rights reserved.
//

#import "SpeakLIneAppDelegate.h"

@implementation SpeakLIneAppDelegate

@synthesize window = _window;
@synthesize textField = _textField;

- (id)init {
    self = [super init];
    if (self) {
        // Logs can help the beginner understand what
        // is happening and hunt down bugs.
        NSLog(@"init");
        // Create a new instance of NSSpeechSynthesizer
        // with the default voice.
        _speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
    }
    return self;
}

- (IBAction)stopIt:(id)sender {
    NSLog(@"stopping");
    [_speechSynth stopSpeaking];
}

- (IBAction)sayIt:(id)sender {
    NSString *string = [_textField stringValue];
    // Is the string zero-length?
    if ([string length] == 0) {
        NSLog(@"string from %@ is of zero-length", _textField);
        return; }
    [_speechSynth startSpeakingString:string];
    NSLog(@"Have started to say: %@", string);
}

@end
