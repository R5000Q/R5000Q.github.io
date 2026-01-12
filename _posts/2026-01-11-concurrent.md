---
title: "Javaの並行処理"
date: 2026-01-11 00:00:00 +0900
categories:
- Java
tags:
- Java
---

# Javaの並列処理について
まず、最も単純なスレッド新たに作成するコード例を見てみる。  
下記のコードは大きく２つの展開がなされる。  
①mainスレッドがThreadインスタンスを生成  
②Threadインスタンスのstartメソッドによって新しいスレッドを起動  
  
※ラムダ式でThreadクラスのrunメソッドをオーバーライドし、新規に作成されたスレッドで実行する処理を記載している。  
Threadクラスは関数型インターフェースのRunnableを実装している。

```java
public class ConcurrentSample {
    public static void main(String[] args) {
        // mainスレッドのスレッドIDを取得
        Thread main = Thread.currentThread();
        System.out.printf("main: name=%s id=%d%n", main.getName(), main.getId());

        // 新たに作成するスレッドのIDを取得※この時点では新規のスレッドは作られない
        Thread t0 = new Thread(() -> {
            Thread me = Thread.currentThread();
            System.out.printf("t0  : name=%s id=%d%n", me.getName(), me.getId());
        });

        // スレッドの起動
        t0.start();
    }
}
```

コードの実行結果としてコンソール上には下記のような結果が表示される。
```
main: name=main id=1
t0  : name=Thread-0 id=16
```
このことから、mainスレッド以外に新たなスレッドが追加で起動していることが確認できる。

## 課題
この実装の課題としては次のようなことがある。  
例えば10スレッドで並行処理をしたい場合、Threadインスタンスを10個作成する必要があり負荷が大きくなる。また、あるスレッドの処理が先に完了したのにも関わらず新たなスレッドを作成するという無駄も生じる。  
このような課題に対照する方法としてThreadPoolという概念が存在する。
