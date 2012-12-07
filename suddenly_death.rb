# -*- coding: utf-8 -*-
require './suddenly_death_module.rb'

Plugin.create(:suddenly_death) do
 command(:suddenly_death,
         name: '突然の死',
         condition: Plugin::Command[:Editable],
         visible: false,
         icon: MUI:Skin.get("post.png"),
         role: :postbox) do |opt|
    opt.buffer.text = SuddenlyDeath.wrap opt.buffer.text
  end
end
