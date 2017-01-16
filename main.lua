-----------------------------------------------------------------------------------------
--
-- Corona Sdk Derslerinin Birincisi Olan Örnek Oyun Oluşturmanın Türkçe Açıklamalı Kodları
-- Başım Ağrıyor Amk
-----------------------------------------------------------------------------------------
local background = display.newImageRect("background.png",360,570)
--local komutu bildiğimiz public-local olayı değişkenin başka fonksiyondan değiştirilmesini engellemek için.
background.x = display.contentCenterX -- x ekseninde resmi ortaladık
background.y = display.contentCenterY -- y ekseninde resmi ortaladık
local platform = display.newImageRect("platform.png",300,50)
platform.x = display.contentCenterX
platform.y = display.contentHeight-25 --contentHeight içerik yüksekliği balondan biraz aşağıda --olsun diye azalttık
--platform resmini ekledik ve ortalayıp biraz aşağıya çektik :D
local balloon = display.newImageRect("balloon.png",112,112)
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY
--balon'u ekleyip ekranda ortaladık.ş
balloon.alpha = 0.8 -- alpha = opacity = saydamlık demektir , saydamlığını %80 yaptık.
local fizik = require("physics") --Lua'da library'ler böyle import edilir , fizik'i import ettik.
fizik.start()
fizik.addBody(platform,"static") --Fotoğrafı GameObject'e Çevirdik ve Statik Collider Ekledik
--statik gameObjectlere hiçbir fizik şeyi etki etmez.
fizik.addBody(balloon,"dynamic", {radius=50,bounce=0.3})
--radius yarıçap demektir collideri ayarladık yani radius=50 diyerek (resmin pikseli 50px)
--bounce ise zıplama-sekme eğilimi 0-1 arası değer alır 1 ve üstü %100 enerjiyle seker
--bounce değeri 0 olsa bile standart olarak bounce değeri 0.2'dir ve yinede hafiften ziplar
--bounceyi tamamen yoketmek için static nesneye de bounce = 0 verilmelidir.
local tapsayisi = 0
local tapgosterge = display.newText(tapsayisi,display.contentCenterX,20,native.systemFont,40)
tapgosterge:setFillColor(0,0,0)
local function balonIt() --balonu basınca itme fonksiyonu
  balloon:applyLinearImpulse(0,-0.75,balloon.x,balloon.y) --balona düşey eksende kuvvet uyguladık
  --corona'da düşey eksen ters yani - kuvvet yukarı oluyor.
  tapsayisi = tapsayisi + 1
  tapgosterge.text = tapsayisi
end
balloon:addEventListener("tap",balonIt) 
-- klasik EventListener "tap" algıladığında balonIt fonksiyonunu çalıştırıyor.




