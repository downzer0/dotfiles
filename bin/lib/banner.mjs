#!/usr/bin/env node

import figlet from 'figlet'
import gradient from 'gradient-string'

const text = process.argv[2] || 'DOT'
const font = process.argv[3] || 'ANSI Shadow'

// Color palettes
const palettes = {
  ocean: ['#0066FF', '#00CCFF', '#00FFCC'],
  sunset: ['#FF6B6B', '#FFA500', '#FFD700'],
  forest: ['#10B981', '#34D399', '#6EE7B7'],
  purple: ['#8B5CF6', '#A78BFA', '#C4B5FD'],
  blue: ['#3B82F6', '#60A5FA', '#93C5FD'],
  cyber: ['#00FF9F', '#00B8FF', '#001EFF'],
}

const palette = palettes.cyber

try {
  const asciiArt = figlet.textSync(text, {
    font: font,
    horizontalLayout: 'default',
    verticalLayout: 'default',
    width: 100,
    whitespaceBreak: true,
  })

  // Create gradient function
  const gradientFn = gradient(palette)

  // Apply gradient to ASCII art
  console.log(gradientFn.multiline(asciiArt))
} catch (error) {
  // Fallback to simple text if figlet fails
  console.log(text)
}
