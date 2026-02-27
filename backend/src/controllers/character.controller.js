import { getAllCharacters, getCharacterSkillById, getCharacterAttributesById, getCharacterRanksById, getCharacterDetailById,getCharacterDialoguesById } from '../services/character.service.js';

// 获取角色基本信息
async function getCharacters(req, res) {
  try {
    const data = await getAllCharacters();
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: '查询失败' });
  }
}

// 获取指定角色信息
async function getCharacterDetail(req, res) {
  try {
    const { id } = req.query;
    const data = await getCharacterDetailById(id);
    res.json(data)
  } catch (err) {
    res.status(500).json({ message: '获取失败' });
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

// 获取指定角色能力信息
async function getCharacterAttributes(req, res) {
  try {
    const { id } = req.query;
    const data = await getCharacterAttributesById(id);
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: '获取失败' });
  }
}

// 获取指定角色阵营和属性
async function getCharacterRanks(req, res) {
  try {
    const { id } = req.query;
    const data = await getCharacterRanksById(id);
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: '获取失败' });
  }
}

// 获取指定角色的台词和介绍
async function getCharacterDialogues(req, res) {
  try {
    const { id } = req.query;
    const data = await getCharacterDialoguesById(id);
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: '获取失败' });
  }
}

export { getCharacters, getCharacterSkills, getCharacterAttributes, getCharacterRanks, getCharacterDetail,getCharacterDialogues };