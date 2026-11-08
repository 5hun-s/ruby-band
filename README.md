# ruby-band

Ruby で簡単な楽譜を解析し、WAV 音声を生成するプロジェクトです。

## 必要な環境

- Docker Desktop など、Docker Engine と Docker Compose を利用できる環境
- （任意）[Task](https://taskfile.dev/) 。Taskfile のショートカットを使う場合に必要です
- （任意）macOS の `afplay` 。生成した WAV を再生する場合に使います

## 環境構築

リポジトリのルートで Docker イメージをビルドします。

```sh
docker compose build
```

開発用のシェルは次のコマンドで起動できます。

```sh
docker compose run --rm app bash
```

## サンプルの実行

サイン波でドレミファソラシドを生成します。

```sh
docker compose run --rm app ruby examples/sine_wave_scale.rb
```

WAV ファイルは `output/sine_wave_scale.wav` に作られます。`output/` は `.gitignore` の対象なので、生成ファイルは Git に追加されません。

macOS では、次のコマンドで再生できます。

```sh
afplay output/sine_wave_scale.wav
```

Task がインストール済みの場合は、ビルド、開発シェル起動、サンプル生成と再生をそれぞれ次のように実行できます。

```sh
task build
task sh
task sine_wave_scale
```
