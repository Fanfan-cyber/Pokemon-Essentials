#===============================================================================
#
#===============================================================================
class UIControls::BitmapButton < UIControls::Button
  BUTTON_PADDING = 4

  def initialize(x, y, viewport, button_bitmap)
    super(button_bitmap.width + (BUTTON_PADDING * 2), button_bitmap.height + (BUTTON_PADDING * 2), viewport)
    self.x = x
    self.y = y
    @button_bitmap = button_bitmap
  end

  def set_interactive_rects
    @interactions&.clear
    @button_rect = Rect.new(0, 0, width, height)
    @interactions = {
      :button => @button_rect
    }
  end

  #-----------------------------------------------------------------------------

  def refresh
    super
    # Draw button bitmap
    self.bitmap.blt(BUTTON_PADDING, BUTTON_PADDING, @button_bitmap,
                    Rect.new(0, 0, @button_bitmap.width, @button_bitmap.height))
  end
end
