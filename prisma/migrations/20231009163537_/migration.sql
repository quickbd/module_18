-- CreateTable
CREATE TABLE `category` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `parentId` BIGINT NULL,
    `title` VARCHAR(75) NULL,
    `metaTitle` VARCHAR(100) NULL,
    `slug` VARCHAR(100) NULL,
    `content` TEXT NULL,

    INDEX `FK_category`(`parentId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `post` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `authorId` BIGINT NULL,
    `parentId` BIGINT NULL,
    `title` VARCHAR(75) NULL,
    `metaTitle` VARCHAR(100) NULL,
    `slug` VARCHAR(100) NULL,
    `summary` TINYTEXT NULL,
    `published` TINYINT NULL,
    `createdAt` DATETIME(0) NULL,
    `updatedAt` DATETIME(0) NULL,
    `content` TEXT NULL,

    INDEX `FK_post`(`authorId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `post_category` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `postId` BIGINT NULL,
    `categoryId` BIGINT NULL,

    INDEX `FK_post_category`(`postId`),
    INDEX `FK_post_category_category`(`categoryId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `post_comment` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `postId` BIGINT NULL,
    `parentId` BIGINT NULL,
    `title` VARCHAR(100) NULL,
    `published` BOOLEAN NULL,
    `createdAt` DATETIME(0) NULL,
    `publishedAt` DATETIME(0) NULL,
    `content` TEXT NULL,

    INDEX `FK_post_comment`(`postId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `post_meta` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `postId` BIGINT NULL,
    `key` VARCHAR(50) NULL,
    `content` TEXT NULL,

    INDEX `FK_post_meta`(`postId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `post_tag` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `postId` BIGINT NULL,
    `tagId` BIGINT NULL,

    INDEX `FK_post_tag`(`postId`),
    INDEX `FK_post_tag_tag`(`tagId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tag` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(75) NULL,
    `metaTitle` VARCHAR(100) NULL,
    `slug` VARCHAR(100) NULL,
    `content` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(50) NULL,
    `middleName` VARCHAR(50) NULL,
    `lastName` VARCHAR(50) NULL,
    `mobile` VARCHAR(15) NULL,
    `email` VARCHAR(50) NULL,
    `passwordHash` VARCHAR(32) NULL,
    `registered` DATETIME(0) NULL,
    `lastlogin` DATETIME(0) NULL,
    `intro` TINYTEXT NULL,
    `profile` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `category` ADD CONSTRAINT `FK_category` FOREIGN KEY (`parentId`) REFERENCES `category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post` ADD CONSTRAINT `FK_post` FOREIGN KEY (`authorId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_category` ADD CONSTRAINT `FK_post_category` FOREIGN KEY (`postId`) REFERENCES `post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_category` ADD CONSTRAINT `FK_post_category_category` FOREIGN KEY (`categoryId`) REFERENCES `category`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `post_comment` ADD CONSTRAINT `FK_post_comment` FOREIGN KEY (`postId`) REFERENCES `post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_meta` ADD CONSTRAINT `FK_post_meta` FOREIGN KEY (`postId`) REFERENCES `post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_tag` ADD CONSTRAINT `FK_post_tag` FOREIGN KEY (`postId`) REFERENCES `post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_tag` ADD CONSTRAINT `FK_post_tag_tag` FOREIGN KEY (`tagId`) REFERENCES `tag`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
