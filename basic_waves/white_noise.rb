# 白色雑音を生成する
#
# gain     : 振幅
# duration : サンプル数
def white_noise(gain, duration)
  Array.new(duration) { rand(-1.0..1.0) * gain }
end
