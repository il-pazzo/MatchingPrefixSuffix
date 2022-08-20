//
//  MatchReasonableCandidates.m
//  MatchingPrefixSuffix
//
//  Created by Glenn on 8/20/22.
//
//  Strategy:
//  Match every suffix -- whose first char matches the string's first char -- against the suffix,
//  starting with the longest.

#import "MatchReasonableCandidates.h"

@implementation MatchReasonableCandidates

+ (NSString *) findLongestMatchIn: (NSString *) string
{
    if( string == nil  ||  string.length <= 1 ) {
        return @"";
    }
    
    NSUInteger lengthToCheck = string.length / 2;
    NSString * firstChar = [string substringToIndex: 1];
    
    NSRange rangeToCheck;
    NSRange rangeFound;
    NSString * suffix;
    
    NSUInteger startFrom = string.length - lengthToCheck;
    while( startFrom < string.length ) {

        // Does the first char exist in the second half of the string that has not yet been checked?
        rangeToCheck = NSMakeRange( startFrom, string.length - startFrom );
        rangeFound = [string rangeOfString: firstChar
                                   options: NSLiteralSearch
                                     range: rangeToCheck];
        
        if( rangeFound.location == NSNotFound ) {
            // nope; bail
            break;
        }
        
        // yes...but does the entire suffix from that point on also match the beginning of the string?
        suffix = [string substringFromIndex: rangeFound.location];
        if( [string hasPrefix: suffix] ) {
            // yes! That's it!
            return suffix;
        }
        
        // nope; see if there's a shorter qualifying suffix
        startFrom = rangeFound.location + 1;
    }
    
    return @"";
}

@end
