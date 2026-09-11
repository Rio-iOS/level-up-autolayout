# level-up-autolayout
Repository for Level Up AutoLayout

## 検証環境と実行方法

検証用ツールチェーンはXcode 26.6 / Swift 6.3です。Swiftの言語モード・iOSの最低バージョンは各プロジェクトの設定を使用します。macOSでXcodeをインストールし、初回起動時の追加コンポーネントのインストールを完了してください。

リポジトリのルートで以下を実行します。

```sh
# 検証対象と番号の一覧
python3 Scripts/verify.py --list

# 全対象を順番に検証
python3 Scripts/verify.py

# 1件だけ検証（0始まり）
python3 Scripts/verify.py --index 0
```

アプリは署名不要のSimulator向けにビルドし、Swiftパッケージは `swift test` で検証します。作業用ディレクトリは実行ごとに作成・削除するため、初回と同様に時間がかかります。依存パッケージの取得にはネットワーク接続が必要です。

## 検証対象

| 番号 | 対象 | 種類 | 開く場所 |
| ---: | --- | --- | --- |
| 0 | `AdaptiveLayouts-SpotifyPlayer-WithSpacer` | Simulatorビルド | `AdaptiveLayouts-SpotifyPlayer-WithSpacer/AdaptiveLayouts-SpotifyPlayer-WithSpacer.xcodeproj` |
| 1 | `AdaptiveLayouts-SpotifyPlayer` | Simulatorビルド | `AdaptiveLayouts-SpotifyPlayer/AdaptiveLayouts-SpotifyPlayer.xcodeproj` |
| 2 | `AdaptiveLayoutsAdjustSpacerLab` | Simulatorビルド | `AdaptiveLayoutsAdjustSpacerLab/AdaptiveLayoutsAdjustSpacerLab.xcodeproj` |
| 3 | `AdaptiveLayoutsChallenge1` | Simulatorビルド | `AdaptiveLayoutsChallenge1/AdaptiveLayoutsChallenge1.xcodeproj` |
| 4 | `AdaptiveLayoutsLab` | Simulatorビルド | `AdaptiveLayoutsLab/AdaptiveLayoutsLab.xcodeproj` |
| 5 | `AdaptiveLayoutsLabByEnablingAndDisabling` | Simulatorビルド | `AdaptiveLayoutsLabByEnablingAndDisabling/AdaptiveLayoutsLabByEnablingAndDisabling.xcodeproj` |
| 6 | `AdaptiveLayoutsOrientationLab` | Simulatorビルド | `AdaptiveLayoutsOrientationLab/AdaptiveLayoutsOrientationLab.xcodeproj` |
| 7 | `AdaptiveLayoutsUsingVisibilityLab` | Simulatorビルド | `AdaptiveLayoutsUsingVisibilityLab/AdaptiveLayoutsUsingVisibilityLab.xcodeproj` |
| 8 | `AnchorsLab` | Simulatorビルド | `AnchorsLab/AnchorsLab.xcodeproj` |
| 9 | `BasicAnchors` | Simulatorビルド | `BasicAnchors/BasicAnchors.xcodeproj` |
| 10 | `BasicAnchorsWithStackViews` | Simulatorビルド | `BasicAnchorsWithStackViews/BasicAnchorsWithStackViews.xcodeproj` |
| 11 | `CHCRWithImagesLab` | Simulatorビルド | `CHCRWithImagesLab/CHCRWithImagesLab.xcodeproj` |
| 12 | `ContentHuggingAndCompressionResistanceLab` | Simulatorビルド | `ContentHuggingAndCompressionResistanceLab/ContentHuggingAndCompressionResistanceLab.xcodeproj` |
| 13 | `IntrinsicContentSize-SpotifyPlayer` | Simulatorビルド | `IntrinsicContentSize-SpotifyPlayer/IntrinsicContentSize-SpotifyPlayer.xcodeproj` |
| 14 | `IntrinsicContentSizeLab` | Simulatorビルド | `IntrinsicContentSizeLab/IntrinsicContentSizeLab.xcodeproj` |
| 15 | `LayoutMarginsGuideLab` | Simulatorビルド | `LayoutMarginsGuideLab/LayoutMarginsGuideLab.xcodeproj` |
| 16 | `MarginGuideSpacerViewLab` | Simulatorビルド | `MarginGuideSpacerViewLab/MarginGuideSpacerViewLab.xcodeproj` |
| 17 | `ReadableContentGuideLab` | Simulatorビルド | `ReadableContentGuideLab/ReadableContentGuideLab.xcodeproj` |
| 18 | `SafeAreaLab` | Simulatorビルド | `SafeAreaLab/SafeAreaLab.xcodeproj` |
| 19 | `ScrollableStackViewsLab` | Simulatorビルド | `ScrollableStackViewsLab/ScrollableStackViewsLab.xcodeproj` |
| 20 | `StackViewDemo` | Simulatorビルド | `StackViewDemo/StackViewDemo.xcodeproj` |
| 21 | `StackViewLab` | Simulatorビルド | `StackViewLab/StackViewLab.xcodeproj` |

アプリを操作するには表のworkspace（ある場合）またはprojectをXcodeで開き、対象のschemeとiPhone Simulatorを選択して実行します。実機で動かす場合は、ご自身のSigning Teamを設定してください。

## CIと検証範囲

`Quality` ワークフローは上記と同じ一覧・スクリプトを使い、対象ごとにビルドまたはテストを実行します。ビルドの成功だけでは、画面表示、アクセシビリティ、通信先の動作、テスト網羅性は保証されません。UIサンプルはSimulator上での操作確認も必要です。
