//
//  MillisecondTimer.h
//  MatchingPrefixSuffix
//
//  Created by Glenn on 8/20/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MicrosecondTimer : NSObject

- (long long) microsecondsSinceStart;
- (long long) microsecondsSinceLast;
- (void) reset;

@end

NS_ASSUME_NONNULL_END
