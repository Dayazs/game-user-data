import express from 'express';
import { getCharacters, getCharacterSkills, getCharacterAttributes, getCharacterRanks,getCharacterDetail,getCharacterDialogues } from '../controllers/character.controller.js';

const router = express.Router();

// 返回所有角色基本信息
router.get('/', getCharacters);

// 返回指定角色的信息
router.get('/characterDetail', getCharacterDetail);

// 返回指定角色的技能信息
router.get('/skill', getCharacterSkills);

// 返回指定角色的能力信息
router.get('/stats', getCharacterAttributes);

// 返回指定角色的阵营和属性
router.get('/ranks', getCharacterRanks);

// 返回指定角色的台词和介绍
router.get('/characterDialogues', getCharacterDialogues);
export default router;


