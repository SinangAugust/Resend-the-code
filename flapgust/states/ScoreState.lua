--[[
    ScoreState Class

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]
local bronze = love.graphics.newImage('bronze1.png')
local silver = love.graphics.newImage('silver1.png')
local gold = love.graphics.newImage('gold1.png')
local weak = love.graphics.newImage('weak.png')


ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Noob! You lost! :(', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Press Enter to Play Again!', 0, 170, VIRTUAL_WIDTH, 'center')

    love.graphics.printf('Trophy earned: ', -15, VIRTUAL_HEIGHT - 155, VIRTUAL_WIDTH, 'center')
    if self.score <= 5 then
        love.graphics.draw(weak, 300, VIRTUAL_HEIGHT - 160)
    elseif self.score <= 10 then
        love.graphics.draw(bronze, 300, VIRTUAL_HEIGHT - 160)
    elseif self.score <= 15 then
        love.graphics.draw(silver, 300, VIRTUAL_HEIGHT - 160)
    elseif self.score >= 16 then
        love.graphics.draw(gold, 300, VIRTUAL_HEIGHT - 160)
    end
end