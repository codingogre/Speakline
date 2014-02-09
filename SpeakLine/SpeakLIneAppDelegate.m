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
        // Test Git integration
        // Logs can help the beginner understand what
        // is happening and hunt down bugs.
        NSLog(@"init");
        // Create a new instance of NSSpeechSynthesizer
        // with the default voice.
        _speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
        _voices = [NSSpeechSynthesizer availableVoices];
        
        [_speechSynth setDelegate:self];
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
    
    [_stopButton setEnabled:true];
    [_speakButton setEnabled:false];
    [_tableView setEnabled:false];
    
}

- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender
        didFinishSpeaking:(BOOL)finishedSpeaking
{
    [_speakButton setEnabled:true];
    [_stopButton setEnabled:false];
    [_tableView setEnabled:true];
    NSLog(@"finishedSpeaking = %d", finishedSpeaking);
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tv
{
    return (NSInteger)[_voices count];
}

- (id)tableView:(NSTableView *)tv objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSString *v = [_voices objectAtIndex:row];
    NSDictionary *dict = [NSSpeechSynthesizer attributesForVoice:v];
    //NSInteger row = [_tableView selectedRow];
    return [dict objectForKey:NSVoiceName];
}

- (void)tableViewSelectionDidChange:(NSNotification *)notification
{
    NSInteger row = [_tableView selectedRow];
    if (row == -1)
    {
        return;
    }
    NSString *selectedVoice = [_voices objectAtIndex:row];
    [_speechSynth setVoice:selectedVoice];
    NSLog(@"new voice = %@", selectedVoice);
}

- (void)awakeFromNib
{
    // When the table view appears on screen, the default voice should be selected
    NSInteger defaultRow = [_voices indexOfObject:[NSSpeechSynthesizer defaultVoice]];
    NSIndexSet *indices = [NSIndexSet indexSetWithIndex:defaultRow];
    [_tableView selectRowIndexes:indices byExtendingSelection:NO];
    [_tableView scrollRowToVisible:defaultRow];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    NSString *methodName = NSStringFromSelector(aSelector);
    NSLog(@"respondsToSelector:%@", methodName);
    return [super respondsToSelector:aSelector];
}

@end
