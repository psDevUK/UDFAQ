$IndexJs = Get-ChildItem "$PSScriptRoot\index.*.bundle.js"
$AssetId = [UniversalDashboard.Services.AssetService]::Instance.RegisterAsset($IndexJs.FullName)

function New-UDFAQ {
    <#
    .SYNOPSIS
    Creates a new component
    
    .DESCRIPTION
    Creates a new component
    
    .PARAMETER Id
    The ID of this editor

    .PARAMETER Title
    This is a mandatory string parameter required in order to set the main title text

    .PARAMETER Content
    Is a scriptblock. This is a mandatory parameter required to set the content of the FAQs you are displaying

    .PARAMETER BackgroundColor
    A string parameter. Sets the background color for the component, this is defaulted to white

    .PARAMETER TitleTextColor
    A string parameter. Sets the color for the main title of the component, this is defaulted to black

    .PARAMETER TitleTextSize
    A string parameter used to define the size of the main title text. This is defaulted to 48px

    .PARAMETER RowTitleColor
    A string parameter which is used to define the colour of the question titles in the FAQs. Defaulted to blue

    .PARAMETER RowTitleTextSize
    A string parameter to define the size of the text shown as the questions in the FAQs this is defaulted to medium

    .PARAMETER RowContentColor
    A string parameter used to define the color of the text displayed as the answer below the question title. This is defaulted to grey

    .PARAMETER RowContentTextSize
    A string parameter to define the size of the text shown as the answer below the question title. This is defaulted to 16px

    .PARAMETER ArrowColor
    A string parameter used to define the color of the collapsing icon to expand or collapse the FAQ. This is defaulted to blue

    .PARAMETER TransitionDuration
    A string parameter used to define how long the duration the animation takes to either collapse or expand the FAQ clicked on. This is defaulted to 1s

    .EXAMPLE
    New-UDComponent -Text 'Hello, world!'
    #>
    
    param(
        [Parameter()]
        [string]$Id = (New-Guid).ToString(),
        [Parameter(Mandatory)]
        [string]$Title,
        [Parameter(Mandatory)]
        [scriptblock]$Content,
        [Parameter()]
        [string]$BackgroundColor = 'white',
        [Parameter()]
        [string]$TitleTextColor = 'black',
        [Parameter()]
        [string]$TitleTextSize = '48px',
        [Parameter()]
        [string]$RowTitleColor = 'blue',
        [Parameter()]
        [string]$RowTitleTextSize = 'medium',
        [Parameter()]
        [string]$RowContentColor = 'grey',
        [Parameter()]
        [string]$RowContentTextSize = '16px',
        [Parameter()]
        [string]$ArrowColor = 'blue',
        [Parameter()]
        [string]$TransitionDuration = '1s'
    )

    End {
        @{
            assetId            = $AssetId 
            isPlugin           = $true 
            type               = "udfaq"
            id                 = $Id
            title              = $Title
            rows               = $Content.Invoke()
            bgColor            = $BackgroundColor
            titleTextColor     = $TitleTextColor
            titleTextSize      = $TitleTextSize
            rowTitleColor      = $RowTitleColor
            rowTitleTextSize   = $RowTitleTextSize
            rowContentColor    = $RowContentColor
            rowContentTextSize = $RowContentTextSize
            arrowColor         = $ArrowColor
            transitionDuration = $TransitionDuration

        }
    }
}