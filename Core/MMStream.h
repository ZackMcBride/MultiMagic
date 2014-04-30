@interface MMStream : NSObject

@property (nonatomic, readonly) MCPeerID *peerID;
@property (nonatomic, readonly) NSString *streamName;
@property (nonatomic, readonly) NSInputStream *stream;

- (instancetype)initWithPeerID:(MCPeerID *)peerID streamName:(NSString *)streamName stream:(NSInputStream *)stream;

@end
