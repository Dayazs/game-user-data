import { findAllCharacters, findCharacterSkillById } from '../models/character.model.js';

// 获取角色基本信息
async function getAllCharacters() {
  return await findAllCharacters();
}

// 获取指定id角色技能信息
async function getCharacterSkillById(id) {
  return await findCharacterSkillById(id);
}

export { getAllCharacters, getCharacterSkillById };
