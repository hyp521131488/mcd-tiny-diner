#!/usr/bin/env bash
# ==============================================================
#  Tiny Eye · 一键推送 + 报名
#  用法： ./push-and-register.sh <GitHub令牌> [仓库名]
#  示例： ./push-and-register.sh github_pat_xxx mcd-tiny-diner
# ==============================================================
set -euo pipefail

TOKEN="${1:-${GH_TOKEN:-}}"
REPO_NAME="${2:-mcd-tiny-diner}"

if [ -z "$TOKEN" ]; then
  echo "用法: $0 <GitHub令牌> [仓库名]" >&2
  exit 1
fi

export GH_TOKEN="$TOKEN"
OFFICIAL_REPO="M-China-Official/mcd-developer-innovation-challenge"

echo "──────────────────────────────────"
echo " 1/5  验证令牌身份"
echo "──────────────────────────────────"
OWNER=$(gh api user --jq '.login')
echo "  账号: $OWNER"

echo "──────────────────────────────────"
echo " 2/5  确保仓库 ${OWNER}/${REPO_NAME} 存在且为 Public"
echo "──────────────────────────────────"
if gh api "repos/${OWNER}/${REPO_NAME}" >/dev/null 2>&1; then
  VIS=$(gh api "repos/${OWNER}/${REPO_NAME}" --jq '.private')
  if [ "$VIS" = "true" ]; then
    echo "  仓库当前为 Private，正在改为 Public..."
    gh api -X PATCH "repos/${OWNER}/${REPO_NAME}" -f private=false >/dev/null
    echo "  ✅ 已切换为 Public"
  else
    echo "  ✅ 仓库已存在且为 Public"
  fi
else
  echo "  仓库不存在，正在创建..."
  gh repo create "$REPO_NAME" --public \
    --description "🍟 麦麦小人之眼 Tiny Eye —— 从2岁孩子视角重构麦当劳点餐体验 | M-CODE 1024程序员节创意开发大赛参赛作品" \
    --homepage "https://github.com/${OWNER}/${REPO_NAME}" \
    --source=. --push
  echo "  ✅ 仓库已创建并推送"
fi

REPO_URL="https://github.com/${OWNER}/${REPO_NAME}"

echo "──────────────────────────────────"
echo " 3/5  推送代码"
echo "──────────────────────────────────"
if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "https://${OWNER}:${TOKEN}@github.com/${OWNER}/${REPO_NAME}.git"
else
  git remote add origin "https://${OWNER}:${TOKEN}@github.com/${OWNER}/${REPO_NAME}.git"
fi
git branch -M main
git push -u origin main --force
echo "  ✅ 已推送到 ${REPO_URL}"

echo "──────────────────────────────────"
echo " 4/5  提交报名 Issue"
echo "──────────────────────────────────"
ISSUE_BODY="【参赛申请】
项目名称：麦麦小人之眼 Tiny Eye
项目地址：${REPO_URL}
项目简介：所有的麦当劳点餐助手都在服务成年人——更快下单、更省钱。Tiny Eye 反其道而行，服务那个看不懂一个字、说不清一句话、却对薯条有强烈主张的2岁小朋友：三种幼儿视角的交互入口（指一下/学声音/今天心情），把菜单翻译成「颜色+形状+声音+触感」的孩子语言，Why-Why 小人之问让点餐变成一次亲子陪玩，再用「家长卡」把价格、营养与2岁食用提示透明交给父母。基于麦当劳 MCP 的 query-meals / list-nutrition-foods / calculate-price / create-order 等真实能力构建，并设置只读优先、二元限制、家长卡、显式确认四道安全闸门。让孩子第一次成为点餐的主角，让爸妈第一次不用当翻译。"

ISSUE_URL=$(gh issue create \
  --repo "$OFFICIAL_REPO" \
  --title "【参赛申请】麦麦小人之眼 Tiny Eye —— 从2岁孩子视角重构麦当劳点餐体验" \
  --body "$ISSUE_BODY")
echo "  ✅ 报名 Issue 已提交: $ISSUE_URL"

echo "──────────────────────────────────"
echo " 5/5  完成"
echo "──────────────────────────────────"
echo ""
echo "  仓库地址 : ${REPO_URL}"
echo "  报名 Issue: ${ISSUE_URL}"
echo ""
echo "  下一步：等待官方在 Issue 下回复报名成功通知。"
echo "  提醒：务必把 GitHub 注册邮箱设为公开，否则收不到获奖通知。"
echo "        设置页 https://github.com/settings/profile → Public email"
