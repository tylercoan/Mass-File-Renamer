$Computers = Get-Content -Path "c:\scripts\computers.csv"
$Paths = @(
    '\\{0}\c$\Windows\SysWOW64\msxml4.dll'
    )

$NewName = 'msxml4.dll.old'

:Computers foreach( $Computer in $Computers ){
    :Paths foreach( $Path in $Paths ){
        $TestPath = $Path -f $Computer

        if( Test-Path -Path $TestPath -PathType Leaf ){
            Rename-Item -Path $TestPath -NewName $NewName -Verbose

            continue Computers
            }
        }

    Write-Warning "Unable to find $TestPath file on $Computer"
    }
