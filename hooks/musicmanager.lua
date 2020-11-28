local jukebox_default_tracks_ori_mallbank = MusicManager.jukebox_default_tracks
function MusicManager:jukebox_default_tracks()
    local default_options = jukebox_default_tracks_ori_mallbank(self)
    default_options.heist_narr_friday_name = "music_friday"
    return default_options
end