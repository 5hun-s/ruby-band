# 三角波を生成する
#
# fs       : サンプリング周波数 [Hz]
# f0       : 周波数 [Hz]
# gain     : 振幅
# duration : サンプル数
def triangle_wave(fs, f0, gain, duration)
  period_samples = fs / f0        # 基本周期（サンプル数）
  half_period     = period_samples / 2.0
  rise_per_sample = 2.0 / half_period

  sample_in_period = 0

  Array.new(duration) do
    value = if sample_in_period < half_period
              # 前半: -1から出発して、rise_per_sample ずつ上がる
              -1.0 + rise_per_sample * sample_in_period
            else
              # 後半: +1から出発して、rise_per_sample ずつ下がる
              1.0 - rise_per_sample * (sample_in_period - half_period)
            end

    sample_in_period += 1
    sample_in_period = 0 if sample_in_period >= period_samples

    value * gain
  end
end
