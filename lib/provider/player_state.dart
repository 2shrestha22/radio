/// Possible state of the player.
enum RadioPlayerState {
  /// Audio source is not loaded.
  idle,

  /// Audio source is loaded. Player may be playing audio or buffering.
  started,

  /// Player is stopped but audio source still loaded.
  stopped;

  bool get isRunning => this == RadioPlayerState.started;
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
