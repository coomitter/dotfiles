import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import System.IO

myTerminal              = "alacritty"
myLauncher              = "rofi -show run"
myModMask               = mod4Mask
myFocusFollowsMouse     = True

myBorderWidth           = 2
myNormalBorderColor     = "#28c4ca"
myFocusedBorderColor    = "#14e55d"

myLayoutHook            = avoidStruts $ ResizableTall 1 (2/100) (1/2) []
mySpacing               = spacingRaw False (Border 6 0 0 3) True (Border 4 4 4 4) True

main = xmonad $ def
    {terminal = myTerminal
    , modMask = myModMask
    , borderWidth = myBorderWidth 
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , layoutHook = mySpacing $ myLayoutHook
}

    `additionalKeysP`
        [ ("M-v", spawn myLauncher)
        , ("M-s", sendMessage MirrorShrink)
        , ("M-a", sendMessage MirrorExpand)     
        ]
