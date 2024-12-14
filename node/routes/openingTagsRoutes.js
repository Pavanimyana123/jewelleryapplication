const express = require('express');
const openingTagsController = require('../controllers/openingTagsController');

const router = express.Router();


router.post('/post/opening-tags-entry', openingTagsController.createOpeningTag);
router.get('/get/opening-tags-entry', openingTagsController.getOpeningTags);




module.exports = router;
