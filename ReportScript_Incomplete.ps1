# Name of bucket.
$BucketName = "globomantics-system-reports"

# Variable to store output data.
$ReportData = @()

# Test S3 Bucket exists.
if ("TODO: TEST IF BUCKET EXISTS") {
    # Get contents of bucket.
    $BucketContents = "TODO: GET BUCKET CONTENTS"

    # Loop through contents.
    foreach ($Object in $BucketContents) {
        # Download each file.
        $LocalFile = "TODO: DOWNLOAD FILE"

        # Read contents.
        $Contents = $LocalFile | Import-Csv -Delimiter " " -Header IPAddress

        # Record top 5 IP Addresses from each file.
        $ReportData += $Contents `
            | Group-Object -Property IPAddress `
            | Sort-Object -Property Count -Descending `
            | Select-Object -First 5 -Property Count, Name

        # Delete local file.
        $LocalFile | Remove-Item
    }

    # Write results to output file.
    $ReportData | ConvertTo-Csv | Out-File .\report.csv -Force
}