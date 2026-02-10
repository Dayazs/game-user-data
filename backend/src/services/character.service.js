import { findAllCharacters, findCharacterSkillById, findCharacterAttributesById } from '../models/character.model.js';

// 获取角色基本信息
async function getAllCharacters() {
  return await findAllCharacters();
}

// 获取指定id角色技能信息
async function getCharacterSkillById(id) {
  return await findCharacterSkillById(id);
}

// 获取指定id角色属性
async function getCharacterAttributesById(id) {
  return await findCharacterAttributesById(id);
}

export { getAllCharacters, getCharacterSkillById, getCharacterAttributesById };
