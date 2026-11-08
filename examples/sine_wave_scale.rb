# LT用サンプル: score_parser で楽譜を読んで、サイン波でドレミファソラシドを鳴らすスクリプト。
require 'fileutils'
require_relative '../lib/ruby_band'

SAMPLE_RATE = 44100
BPM         = 240
BEAT_SEC    = 60.0 / BPM # 1拍の秒数（BPM 240 なら 0.25 秒）

# ドレミファソラシド（長さを省略すると1拍）
score = parse_score("
  C4 D4 E4 F4
  G4 A4 B4 C5
")

samples = score.flat_map do |note_number, beats|
  # MIDI番号を周波数に直す（例: 60 → 440 × 2^((60 - 69) / 12) = 261.6Hz）
  freq = 440.0 * 2**((note_number - 69) / 12.0)
  # 拍数を点の数に直す（例: 1拍 → 0.25 秒 → 11025 点）
  total_samples = (SAMPLE_RATE * BEAT_SEC * beats).to_i

  Array.new(total_samples) { |n| 0.5 * Math.sin(2 * Math::PI * freq * n / SAMPLE_RATE) }
end

output_dir = File.expand_path('../output', __dir__)
FileUtils.mkdir_p(output_dir)
write_wav(File.join(output_dir, 'sine_wave_scale.wav'), samples, SAMPLE_RATE)

puts 'sine_wave_scale.wav (サイン波でドレミファソラシド)'
