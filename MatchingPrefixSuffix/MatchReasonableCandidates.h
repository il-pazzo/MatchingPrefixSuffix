//
//  MatchReasonableCandidates.h
//  MatchingPrefixSuffix
//
//  Created by Glenn on 8/20/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MatchReasonableCandidates : NSObject

+ (NSString *) findLongestMatchIn: (NSString *) string;

@end

NS_ASSUME_NONNULL_END
