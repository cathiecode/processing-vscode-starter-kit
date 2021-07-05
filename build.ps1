$pde_files = Get-ChildItem -Path src -r -Filter *.pde -Name

# ビルド先をクリア
if (Test-Path application) {
    Remove-Item -Path application/*.pde -Recurse -Force
}

New-Item -ItemType Directory -Force application

# パスをファイル名にならしながらコピー
foreach ($pde_file_path in $pde_files) {
    $pde_file_name_normalized = $pde_file_path.Replace("\", "_").Replace("/", "_");
    Copy-Item -Path src/$pde_file_path -Destination application/$pde_file_name_normalized
}

# データフォルダをコピー
Copy-Item -Force -Recurse -Literal data -Destination application
