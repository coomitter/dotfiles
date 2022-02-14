import XMonad
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile

main = xmonad $ def
    { terminal    = "alacritty"
    , modMask     = mod4Mask
    , focusFollowsMouse = True
    , borderWidth = 4
    , normalBorderColor = "#28c4ca"
    , focusedBorderColor = "#14e55d"
    }

    `additionalKeysP`
        [ ("M-v", spawn "rofi -show run")
        , ("M-s", sendMessage MirrorShrink)
        , ("M-a", sendMessage MirrorExpand)     
        ]
