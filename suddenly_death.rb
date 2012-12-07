# -*- coding: utf-8 -*-
require './suddenly_death_module.rb'

Plugin.create(:suddenly_death) do
 command(:suddenly_death,
         name: '突然の死',
         condition: lambda{ |opt| true },
         visible: true,
         role: :postbox) do |opt|
    opt.buffer.text = SuddenlyDeath.wrap opt.buffer.text
  end
end
