# パルス波を生成する（矩形波の一般化、デューティ比を指定できる）
#
# duty比1:1（50%）のとき矩形波と一致する
#
# fs        : サンプリング周波数 [Hz]
# f0        : 周波数 [Hz]
# gain      : 振幅
# duration  : サンプル数
# duty      : デューティ比（0.0〜1.0、省略時は矩形波と同じ0.5）
def pulse_wave(fs, f0, gain, duration, duty = 0.5)
  period_samples = fs / f0 # 基本周期（サンプル数）
  sample_in_period = 0

  Array.new(duration) do
    value = sample_in_period < period_samples * duty ? 1.0 : -1.0

    sample_in_period += 1
    sample_in_period = 0 if sample_in_period >= period_samples

    value * gain
  end
end
