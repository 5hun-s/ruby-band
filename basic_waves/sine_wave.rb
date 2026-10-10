# サイン波を生成する
#
# fs       : サンプリング周波数 [Hz]
# f0       : 周波数 [Hz]
# gain     : 振幅
# duration : サンプル数
def sine_wave(fs, f0, gain, duration)
  Array.new(duration) do |n|
    gain * Math.sin(2 * Math::PI * f0 * n / fs)
  end
end
