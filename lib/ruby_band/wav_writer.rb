# samples（-1.0〜1.0 の数値の配列）を、16bit・モノラルの wav ファイルとして path に書き出す。
def write_wav(path, samples, sample_rate)
  pcm_binary = samples.map { |v| (v * 32767).round.clamp(-32768, 32767) }.pack('s<*')
  data_size  = pcm_binary.bytesize

  File.open(path, 'wb') do |f|
    f.write('RIFF')
    f.write([36 + data_size].pack('V'))
    f.write('WAVE')
    f.write('fmt ')
    f.write([16, 1, 1, sample_rate, sample_rate * 2, 2, 16].pack('VvvVVvv'))
    f.write('data')
    f.write([data_size].pack('V'))
    f.write(pcm_binary)
  end
end
