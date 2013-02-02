# これは何?

Ruby の Fiber クラスのサンプルです。

## 発表スライド

[slide share](http://www.slideshare.net/TomohikoHimura/hiroshimarb-027fiber)

## 実行方法

```
# Fiberを利用しているバージョン
$ bin/fiber_sample.rb
# Fiberを利用していないバージョン
$ bin/non_fiber_sample.rb
```

## 実行してる様子

<iframe width="420" height="315" src="http://www.youtube.com/embed/UOIOVLrBDEA" frameborder="0" allowfullscreen></iframe>

## 解説

いろいろファイルがありますが、違う部分は`Plyear`と`PlayerFiber` の stepメソッドです。

すごくアバウトに説明すると、Fiberを利用するといったりきたりする部分を**まっすぐに記述できます。**

```diff
$ diff -u lib/player.rb lib/player_fiber.rb
--- lib/player.rb       2013-01-31 18:37:40.000000000 +0900
+++ lib/player_fiber.rb 2013-01-31 18:38:27.000000000 +0900
@@ -1,27 +1,42 @@
 require 'curses'
 
-class Player
+class PlayerFiber
   def initialize
-    @time = 0
     @x = 5
     @y = 5
   end
 
   def step
-    if @time < 10
-      @x += 1
-    elsif @time >=10 and @time < 20
-      @y += 1
-    elsif @time >= 20 and @time < 30
-      @x -= 1
-    elsif @time >= 30 and @time < 40
-      @y -= 1
-    else
-      @x = 0
-      @y = 0
-      @time = 0
+    fiber.resume
+  end
+
+  def fiber
+    @fiber ||= Fiber.new do
+      loop do
+        @x = 5
+        @y = 5
+
+        10.times do
+          @x += 1
+          Fiber.yield
+        end
+
+        10.times do
+          @y += 1
+          Fiber.yield
+        end
+
+        10.times do
+          @x -= 1
+          Fiber.yield
+        end
+
+        10.times do
+          @y -= 1
+          Fiber.yield
+        end
+      end
     end
-    @time += 1
   end
```
