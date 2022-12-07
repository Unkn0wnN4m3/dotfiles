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

    function CheckPath {
        if ( -not ( Test-Path -Path $notes_path ) ) {
            New-Item -ItemType Directory -Path $notes_path -ErrorAction Stop
        }

        return $true
    }

    function CreateNote {
        $new_note = ( -join ( "$notes_path\$Title", ".txt" ) )

        if ( Test-Path "$new_note" -PathType Leaf ) {
            return Write-Host "Error: The note already exists!`n" -f Red
        }

        Write-Output "$Title`n`n$Body" >> "$new_note"
    }

    if (CheckPath) {
        CreateNote
    }
}
