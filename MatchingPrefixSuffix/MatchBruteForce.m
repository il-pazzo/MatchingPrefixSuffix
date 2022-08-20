//
//  MatchBruteForce.m
//  MatchingPrefixSuffix
//
//  Created by Glenn on 8/20/22.
//
//  Strategy:
//  Try every prefix against the suffix, starting with the longest

#import "MatchBruteForce.h"

@implementation MatchBruteForce

+ (NSString *) findLongestMatchIn: (NSString *) string
{
    if( string == nil  ||  string.length <= 1 ) {
        return @"";
    }
    
    NSInteger lengthToCheck = string.length / 2;
    NSString * prefix;
    
    for( NSInteger i = lengthToCheck - 1; i >= 0; i-- ) {
        
        prefix = [string substringToIndex: i + 1];
        
        if( [string hasSuffix: prefix] ) {
            return prefix;
        }
    }
    
    return @"";
}

@end
