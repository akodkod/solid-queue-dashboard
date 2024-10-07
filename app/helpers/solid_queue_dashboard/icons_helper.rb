module SolidQueueDashboard
  module IconsHelper
    def icon_refresh_cw(options = {})
      svg_options = {
        xmlns: "http://www.w3.org/2000/svg",
        width: "24",
        height: "24",
        viewBox: "0 0 24 24",
        fill: "none",
        stroke: "currentColor",
        "stroke-width": "2",
        "stroke-linecap": "round",
        "stroke-linejoin": "round"
      }.merge(options)

      tag.svg(**svg_options) do
        concat tag.path(d: "M3 12a9 9 0 0 1 9-9 9.75 9.75 0 0 1 6.74 2.74L21 8")
        concat tag.path(d: "M21 3v5h-5")
        concat tag.path(d: "M21 12a9 9 0 0 1-9 9 9.75 9.75 0 0 1-6.74-2.74L3 16")
        concat tag.path(d: "M8 16H3v5")
      end
    end

    def icon_triangle_alert(options = {})
      svg_options = {
        xmlns: "http://www.w3.org/2000/svg",
        width: "24",
        height: "24",
        viewBox: "0 0 24 24",
        fill: "none",
        stroke: "currentColor",
        "stroke-width": "2",
        "stroke-linecap": "round",
        "stroke-linejoin": "round"
      }.merge(options)

      tag.svg(**svg_options) do
        concat tag.path(d: "m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3")
        concat tag.path(d: "M12 9v4")
        concat tag.path(d: "M12 17h.01")
      end
    end

    def icon_server(options = {})
      svg_options = {
        xmlns: "http://www.w3.org/2000/svg",
        width: "24",
        height: "24",
        viewBox: "0 0 24 24",
        fill: "none",
        stroke: "currentColor",
        "stroke-width": "2",
        "stroke-linecap": "round",
        "stroke-linejoin": "round"
      }.merge(options)

      tag.svg(**svg_options) do
        concat tag.rect(width: "20", height: "8", x: "2", y: "2", rx: "2", ry: "2")
        concat tag.rect(width: "20", height: "8", x: "2", y: "14", rx: "2", ry: "2")
        concat tag.line(x1: "6", x2: "6.01", y1: "6", y2: "6")
        concat tag.line(x1: "6", x2: "6.01", y1: "18", y2: "18")
      end
    end

    def icon_layout_dashboard(options = {})
      svg_options = {
        xmlns: "http://www.w3.org/2000/svg",
        width: "24",
        height: "24",
        viewBox: "0 0 24 24",
        fill: "none",
        stroke: "currentColor",
        "stroke-width": "2",
        "stroke-linecap": "round",
        "stroke-linejoin": "round"
      }.merge(options)

      tag.svg(**svg_options) do
        concat tag.rect(width: "7", height: "9", x: "3", y: "3", rx: "1")
        concat tag.rect(width: "7", height: "5", x: "14", y: "3", rx: "1")
        concat tag.rect(width: "7", height: "9", x: "14", y: "12", rx: "1")
        concat tag.rect(width: "7", height: "5", x: "3", y: "16", rx: "1")
      end
    end

    def icon_logs(options = {})
      svg_options = {
        xmlns: "http://www.w3.org/2000/svg",
        width: "24",
        height: "24",
        viewBox: "0 0 24 24",
        fill: "none",
        stroke: "currentColor",
        "stroke-width": "2",
        "stroke-linecap": "round",
        "stroke-linejoin": "round"
      }.merge(options)

      tag.svg(**svg_options) do
        concat tag.path(d: "M13 12h8")
        concat tag.path(d: "M13 18h8")
        concat tag.path(d: "M13 6h8")
        concat tag.path(d: "M3 12h1")
        concat tag.path(d: "M3 18h1")
        concat tag.path(d: "M3 6h1")
        concat tag.path(d: "M8 12h1")
        concat tag.path(d: "M8 18h1")
        concat tag.path(d: "M8 6h1")
      end
    end

    def icon_clock(options = {})
      svg_options = {
        xmlns: "http://www.w3.org/2000/svg",
        width: "24",
        height: "24",
        viewBox: "0 0 24 24",
        fill: "none",
        stroke: "currentColor",
        "stroke-width": "2",
        "stroke-linecap": "round",
        "stroke-linejoin": "round"
      }.merge(options)

      tag.svg(**svg_options) do
        concat tag.circle(cx: "12", cy: "12", r: "10")
        concat tag.polyline(points: "12 6 12 12 16 14")
      end
    end

    def icon_github(options = {})
      svg_options = {
        xmlns: "http://www.w3.org/2000/svg",
        width: "24",
        height: "24",
        viewBox: "0 0 24 24",
        fill: "none",
        stroke: "currentColor",
        "stroke-width": "2",
        "stroke-linecap": "round",
        "stroke-linejoin": "round"
      }.merge(options)

      tag.svg(**svg_options) do
        concat tag.path(d: "M15 22v-4a4.8 4.8 0 0 0-1-3.5c3 0 6-2 6-5.5.08-1.25-.27-2.48-1-3.5.28-1.15.28-2.35 0-3.5 0 0-1 0-3 1.5-2.64-.5-5.36-.5-8 0C6 2 5 2 5 2c-.3 1.15-.3 2.35 0 3.5A5.403 5.403 0 0 0 4 9c0 3.5 3 5.5 6 5.5-.39.49-.68 1.05-.85 1.65-.17.6-.22 1.23-.15 1.85v4")
        concat tag.path(d: "M9 18c-4.51 2-5-2-7-2")
      end
    end

    def icon_x(options = {})
      svg_options = {
        xmlns: "http://www.w3.org/2000/svg",
        width: "24",
        height: "24",
        viewBox: "0 0 24 24",
        fill: "none",
        stroke: "currentColor",
        "stroke-width": "2",
        "stroke-linecap": "round",
        "stroke-linejoin": "round"
      }.merge(options)

      tag.svg(**svg_options) do
        concat tag.path(d: "M18 6 6 18")
        concat tag.path(d: "m6 6 12 12")
      end
    end

    def icon_moon(options = {})
      svg_options = {
        xmlns: "http://www.w3.org/2000/svg",
        width: "24",
        height: "24",
        viewBox: "0 0 24 24",
        fill: "none",
        stroke: "currentColor",
        "stroke-width": "2",
        "stroke-linecap": "round",
        "stroke-linejoin": "round"
      }.merge(options)

      tag.svg(**svg_options) do
        concat tag.path(d: "M12 3a6 6 0 0 0 9 9 9 9 0 1 1-9-9Z")
      end
    end

    def icon_sun(options = {})
      svg_options = {
        xmlns: "http://www.w3.org/2000/svg",
        width: "24",
        height: "24",
        viewBox: "0 0 24 24",
        fill: "none",
        stroke: "currentColor",
        "stroke-width": "2",
        "stroke-linecap": "round",
        "stroke-linejoin": "round"
      }.merge(options)

      tag.svg(**svg_options) do
        concat tag.circle(cx: "12", cy: "12", r: "4")
        concat tag.path(d: "M12 2v2")
        concat tag.path(d: "M12 20v2")
        concat tag.path(d: "m4.93 4.93 1.41 1.41")
        concat tag.path(d: "m17.66 17.66 1.41 1.41")
        concat tag.path(d: "M2 12h2")
        concat tag.path(d: "M20 12h2")
        concat tag.path(d: "m6.34 17.66-1.41 1.41")
        concat tag.path(d: "m19.07 4.93-1.41 1.41")
      end
    end

    def icon_play(options = {})
      svg_options = {
        xmlns: "http://www.w3.org/2000/svg",
        width: "24",
        height: "24",
        viewBox: "0 0 24 24",
        fill: "none",
        stroke: "currentColor",
        "stroke-width": "2",
        "stroke-linecap": "round",
        "stroke-linejoin": "round"
      }.merge(options)

      tag.svg(**svg_options) do
        concat tag.polygon(points: "6 3 20 12 6 21 6 3")
      end
    end
  end
end
