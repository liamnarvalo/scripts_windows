# Vérifie si le script est exécuté avec des privilèges administrateur
$ELEVATED = [bool](New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $ELEVATED) {
    Write-Host "Le script doit être exécuté avec des privilèges administrateur. Veuillez relancer le script en tant qu'administrateur."
    pause
    exit
}

function Afficher-Menu {
    Clear-Host
    Write-Host "Script créé par Liam L. - https://github.com/liamnarvalo"
    Write-Host
    Write-Host "Menu Winget :"
    Write-Host "1. Installer des logiciels via Winget (liste dans le script)"
    Write-Host "2. Mettre à jour tous les logiciels installés via Winget"
    Write-Host "3. Lister tous les logiciels installés via Winget"
    Write-Host "4. Quitter"
}

function Installer-Logiciels {
    Write-Host "Installation des logiciels présents dans le script via Winget"
    winget install --accept-package-agreements -e 7zip.7zip Discord.Discord voidtools.Everything Google.Chrome Nilesoft.Shell Notion.Notion dotPDN.PaintDotNet ProtonTechnologies.ProtonVPN Proton.ProtonMail PuTTY.PuTTY ShareX.ShareX Valve.Steam TIDALMusicAS.TIDAL IDRIX.VeraCrypt Oracle.VirtualBox VideoLAN.VLC Microsoft.VisualStudioCode WinSCP.WinSCP

    Read-Host "Appuyez sur Entrée pour continuer"
}

function Mettre-a-jour-Logiciels {
    Write-Host "Mise à jour de tous les logiciels via Winget"
    winget upgrade --all

    Read-Host "Appuyez sur Entrée pour continuer"
}

function Lister-Logiciels-Installes {
    Write-Host "Listage de tous les logiciels installés via Winget"
    winget list

    Read-Host "Appuyez sur Entrée pour continuer"
}

do {
    Afficher-Menu
    $choix = Read-Host "Veuillez choisir une option (1-4)"
    switch ($choix) {
        1 { Installer-Logiciels }
        2 { Mettre-a-jour-Logiciels }
        3 { Lister-Logiciels-Installes }
        4 { Write-Host "Merci d'avoir utilisé le script. Au revoir !" }
        default { Write-Host "Option invalide. Veuillez choisir une option valide." }
    }
} while ($choix -ne "4")