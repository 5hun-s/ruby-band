# 矩形波を生成する
#
# fs       : サンプリング周波数 [Hz]
# f0       : 周波数 [Hz]
# gain     : 振幅
# duration : サンプル数
def square_wave(fs, f0, gain, duration)
  period_samples = fs / f0 # 基本周期（サンプル数）
  sample_in_period = 0

  Array.new(duration) do
    value = sample_in_period < period_samples / 2.0 ? 1.0 : -1.0

    sample_in_period += 1
    sample_in_period = 0 if sample_in_period >= period_samples

    value * gain
  end
end
