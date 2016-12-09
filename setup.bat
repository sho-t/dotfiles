@echo off

for %%i in (.?*) do (
   mklink %~d0%HOMEPATH%\%%i %~d0%HOMEPATH%\dotfiles\%%i
)

for /d %%d in (.?*) do (
   if %%d neq .. if %%d neq .git (
     mklink /D %~d0%HOMEPATH%\%%d %~d0%HOMEPATH%\dotfiles\%%d
   )
)

Pause
