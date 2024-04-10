

live_loop :melody do
    use_synth :mod_fm
    use_synth_defaults attack: 0.25, release: 0.5, pan: rrand(-0.5, 0.5), cutoff: 50
    play 72
    sleep 0.25
    play 76
    sleep 0.25
    play 76
    sleep 0.25
  end