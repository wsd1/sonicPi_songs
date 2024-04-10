# from: https://sonic-pi.mehackit.org/exercises/en/02-make-a-song/05-add-randomization.html
# 这是教程部分内容，最终输出音乐请看链接


live_loop :melody do
    if one_in(6)
      use_transpose 2
    else
      use_transpose 0
    end
    play_pattern_timed [:c4, :e4, :f4, :g4, :f4, :e4, :f4, :g4, :f4, :e4, :f4], [0.25, 0.25, 0.25, 1.5, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25], attack: 0, release: 0.2
  end

  # ----


  loop do
    use_octave [0, 1].choose
    play [:c, :e, :g].choose
    sleep [0.25, 0.25, 0.5, 1].choose
  end

# ---
# 幽默

live_loop :bass do
    use_synth :tb303
    play (chord :C2, :major).choose, release: 0.125, cutoff: rrand(60, 110)
    sleep 0.25
  end

