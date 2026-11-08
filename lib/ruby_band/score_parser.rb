NOTE_SEMITONES = { 'C' => 0, 'D' => 2, 'E' => 4, 'F' => 5, 'G' => 7, 'A' => 9, 'B' => 11 }.freeze

# 楽譜の文字列を [[MIDI番号, 拍数], ...] の配列に変換する
def parse_score(str)
  str.split.map do |token|
    note_str, beats_str = token.split(':', 2)
    beats = beats_str ? beats_str.to_f : 1.0 # 長さを省略すると1拍

    note_name = note_str[0]      # 1文字目が音名（例: "C4" → "C"）
    octave    = note_str[1].to_i # 2文字目がオクターブ（例: "C4" → 4）

    # ドから数えて何個目の半音か（例: C → 0、D → 2、B → 11）
    semitone = NOTE_SEMITONES[note_name]

    # MIDI番号 = 12 × (オクターブ + 1) + 半音（例: C4 → 12 × 5 + 0 = 60）
    midi = 12 * (octave + 1) + semitone

    [midi, beats]
  end
end
