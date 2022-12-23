function QuickNote {
    param (
        [ValidateNotNull()]
        [Parameter(Position = 0)]
        [string[]]
        $Title = (Get-Date -Format "MM-dd-yyyy-HH-mm-ss"),

        [Parameter(Mandatory = $true, Position = 0)]
        [string[]]
        $Body
    )

    $my_documents_path = [Environment]::GetFolderPath("MyDocuments")
    $notes_path = "$my_documents_path\QuickNotes\"

    if ( -not ( Test-Path -Path $notes_path ) ) {
        try {
            New-Item -ItemType Directory -Path $notes_path -ErrorAction Stop
        }
        catch [Exception] {
            Write-Host $_.Exception.Message -ForegroundColor Red
        }
    }

    $note_name = -join ( ( ( "$Title" -split " " ) -join "_" ), ".txt" )

    try {
        New-Item -ItemType File -Path "$notes_path" -Name "$note_name" -Value "$Title`n`n$Body" -ErrorAction Stop
    }
    catch [Exception] {
        Write-Host $_.Exception.Message -ForegroundColor Red
    }
}
