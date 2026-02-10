import { getAllCharacters, getCharacterSkillById, getCharacterAttributesById } from '../services/character.service.js';

// 获取角色基本信息
async function getCharacters(req, res) {
  try {
    const data = await getAllCharacters();
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: '查询失败' });
  }
}

// 获取指定id角色技能信息
async function getCharacterSkills(req, res) {
  try {
    const { id } = req.query;
    const data = await getCharacterSkillById(id);
    res.json(data);

  } catch (err) {
    res.status(500).json({ message: '获取失败' });
  }
}

// 获取指定角色属性
async function getCharacterAttributes(req, res) {
  try {
    const { id } = req.query;
    const data = await getCharacterAttributesById(id);
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: '获取失败' });
  }
}

export { getCharacters, getCharacterSkills, getCharacterAttributes };