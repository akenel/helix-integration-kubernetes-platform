# download-helm-charts.ps1

$destination = "C:\Users\angel\HELIX\TARS"
New-Item -ItemType Directory -Path $destination -Force | Out-Null

$charts = @(
    @{ Name="postgresql"; Version="16.7.9"; Repo="https://charts.bitnami.com/bitnami" },
    @{ Name="keycloak"; Version="24.7.3"; Repo="https://charts.bitnami.com/bitnami" },
    @{ Name="vault"; Version="0.30.0"; Repo="https://helm.releases.hashicorp.com" },
    @{ Name="cert-manager"; Version="v1.17.2"; Repo="https://charts.jetstack.io" },
    @{ Name="traefik"; Version="26.1.0"; Repo="https://helm.traefik.io/traefik" },
    @{ Name="kafka"; Version="26.3.3"; Repo="https://charts.bitnami.com/bitnami" },
    @{ Name="zookeeper"; Version="12.1.2"; Repo="https://charts.bitnami.com/bitnami" },
    @{ Name="minio"; Version="12.8.10"; Repo="https://charts.bitnami.com/bitnami" },
    @{ Name="nifi"; Version="1.2.2"; Repo="https://cetic.github.io/helm-charts" },
    @{ Name="kiali-server"; Version="1.73.1"; Repo="https://kiali.org/helm-charts" }
)

foreach ($chart in $charts) {
    $url = "$($chart.Repo)/$($chart.Name)-$($chart.Version).tgz"
    $file = Join-Path $destination "$($chart.Name)-$($chart.Version).tgz"

    try {
        Write-Host "⬇️ Downloading $($chart.Name)..."
        Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing -ErrorAction Stop
        Write-Host "✅ Downloaded: $($chart.Name)"
    }
    catch {
        Write-Host "❌ Failed: $($chart.Name) -> $_"
    }
}
