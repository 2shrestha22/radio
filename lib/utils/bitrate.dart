String formatBitrate(int bitrate) {
  if (bitrate < 1000) {
    return '$bitrate bps';
  } else if (bitrate < 1000000) {
    return '${(bitrate / 1000).toStringAsFixed(2).replaceAll(RegExp(r'\.00'), '')} Kbps';
  } else if (bitrate < 1000000000) {
    return '${(bitrate / 1000000).toStringAsFixed(2).replaceAll(RegExp(r'\.00'), '')} Mbps';
  } else {
    return '${(bitrate / 1000000000).toStringAsFixed(2).replaceAll(RegExp(r'\.00'), '')} Gbps';
  }
}
