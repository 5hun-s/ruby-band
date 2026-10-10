# ノコギリ波を生成する（位相から直接生成）
#
# 各サンプルの位相 phase = f0 * t を 0〜1 の範囲に折り返し、
# -1〜1で振動する鋸波形に変換する
#
# fs       : サンプリング周波数 [Hz]
# f0       : 周波数 [Hz]
# gain     : 振幅
# duration : サンプル数
def sawtooth_wave(fs, f0, gain, duration)
  Array.new(duration) do |i|
    t = i / fs.to_f
    phase = (f0 * t) % 1.0
    (2.0 * phase - 1.0) * gain
  end
end
