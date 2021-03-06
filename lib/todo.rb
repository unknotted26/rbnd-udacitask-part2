require_relative '../lib/listable'
class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = format_date(options)
    #@due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end

  def format_priority
    value = " ⇧" if @priority == "high"
    value = " ⇨" if @priority == "medium"
    value = " ⇩" if @priority == "low"
    value = "" if !@priority
    return value
  end

  def details
    format_description(@description) + "due: " +
    @due +
    format_priority
  end
end
