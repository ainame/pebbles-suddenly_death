# -*- coding: utf-8 -*-
require "pebbles/suddenly_death/version"

module Pebbles
  class SuddenlyDeathError < StandardError
    def message
      <<'EOS'
＿人人人人人人＿
＞　突然の死　＜
￣Y^Y^Y^Y^Y￣
EOS
    end
  end

  module SuddenlyDeath
    def self.included(base)
      base.class_eval do 
        defined_instance_methods =
          base.public_instance_methods(true) - Object.public_instance_methods(true)

        defined_instance_methods.each do |method|
          method_with_death = (method.to_s + "_with_death").to_sym
          method_without_death = (method.to_s + "_without_death").to_sym

          define_method(method_with_death) do |*args|
            __send__ method_without_death, *args
            raise Pebbles::SuddenlyDeathError if rand(100) == 0
          end

          alias_method method_without_death, method
          alias_method method, method_with_death
        end

        singleton_class = (class << base; self end)
        defined_class_methods =
          self.public_methods(true) - Object.public_methods(true)
        
        defined_class_methods.each do |method|
          method_with_death = (method.to_s + "_with_death").to_sym
          method_without_death = (method.to_s + "_without_death").to_sym
          singleton_class.class_eval do
            define_method(method_with_death) do |*args|
              __send__ method_without_death, *args
              raise Pebbles::SuddenlyDeathError if rand(100) == 0
            end

            alias_method method_without_death, method
            alias_method method, method_with_death
          end
        end
      end
    end
  end
end
