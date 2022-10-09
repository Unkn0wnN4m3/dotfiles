function QuickNote {
    param (
        [ValidateNotNull()]
        [string[]]
        $Title = (Get-Date -Format "MM-dd-yyyy-HH-mm-ss"),

        [Parameter(Mandatory = $true, Position = 0)]
        [string[]]
        $Body
    )

    $notes_path = "$env:USERPROFILE\Documents\QuickNotes\"

    function CheckPath {
        if ( Test-Path -Path $notes_path ) {
            return $true
        }
        else {
            New-Item -ItemType Directory -Path $notes_path
        }

        if (!$?) {
            Write-Output "Can't create a directory in $notes_path`n"; return $false
        }
        else {
            Write-Output "New notes will be stored in $notes_path`n", return $true
        }
    }

    function CreateNote {
        $new_note = ( -join ( "$notes_path\$Title", ".txt" ) )

        if ( Test-Path "$new_note" -PathType Leaf ) {
            Write-Output "Error: The note already exists!`n"; return $false
        }
        else {
            Write-Output "$Title`n`n$Body" >> "$new_note"
        }
    }

    if (CheckPath) {
        CreateNote
    }
}
