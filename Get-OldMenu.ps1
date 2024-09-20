# reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

# Mensaje de bienvenida
Write-Host 'Activando el antiguo menú contextual en Windows 11'

# Verificación de Windows 11
if(((Get-WmiObject win32_operatingsystem).Name) -match "11"){
    $path = 'HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32'
    if(-not(Test-Path -Path $path)){
        New-Item -Path $path -Force | Out-Null
    }

    # Agregar al registro
    Set-ItemProperty -Path $path -Name '(Default)' -Value ""
    
    # Cerrar y abrir explorer.exe
    Get-Process explorer | Stop-Process -Force
    explorer.exe
}else{
    Write-Host 'No debes hacer nada. Desfruta de tu menú contextual'
}

Write-Host 'Terminado. :)'
