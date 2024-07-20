/// Possible state of the player.
enum RadioPlayerState {
  /// Audio source is not loaded.
  idle,

  /// Audio source is loaded. Player may be playing audio or buffering.
  started,

  /// Audio source is loaded but the player is paused.
  /// Audio can be buffering while paused.
  paused,

  /// Player is stopped but audio source still loaded.
  stopped;

  // If player not idle or stopped.
  bool get isRunning =>
      this == RadioPlayerState.started || this == RadioPlayerState.paused;
}

/// State of audio stream.
enum StreamingState {
  /// Audio if fully buffered and is playing.
  playing,

  /// Audio is buffering and not playing.
  buffering;

  bool get isPlaying => this == StreamingState.playing;
  bool get isBuffering => this == StreamingState.buffering;
}
