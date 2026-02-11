import request from "./request";

// 获取所有角色
export function getAllcharacters() {
  return request.get('/api/characters')
}

// 获取指定角色定位和属性
export function getCharacterRanks(id) {
  return request.get('/api/characters/ranks', {
    params: { id }
  })
}