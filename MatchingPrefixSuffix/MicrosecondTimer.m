//
//  MillisecondTimer.m
//  MatchingPrefixSuffix
//
//  Created by Glenn on 8/20/22.
//

#import "MicrosecondTimer.h"
#include <sys/time.h>

@interface MicrosecondTimer ()

- (long long) now;

@end

@implementation MicrosecondTimer

struct timeval te;
long long startTimeUs;
long long lastCheckUs;

- (instancetype) init
{
    if( self = [super init] ) {
        startTimeUs = [self now];
        lastCheckUs = startTimeUs;
    }
    return self;
}
- (void) reset
{
    startTimeUs = [self now];
    lastCheckUs = startTimeUs;
}
- (long long) now
{
    long long result;
    
    gettimeofday(&te, NULL); // get current time
    result = te.tv_sec*1000000LL + te.tv_usec; // calculate microseconds
    // printf("microseconds: %lld\n", milliseconds);
    
    return result;
}
- (long long) microsecondsSinceStart
{
    return [self now] - startTimeUs;
}
- (long long) microsecondsSinceLast
{
    long long now = [self now];
    long long result = now - lastCheckUs;
    lastCheckUs = now;
    
    return result;
}

@end
