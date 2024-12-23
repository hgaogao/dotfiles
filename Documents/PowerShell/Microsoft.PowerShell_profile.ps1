
Invoke-Expression (&starship init powershell)

fnm env --use-on-cd | Out-String | Invoke-Expression

Import-Module posh-git

Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -PredictionSource History
# # TAB补全时提供可选择菜单
Set-PSReadLineKeyHandler -Key "Tab" -Function MenuComplete
# # 方向右键补全历史提示  
Set-PSReadLineKeyHandler -Key "RightArrow" -Function ForwardWord
# 如何设置语言解决在连接ssh时候的中文乱码问题
$env:LANG = 'en_US.UTF-8'

function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}


# vim blinking cursor
function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        Write-Host -NoNewLine "`e[1 q"
    } else {
        # Set the cursor to a blinking line.
        Write-Host -NoNewLine "`e[5 q"
    }
}

Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange

if (-not (Test-Path $profile)) {
  New-Item -ItemType File -Path (Split-Path $profile) -Force -Name (Split-Path $profile -Leaf)
}

$profileEntry = 'Remove-Item Alias:ni -Force -ErrorAction Ignore'
$profileContent = Get-Content $profile
if ($profileContent -notcontains $profileEntry) {
  ("`n" + $profileEntry) | Out-File $profile -Append -Force -Encoding UTF8
}

#git lot 
function glog { git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative}
function glt { git log --graph --pretty=format:'%s %Cgreen' --abbrev-commit --date=relative}

function gba { git branch -a }
function gcb { git checkout -b $args }
# git switch 切换分支
Register-ArgumentCompleter -Native -CommandName gsb -ScriptBlock {
    param($commandName, $commandAst, $cursorPosition)
    
    # 获取当前分支列表
    $branches = git branch --all | ForEach-Object { $_.Trim() -replace '^\* ', '' }

    # 打印 $commandName

   if($commandName -ne ""){
        # 根据用户的输入过滤分支名
        $branches = $branches | Where-Object { $_ -like "$commandName*" }
        $branches | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
        return
    }
        # 返回自动补全结果
        $branches | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
    }

# 定义 gsb 命令
function gsb {
        param (
            [string]$branchName
        )
        
        if (-not $branchName) {
            Write-Host "Please provide a branch name."
            return
        }
    
    git switch $branchName
}

# git commit --amend
function gca { git commit --amend }

# git push 后面添加可选的参数
function gpo { git push  $args }
function gpl { git pull }

function restartExplorer {
    Stop-Process -Name explorer
    Start-Process explorer
}

function ff {
  Get-ChildItem -Directory -Recurse | Select-Object -ExpandProperty FullName | fzf
}
#nvim alias
set-alias vi nvim


#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58

Remove-Item Alias:ni -Force -ErrorAction Ignore

