# 設定項目
[string]$InFolder  = 'C:\Users\fruno\Documents\1_site\nikto\resources\images\illust'
[string]$OutFolder = 'C:\Users\fruno\Documents\1_site\nikto\resources\images\illust'

# 開始
Add-Type -AssemblyName System.Drawing

# カスタムオブジェクト作る
$Sizes = @()

# jpeg
$array = Get-ChildItem $InFolder -Filter "*.jpeg"

foreach($filename in $array) {

 # 画像ファイルの読み込み
  $image = New-Object System.Drawing.Bitmap($filename.FullName)

# カスタムオブジェクトに格納する要素作って入れる
  $Size = New-Object PSObject | Select-Object Name, Width, Height
  $Size.Name   = $filename.Name
  $Size.Width  = $image.Width
  $Size.Height = $image.Height

  $Sizes += $Size

# オブジェクトの破棄
  $image.Dispose()

}

# カスタムオブジェクト表示
$Sizes | ft -AutoSize

# カスタムオブジェクトをcsvへエクスポート
$Sizes | Export-Csv  -Path $OutFolder\size.csv -NoTypeInformation