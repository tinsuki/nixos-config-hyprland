{ config, pkgs, inputs, ...}:
{
  xdg.mimeApps.enable = true;

  xdg.mimeApps.defaultApplications = {
    # Web content
    "text/html" = "zen.desktop";
    "x-scheme-handler/http" = "zen.desktop";
    "x-scheme-handler/https" = "zen.desktop";
    "x-scheme-handler/about" = "zen.desktop";
    "x-scheme-handler/unknown" = "zen.desktop";

    # Images & GIFs
    "image/avif" = "loupe.desktop";
    "image/bmp" = "loupe.desktop";
    "image/gif" = "loupe.desktop";
    "image/vnd.microsoft.icon" = "loupe.desktop";
    "image/jpeg" = "loupe.desktop";
    "image/jpg" = "loupe.desktop";
    "image/png" = "loupe.desktop";
    "image/svg" = "loupe.desktop";
    "image/webp" = "loupe.desktop";

    # Ogg Vorbis and Theora (Xiph family)
    "application/ogg" = "amberol.desktop";
    "application/x-ogg" = "amberol.desktop";
    "audio/ogg" = "amberol.desktop";
    "audio/vorbis" = "amberol.desktop";
    "audio/x-vorbis" = "amberol.desktop";
    "audio/x-vorbis+ogg" = "amberol.desktop";
    "video/ogg" = "vlc.desktop";
    "video/x-ogm" = "vlc.desktop";
    "video/x-ogm+ogg" = "vlc.desktop";
    "video/x-theora+ogg" = "vlc.desktop";
    "video/x-theora" = "vlc.desktop";
    "audio/x-speex" = "amberol.desktop";
    "audio/opus" = "amberol.desktop";                   

    # FLAC lossless audio
    "application/x-flac" = "amberol.desktop";
    "audio/flac" = "amberol.desktop";
    "audio/x-flac" = "amberol.desktop";

    # Microsoft audio and video
    # ASF
    "audio/x-ms-asf" = "amberol.desktop";
    "audio/x-ms-asx" = "amberol.desktop";
    "audio/x-ms-wax" = "amberol.desktop";
    "audio/x-ms-wma" = "amberol.desktop";
    "video/x-ms-asf" = "vlc.desktop";
    "video/x-ms-asf-plugin" = "vlc.desktop";
    "video/x-ms-asx" = "vlc.desktop";
    "video/x-ms-wm" = "vlc.desktop";
    "video/x-ms-wmv" = "vlc.desktop";
    "video/x-ms-wmx" = "vlc.desktop";
    "video/x-ms-wvx" = "vlc.desktop";
    
    # AVI et al.
    "video/x-msvideo" = "vlc.desktop";
    "audio/x-pn-windows-acm" = "amberol.desktop";
    "video/divx" = "vlc.desktop";
    "video/msvideo" = "vlc.desktop";
    "video/vnd.divx" = "vlc.desktop";
    "video/avi" = "vlc.desktop";
    "video/x-avi" = "vlc.desktop";

    # Real audio and video
    "application/vnd.rn-realmedia" = "vlc.desktop";     # RM
    "application/vnd.rn-realmedia-vbr" = "vlc.desktop"; # RMVB
    "audio/vnd.rn-realaudio" = "amberol.desktop";
    "audio/x-pn-realaudio" = "amberol.desktop";
    "audio/x-pn-realaudio-plugin" = "amberol.desktop";
    "audio/x-real-audio" = "amberol.desktop";
    "audio/x-realaudio" = "amberol.desktop";
    "video/vnd.rn-realvideo" = "vlc.desktop";

    # MPEG related audio, video and transport
    # MPEG-2
    "audio/mpeg" = "amberol.desktop";                       # .mpga, .mpega, .mp2, .mp3
    "audio/mpg" = "amberol.desktop";                        # .mpga, .mpega, .mp2, .mp3
    "audio/mp1" = "amberol.desktop";                      # .mpga, .mpega, .mp2, .mp3
    "audio/mp2" = "amberol.desktop";
    "audio/mp3" = "amberol.desktop";
    "audio/x-mp1" = "amberol.desktop";
    "audio/x-mp2" = "amberol.desktop";
    "audio/x-mp3" = "amberol.desktop";
    "audio/x-mpeg" = "amberol.desktop";
    "audio/x-mpg" = "amberol.desktop";
    "video/mp2t" = "vlc.desktop";                       
    "video/mpeg" = "vlc.desktop";
    "video/mpeg-system" = "vlc.desktop";
    "video/x-mpeg" = "vlc.desktop";
    "video/x-mpeg2" = "vlc.desktop";
    "video/x-mpeg-system" = "vlc.desktop";

    # MP4
    "application/mpeg4-iod" = "vlc.desktop";            # IANA-registered
    "application/mpeg4-muxcodetable" = "vlc.desktop";
    "application/x-extension-m4a" = "amberol.desktop";
    "application/x-extension-mp4" = "vlc.desktop";
    "audio/aac" = "amberol.desktop";
    "audio/m4a" = "amberol.desktop";
    "audio/mp4" = "amberol.desktop";                        # IANA-registered
    "audio/x-m4a" = "amberol.desktop";
    "audio/x-aac" = "amberol.desktop";
    "video/mp4" = "vlc.desktop";                        # IANA-registered
    "video/mp4v-es" = "vlc.desktop";
    "video/x-m4v" = "vlc.desktop";

    # Apple QuickTime (MOV)
    "application/x-quicktime-media-link" = "vlc.desktop";
    "application/x-quicktimeplayer" = "vlc.desktop";
    "video/quicktime" = "vlc.desktop";                  # IANA-registered

    # Matroska container format
    "application/x-matroska" = "vlc.desktop";
    "audio/x-matroska" = "amberol.desktop";
    "video/x-matroska" = "vlc.desktop";

    # WebM (Matroska + Vorbis/Opus + VP8/9)
    "video/webm" = "vlc.desktop";
    "audio/webm" = "amberol.desktop";

    # 3GPP related
    "audio/3gpp" = "amberol.desktop";                       # IANA-registered
    "audio/3gpp2" = "amberol.desktop";                      # IANA-registered
    "audio/AMR" = "amberol.desktop";                        # IANA-registered
    "audio/AMR-WB" = "amberol.desktop";                     # IANA-registered
    "video/3gp" = "vlc.desktop";
    "video/3gpp" = "vlc.desktop";
    "video/3gpp2" = "vlc.desktop";

    # URI scheme handlers (ie IP protocol support)
    "x-scheme-handler/mms" = "vlc.desktop";             # MMS
    "x-scheme-handler/mmsh" = "vlc.desktop";            # MMS over HTTP
    "x-scheme-handler/rtsp" = "vlc.desktop";            # RSTP
    "x-scheme-handler/rtp" = "vlc.desktop";
    "x-scheme-handler/rtmp" = "vlc.desktop";
    "x-scheme-handler/icy" = "vlc.desktop";             # Icecast
    "x-scheme-handler/icyx" = "vlc.desktop";            # Icecast

    # Linux desktop environment hooks for ISOs etc.
    "application/x-cd-image" = "vlc.desktop";
    "x-content/audio-player" = "amberol.desktop";

    # Playlists / text/xml list with URLs
    "application/ram" = "amberol.desktop";                  # Realaudio Metadata
    "application/xspf+xml" = "amberol.desktop";
    "audio/mpegurl" = "amberol.desktop";
    "audio/x-mpegurl" = "amberol.desktop";
    "audio/scpls" = "amberol.desktop";
    "audio/x-scpls" = "amberol.desktop";
    "text/google-video-pointer" = "vlc.desktop";
    "text/x-google-video-pointer" = "vlc.desktop";
    "video/vnd.mpegurl" = "vlc.desktop";                # IANA-registered
    "application/vnd.apple.mpegurl" = "vlc.desktop";    # HLS / M3U8
    "application/vnd.ms-asf" = "vlc.desktop";           # ZPL/WVX
    "application/vnd.ms-wpl" = "vlc.desktop";           # WPL
    "application/sdp" = "vlc.desktop";                  # SDP for RT*P

    # Digital Video
    "audio/dv" = "amberol.desktop";                         # IANA-registered
    "video/dv" = "vlc.desktop";                         # IANA-registered

    # IFF related formats
    "audio/x-aiff" = "amberol.desktop";
    "audio/x-pn-aiff" = "amberol.desktop";
    "video/x-anim" = "vlc.desktop";

    # NullSoft video
    "video/x-nsv" = "vlc.desktop";

    # Autodesk animation format
    "video/fli" = "vlc.desktop";
    "video/flv" = "vlc.desktop";
    "video/x-flc" = "vlc.desktop";
    "video/x-fli" = "vlc.desktop";
    "video/x-flv" = "vlc.desktop";

    # Audio sample formats
    "audio/wav" = "amberol.desktop";
    "audio/x-pn-au" = "amberol.desktop";
    "audio/x-pn-wav" = "amberol.desktop";
    "audio/x-wav" = "amberol.desktop";
    "audio/x-adpcm" = "amberol.desktop";                 # Same as IANA registered audio/32KADPCM?

    # Raw audio
    "audio/ac3" = "amberol.desktop";                     # IANA AC3
    "audio/eac3" = "amberol.desktop";                    # IANA E-AC3
    "audio/vnd.dts" = "amberol.desktop";                 # IANA DTS Audio
    "audio/vnd.dts.hd" = "amberol.desktop";              # IANA DTS-HD
    "audio/vnd.dolby.heaac.1" = "amberol.desktop";       # IANA Dolby HeAAC
    "audio/vnd.dolby.heaac.2" = "amberol.desktop";       # IANA Dolby HeAAC
    "audio/vnd.dolby.mlp" = "amberol.desktop";           # IANA MLP/TrueHD
    "audio/basic" = "amberol.desktop";                   # IANA mulaw
    "audio/midi" = "amberol.desktop";

    # Weird audio formats
    "audio/x-ape" = "amberol.desktop";
    "audio/x-gsm" = "amberol.desktop";
    "audio/x-musepack" = "amberol.desktop";
    "audio/x-tta" = "amberol.desktop";
    "audio/x-wavpack" = "amberol.desktop";
    "audio/x-shorten" = "amberol.desktop";

    # Adobe Flash player related
    "application/x-shockwave-flash" = "vlc.desktop";
    "application/x-flash-video" = "vlc.desktop";

    # SHOUTcast 2
    "misc/ultravox" = "vlc.desktop";

    # RealPix
    "image/vnd.rn-realpix" = "vlc.desktop";

    # Modplug / GME
    "audio/x-it" = "amberol.desktop";
    "audio/x-mod" = "amberol.desktop";
    "audio/x-s3m" = "amberol.desktop";
    "audio/x-xm" = "amberol.desktop";
  };

  home.sessionVariables.DEFAULT_BROWSER = "${inputs.zen-browser.packages."${pkgs.system}"}/bin/zen";
}