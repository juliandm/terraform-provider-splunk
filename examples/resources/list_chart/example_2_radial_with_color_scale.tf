# Example showing color_scale with secondary visualization (Radial)
# This demonstrates that color_scale can be used with any color_by value
# when using secondary visualizations like Radial, Linear, etc.

resource "signalfx_list_chart" "radial_chart" {
  name = "CPU Usage with Radial Visualization"

  program_text = <<-EOF
    data("cpu.total.idle").publish(label="CPU Idle")
    EOF

  description = "List chart with Radial secondary visualization and color scale"

  color_by               = "Metric"
  secondary_visualization = "Radial"

  color_scale {
    gte  = 0
    lt   = 40
    color = "red"
  }

  color_scale {
    gte  = 40
    lt   = 80
    color = "yellow"
  }

  color_scale {
    gte   = 80
    color = "green"
  }
}

