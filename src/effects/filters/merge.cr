# https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feMerge
# https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feMergeNode
class Celestine::Filter::Merge < Celestine::Filter::Basic
  TAG = "feMerge"
  NODE_TAG = "feMergeNode"

  def add_node(filter_name)
    inner_elements << %Q[<#{NODE_TAG} in="#{filter_name}" />]
  end

  def draw(io : IO) : Nil
    io << %Q[<#{TAG} ]
    class_attribute(io)
    id_attribute(io)
    custom_attribute(io)
    
    body_attribute(io)
    style_attribute(io)

    io << %Q[result="#{result}" ] if result

    if inner_elements.empty?
      io << %Q[/>]
    else
      io << ">"
      io << inner_elements
      io << "</#{TAG}>"
    end
  end

  module Attrs
  end
end