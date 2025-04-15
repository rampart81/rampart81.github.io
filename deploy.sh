#!/bin/bash

set -e # 중간에 에러 나면 스크립트 중지

echo "📦 Jekyll 빌드 시작..."
bundle exec jekyll build

echo "🌳 gh-pages 임시 브랜치 생성..."
git subtree split --prefix _site -b gh-pages-temp

echo "🚀 gh-pages 브랜치에 강제 푸시..."
git push origin gh-pages-temp:gh-pages --force

echo "🧹 임시 브랜치 제거..."
git branch -D gh-pages-temp

echo "🔀 main 브랜치 푸시..."
git add -A
git commit -m "Deploy to GitHub Pages"
git push origin main

echo "✅ 배포 완료!"

