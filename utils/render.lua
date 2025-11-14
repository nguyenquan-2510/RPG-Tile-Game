local render = {}

function render.draw_layer_with_scale(render_map, layer_name, scale_x, scale_y)

    scale_x = scale_x or 1
    scale_y = scale_y or scale_x

    love.graphics.push()
    love.graphics.scale(scale_x, scale_y)
    render_map:drawLayer(render_map.layers[layer_name])
    love.graphics.pop()
end

function render.draw_with_scale(draw_function, parameter, scale_x, scale_y)
    scale_x = scale_x or 1
    scale_y = scale_y or scale_x

    love.graphics.push()
    love.graphics.scale(scale_x, scale_y)
    
    if parameter then
        draw_function(parameter)
    else draw_function()
    end

    love.graphics.pop()
end

return render