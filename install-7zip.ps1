# Function to download and install a program
function Install-Program {
    param (
        [string]$url,
        [string]$installerArgs = "/silent /install"
    )

    # Generate a temporary file path for the installer
    $output = [System.IO.Path]::Combine($env:TEMP, [System.IO.Path]::GetFileName($url))

    # Download the file
    Invoke-WebRequest -Uri $url -OutFile $output

    # Run the installer silently
    Start-Process -FilePath $output -ArgumentList $installerArgs -Wait

    # Clean up the downloaded file
    Remove-Item $output
}

# URLs for the programs
$sevenZipUrl = "https://www.7-zip.org/a/7z2407-x64.exe"
$acrobatReaderUrl = "https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/2300120143/AcroRdrDC2300120143_en_US.exe"
$chromeUrl = "https://dl.google.com/chrome/install/375.126/chrome_installer.exe"

# Install 7-Zip
Install-Program -url $sevenZipUrl -installerArgs "/S"

# Install Acrobat Reader DC
Install-Program -url $acrobatReaderUrl -installerArgs "/sAll /msi /norestart /quiet"

# Install Google Chrome
Install-Program -url $chromeUrl -installerArgs "/silent /install"
