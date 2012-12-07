# -*- coding: utf-8 -*-
=begin
Plugin.create(:suddenly_death) do
 command(:suddenly_death,
         name: '突然の死',
         condition: lambda{ |opt| true },
         visible: true,
         role: :postbox) do |opt|
    opt.buffer.text = SuddenlyDeath.wrap opt.buffer.text
  end
end
=end
module SuddenlyDeath
  def wrap(text)
    len = byte_size(text) / 2
    "＿" + ("人" * (len + 2)) + "＿\n" +
      "＞　" + text + "　＜\n" +
      "￣^" + ("Y^" * len) + "￣"
  end
  def to_oct(c)
    c.bytes.to_a.inject{|result, item| result = (result << 8) | item }
  end
  def byte_size(text)
    size = 0
    text.chars.map{|c| to_oct c }.map{|i|
      if (i >= 0xefbda1 && i < 0xefbe9f) || (i >= 0x00 && i < 0x80)
        size += 1
      else
        size += 2
      end
    }
    size
  end
end
