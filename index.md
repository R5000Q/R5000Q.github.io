---
layout: default
title: Home
---

# Tech Blog

このページはテスト用のトップページです。下に記事一覧を表示します。

## Posts
<ul>
{% raw %}{% for post in site.posts %}{% endraw %}
  <li>
    <a href="{% raw %}{{ post.url | relative_url }}{% endraw %}">
      {% raw %}{{ post.date | date: "%Y-%m-%d" }}{% endraw %} - {% raw %}{{ post.title }}{% endraw %}
    </a>
  </li>
{% raw %}{% endfor %}{% endraw %}
</ul>
