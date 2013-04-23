# BlogSkeletonClonerプラグイン

Movable Typeのブログのスケルトンのみを複製するためのプラグイン。MT4専用。

ブログ記事、ウェブページ、コメント、トラックバックなどは複製されません。

## 更新履歴

 * 0.01 (2007-09-13 01:29:34 +0900):
   * 公開。

## 概要

BlogSkeletonClonerプラグインは、ブログのスケルトンのみを複製するためのプラグインです。MT 4.0に標準添付されている!WeblogClonerプラグインはブログ記事やコメントやトラックバックも含めてブログをまるごと複製する機能を提供しますが、このプラグインはブログのコンテンツ以外の部分のみを複製するので、例えばデザインやテンプレートのみ共通の複数のブログを作りたい場合などに便利です。

BlogSkeletonClonerプラグインが複製しないデータは、具体的には以下に示すものです。

 * MT::Entry (ブログ記事、ウェブページ)
 * MT::Category (カテゴリ、フォルダ)
 * MT::Placement (MT::EntryとMT::Categoryの関連付け情報)
 * MT::Comment (コメント)
 * MT::!ObjectTag (タグ)
 * MT::Trackback (トラックバックインタフェース情報)
 * MT::TBPing (トラックバック)

また、同時に複製できるブログの数を4個に制限しています。これは複製中にタイムアウトなどが発生しないようにするためです。

Movable Type 4.0の機能を利用して実現しているため、3.xでは動作しません。

## 使い方

プラグインをインストールするには、パッケージに含まれる!BlogSkeletonClonerディレクトリをMovable Typeのプラグインディレクトリ内にアップロードもしくはコピーしてください。正しくインストールできていれば、Movable Typeのメインメニューにプラグインが新規にリストアップされます。MT 4.0では正しく表示されない場合があります。4.01では修正されている予定です。

ブログのスケルトンの複製を作るには、

 1. 「ブログ」画面(ブログを一覧表示する画面)を開いて一個以上のアイテムを選択する。
 1. 「アクション…」リストから「ブログの複製 (スケルトン)」を選択して「Go」をクリックする。

## TODO

## See Also

## License

This code is released under the Artistic License. The terms of the Artistic License are described at [http://www.perl.com/language/misc/Artistic.html](http://www.perl.com/language/misc/Artistic.html).

## Author & Copyright

Copyright 2007, Hirotaka Ogawa (hirotaka.ogawa at gmail.com)
