import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.display.SimpleButton;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.external.ExternalInterface;
import flash.display.Shape;
import flash.errors.Error;

@:bind
class ButtonUpSprite extends flash.display.Sprite {
  public function new() {
    super();
  }
}

@:bind
class ButtonDownSprite extends flash.display.Sprite {
  public function new() {
    super();
  }
}

@:bind
class ButtonOverSprite extends flash.display.Sprite {
  public function new() {
    super();
  }
}


class Clippy {
  // Main
  static function main() {
    // label
    var label:TextField = new TextField();
    var format:TextFormat = new TextFormat("Arial", 10);
    label.text = "copy to clipboard";
    label.setTextFormat(format);
    label.textColor = 0x888888;
    label.selectable = false;
    label.x = 15;
    label.visible = false;
    
    flash.Lib.current.addChild(label);
    
    // button
    var button:SimpleButton = new SimpleButton();
    button.useHandCursor = true;
    button.upState = new ButtonUpSprite();
    button.overState = new ButtonOverSprite();
    button.downState = new ButtonDownSprite();
    button.hitTestState = new ButtonDownSprite();
    
    button.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent) {
      // load inside event handler so that it can pick up parameter changes
      var text = ExternalInterface.call(flash.Lib.current.loaderInfo.parameters.func);
      flash.system.System.setClipboard(text);
      label.text = "copied!";
      label.setTextFormat(format);
    });
    
    button.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent) {
      label.visible = true;
    });
    
    button.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent) {
      label.visible = false;
      label.text = "copy to clipboard";
      label.setTextFormat(format);
    });
    
    flash.Lib.current.addChild(button);
  }
}