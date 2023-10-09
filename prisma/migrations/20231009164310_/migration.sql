-- CreateIndex
CREATE INDEX `FK_post_parentid` ON `post`(`parentId`);

-- CreateIndex
CREATE INDEX `FK_post_comment_parent` ON `post_comment`(`parentId`);

-- AddForeignKey
ALTER TABLE `post` ADD CONSTRAINT `FK_post_parentid` FOREIGN KEY (`parentId`) REFERENCES `post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_comment` ADD CONSTRAINT `FK_post_comment_parent` FOREIGN KEY (`parentId`) REFERENCES `post_comment`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
