import express from 'express';
import { getCharacters, getCharacterSkills, getCharacterAttributes } from '../controllers/character.controller.js';

const router = express.Router();

router.get('/', getCharacters);
router.get('/skill', getCharacterSkills);
router.get('/stats', getCharacterAttributes);

export default router;
