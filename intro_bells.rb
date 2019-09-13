#all
use_bpm 123

#sample maquillage, beat_stretch: 16, start: 0.0, finish: 1/16.0

#Live loops
live_loop :main do
  sleep 4
end

live_loop :intro do
  #stop # remove me if you want bells
  
  sync :main
  
  use_synth :pretty_bell
  use_synth_defaults release: 9
  
  with_fx :level, amp: 0.5 do
    4.times do
      with_fx :gverb, room: 20 do
        play :A1, amp: 0.25
        play :A2, amp: 0.5
        play :A3, amp: 1.5
        play :A4, amp: 0.75
        play :A5, amp: 0.5
        sleep 8
      end
    end
  end
end


