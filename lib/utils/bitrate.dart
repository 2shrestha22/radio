String formatBitrate(int bitrate) {
  if (bitrate < 1000) return '$bitrate bps';
  return '${(bitrate / 1000).toStringAsFixed(0)} Kbps';
}
