#all
use_bpm 123

#sample maquillage, beat_stretch: 16, start: 0.0, finish: 1/16.0

#Live loops
live_loop :main do
  sleep 4
end

live_loop :solo do
  #stop
  #sync :main
  
  use_synth :zawa
  use_synth_defaults attack: 0.05, sustain: 0.15, release: 0.125
  
  phases = [
    [:D4, :Fs3, :B3, :Fs3],
    [:D4, :Gs3, :B3, :Gs3],
    [:G4, :B3, :E4, :B3],
    [:E4, :A3, :Cs4, :A3],
    
    [:D4, :Fs4, :B3, :Fs4],
    [:D4, :Gs4, :B3, :Gs4],
    [:G4, :B3, :E4, :B3],
    [:E4, :A3, :Cs4, :A3],
  ]
  
  phases.each do |notes|
    4.times do
      notes.each do |n|
        play n
        sleep 0.25
      end
    end
  end
end

live_loop :extra_beat do
  stop
  #sync :main
  
  32.times do
    tick
    with_fx :level, amp: 0.1 do
      sample :bd_fat, amp: 2 if spread(1, 16).look
      sample :bd_fat, amp: 1.5 if spread(1, 32).rotate(4).look
      synth :cnoise, release: 0.6, cutoff: 130, env_curve: 7, amp: 1 if spread(1, 16).rotate(8).look
      synth :cnoise, release: 0.1, cutoff: 130, env_curve: 7, amp: 0.25 if spread(1, 2).look
      sleep 0.125
    end
  end
end




