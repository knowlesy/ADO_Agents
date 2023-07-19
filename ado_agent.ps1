
$URL = ""
$PAT = ""
$POOL = ""
$AGENT = $env:COMPUTERNAME

$keyPath = 'Registry::HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Internet Explorer\Main'
if (!(Test-Path $keyPath)) { New-Item $keyPath -Force | Out-Null }
Set-ItemProperty -Path $keyPath -Name "DisableFirstRunCustomize" -Value 1
Write-Host "start"

if (test-path "c:\agent")
{
    Remove-Item -Path "c:\agent" -Force -Confirm:$false -Recurse
}

new-item -ItemType Directory -Force -Path "c:\agent"
set-location "c:\agent"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wr = Invoke-WebRequest https://api.github.com/repos/Microsoft/azure-pipelines-agent/releases/latest
$tag = ($wr | ConvertFrom-Json)[0].tag_name
$tag = $tag.Substring(1)

write-host "$tag is the latest version"
$downurl = "https://vstsagentpackage.azureedge.net/agent/$tag/vsts-agent-win-x64-$tag.zip"

Invoke-WebRequest $downurl -Out agent.zip -UseBasicParsing
Expand-Archive -Path agent.zip -DestinationPath $PWD
.\config.cmd --unattended --url $URL --auth pat --token $PAT --pool $POOL --agent $AGENT --acceptTeeEula --runAsService

exit 0