

#all
use_bpm 123

maquillage = "D:/Random/Sonic Pi/Proyectos/Aerodynamic/media/il-macquillage-lady.wav"
aerodynamic = "D:/Random/Sonic Pi/Proyectos/Aerodynamic/media/funk.wav"

load_sample maquillage
load_sample aerodynamic

#sample maquillage, beat_stretch: 16, start: 0.0, finish: 1/16.0

define :sample_chunk do |what, beat, dur, delay|
  beat = beat / 16.0
  dur = dur / 16.0
  sample what, beat_stretch: 16, start: beat, finish: beat + dur
  sleep delay
end

define :funk do
  
  # sample_chunk(aerodynamic, 0.0, 4.0, 4.0)
  
  sample_chunk(maquillage, 0.0, 0.5, 0.5)
  sample_chunk(maquillage, 2.5, 1.0, 0.25)
  sample_chunk(maquillage, 3.5, 0.5, 0.75)
  sample_chunk(maquillage, 0.0, 0.5, 0.5)
  sample_chunk(maquillage, 8.5, 0.5, 0.5)
  sample_chunk(maquillage, 2.5, 1.0, 1.0)
  sample_chunk(maquillage, 7.5, 0.5, 0.5)
  
  # sample_chunk(aerodynamic, 4.0, 4.0, 4.0)
  
  sample_chunk(maquillage, 3.5, 0.5, 0.5)
  sample_chunk(maquillage, 2.5, 1.0, 1.0)
  sample_chunk(maquillage, 7.5, 0.5, 0.5)
  sample_chunk(maquillage, 8.5, 0.5, 0.5)
  sample_chunk(maquillage, 2.5, 1.0, 1.0)
  sample_chunk(maquillage, 7.5, 0.5, 0.5)
  
  # sample_chunk(aerodynamic, 8.0, 4.0, 4.0)
  
  sample_chunk(maquillage, 0.0, 0.5, 0.5)
  sample_chunk(maquillage, 2.5, 1.0, 0.25)
  sample_chunk(maquillage, 3.5, 0.5, 0.75)
  sample_chunk(maquillage, 0.0, 0.5, 0.5)
  sample_chunk(maquillage, 8.5, 0.5, 0.5)
  sample_chunk(maquillage, 2.5, 1.0, 1.0)
  sample_chunk(maquillage, 7.5, 0.5, 0.5)
  
  # sample_chunk(aerodynamic, 12.0, 4.0, 4.0)
  
  sample_chunk(maquillage, 3.5, 0.5, 0.5)
  sample_chunk(maquillage, 8.5, 0.25, 0.0)
  sample_chunk(maquillage, 2.5, 1.0, 0.25)
  sample_chunk(maquillage, 3.5, 0.5, 0.5)
  sample_chunk(maquillage, 8.5, 0.25, 0.25)
  sample_chunk(maquillage, 3.5, 0.5, 0.5)
  sample_chunk(maquillage, 8.5, 0.5, 0.5)
  sample_chunk(maquillage, 2.5, 1.0, 1.0)
  sample_chunk(maquillage, 7.5, 0.5, 0.5)
  
end

#Live loops
live_loop :main do
  sleep 4
end

live_loop :funk do
  #stop
  #sync :main
  
  with_fx :ixi_techno, mix: 0.1, phase: 8, cutoff_min: 90, cutoff_max: 120, res: 0.9, amp: 1 do
    with_fx :bpf, mix: 0, res: 0.00001, centre: :B8, amp: 2 do
      funk
    end
  end
end

live_loop :extra_beat do
  stop
  sync :main
  
  32.times do
    tick
    sample :bd_fat, amp: 2 if spread(1, 16).look
    sample :bd_fat, amp: 1.5 if spread(1, 32).rotate(4).look
    synth :cnoise, release: 0.6, cutoff: 130, env_curve: 7, amp: 1 if spread(1, 16).rotate(8).look
    synth :cnoise, release: 0.1, cutoff: 130, env_curve: 7, amp: 0.25 if spread(1, 2).look
    sleep 0.125
  end
end



