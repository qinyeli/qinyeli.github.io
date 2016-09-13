---
layout: page
title:  Notes
navigation_weight: 5
---


<div class="related" name="blog-content">
  <ul class="related-posts">
    {% for note in site.notes %}
      <li>
        <h3>
          <a href="{{ note.url }}">
            {{ note.title }}
          </a>
        </h3>
      </li>
    {% endfor %}
  </ul>
</div>

## Cheat Sheets for Tools

<div class="related" name="blog-content">
  <ul class="related-posts">
    {% for cheatsheet in site.cheatsheets %}
      {% unless cheatsheet.categories contains 'course' %}
        <li>
          <h3>
            <a href="{{ cheatsheet.url }}">
              {{ cheatsheet.title }}
            </a>
          </h3>
        </li>
      {% endunless %}
    {% endfor %}
  </ul>
</div>

## Review Notes for Courses

<ul class="related-posts">
  {% for cheatsheet in site.cheatsheets %}
    {% if cheatsheet.categories contains 'eecs398' %}
      <h3>
        <a href="{{ cheatsheet.url }}">
          {{ cheatsheet.title }}
        </a>
      </h3>
    {% endif %}
  {% endfor %}

  <h3>
    <a href="/resources/cheatsheets/eecs281_cheatsheet.pdf">
      Data Structures and Algorithms
    </a>
  </h3>

  <h3>
    <a href="/resources/cheatsheets/eecs311_cheatsheet.pdf">
      Electronic Circuits
    </a>
  </h3>

  <h3>
    <a href="/resources/cheatsheets/vp240_cheatsheet.pdf">
      General Physics II
    </a>
  </h3>

  <h3>
    <a href="/resources/cheatsheets/eecs492_cheatsheet.pdf">
      Intro. to Artificial Intelligence
    </a>
  </h3>

  <h3>
    <a href="/resources/cheatsheets/eecs370_cheatsheet.pdf">
      Intro. to Computer Organization
    </a>
  </h3>

  <h3>
    <a href="/resources/cheatsheets/ve215_cheatsheet.pdf">
      Intro. to Electronic Circuits
    </a>
  </h3>

  {% for cheatsheet in site.cheatsheets %}
    {% if cheatsheet.categories contains 'eecs482' %}
      <h3>
        <a href="{{ cheatsheet.url }}">
          {{ cheatsheet.title }}
        </a>
      </h3>
    {% endif %}
  {% endfor %}

  <h3>
    <a href="/resources/cheatsheets/ve216_cheatsheet.pdf">
      Intro. to Signals and Systems
    </a>
  </h3>

  <h3>
    <a href="/resources/cheatsheets/ve401_cheatsheet.pdf">
      Probabilistic Methods in Engineering
    </a>
  </h3>

</ul>

