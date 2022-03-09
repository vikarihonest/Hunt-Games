require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "com.androlua.*"
import "android.graphics.*"
activity.setTheme(android.R.style.Theme_DeviceDefault_Light)

activity.setContentView(loadlayout({
  LinearLayout,
  layout_height="fill",
  id="tv2",
  {
    ImageView,
    layout_height="150",
    layout_width="150",
    id="tv3",
    translationY="1000";
  },
  {
    ImageView,
    layout_height="100",
    layout_width="106",
    id="t",
    background="1.png";

  },
  {
    TextView,
    layout_height="200",
    layout_width="306",
    textSize="50dp";
    Gravity="bottom";
    translationY="480";
    translationX="50";
    id="sc";
  },

}))



tv3.setImageBitmap(loadbitmap("2.png"))

function b()
  require("import")
  while activity.get("Endt") ~= true do
    Thread.sleep(10)
    call("c")
  end
end


thread(b)

X=100
Y=10

Score=0
H=450
V2=50
function c()

  X=X+Y
  if X >= 150 then
    tv3.setImageBitmap(loadbitmap("2.png"))
  end
  if X >= 1000 then
    X=100
    HV=H+150
    V3=HV-V2

    if V3 <= 30 and V3 >= -20 then
      tv3.setImageBitmap(loadbitmap("3.png"))

      Score=Score+1
      sc.setText(tostring(Score))
    end
    if Score == 10 then
      Endt=true
    end

    H=H+math.random(-300,300)
    if H <= -130 then
      H= -130
    end
    if H >= 450 then
      H= 450
    end
  end
  t.setTranslationX(H)
  t.setTranslationY(X);
end


tv2.onTouch=function(v,e)
  a = e.getAction()
  switch a
   case MotionEvent.ACTION_MOVE
    key=e.getX()-40
    V2=string.match(key,"(.*)%.")

    V2=tonumber(V2)

    tv3.setTranslationX(key)
  end
  return true
end





