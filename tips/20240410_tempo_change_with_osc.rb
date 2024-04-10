
# 如何通过OSC从外部设定乐曲整体节奏
# dy 20240410


# 定义一个全局变量，用于存储节奏信息
bpm_rate = 60

# 定义一个 live_loop 用于接收外部 OSC 消息并调整节奏
live_loop :adjust_bpm do
  
  # 监听外部 OSC 消息
  a, b, c = sync "/osc*/trigger/prophet"
  
  # 根据收到的消息设置节奏乘数
  case a
  when 1
    bpm_rate = 40  # 恢复原来的节奏
  when 2
    bpm_rate = 60  # 调整节奏为原来的 1.5 倍
  when 3
    bpm_rate = 80  # 调整节奏为原来的 0.8 倍
  end
end

# 在另一个 live_loop 中播放音乐，并根据节奏乘数调整节奏
live_loop :play_music do
  
  use_bpm  bpm_rate  # 使用全局变量中的节奏乘数来调整节奏
  play 60
  sleep 1
end



=begin

# pip install python-osc

from pythonosc import osc_message_builder
from pythonosc import udp_client
sender = udp_client.SimpleUDPClient('127.0.0.1', 4560)
sender.send_message('/trigger/prophet', [2, 100, 8])

=end
