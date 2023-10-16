/*
  Warnings:

  - The primary key for the `product` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `userid` on the `product` table. All the data in the column will be lost.
  - You are about to alter the column `id` on the `product` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `UnsignedBigInt`.
  - You are about to alter the column `productId` on the `product_meta` table. The data in that column could be lost. The data in that column will be cast from `VarChar(100)` to `UnsignedBigInt`.
  - The primary key for the `user` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `user` table. The data in that column could be lost. The data in that column will be cast from `BigInt` to `UnsignedBigInt`.

*/
-- AlterTable
ALTER TABLE `product` DROP PRIMARY KEY,
    DROP COLUMN `userid`,
    ADD COLUMN `userId` BIGINT UNSIGNED NULL,
    MODIFY `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `product_meta` MODIFY `productId` BIGINT UNSIGNED NULL;

-- AlterTable
ALTER TABLE `user` DROP PRIMARY KEY,
    MODIFY `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    MODIFY `registeredAt` DATETIME(0) NULL,
    ADD PRIMARY KEY (`id`);

-- CreateIndex
CREATE INDEX `FK_cart` ON `cart`(`userId`);

-- CreateIndex
CREATE INDEX `FK_category` ON `category`(`parentId`);

-- CreateIndex
CREATE INDEX `FK_order` ON `order`(`userId`);

-- CreateIndex
CREATE INDEX `FK_product` ON `product`(`userId`);

-- CreateIndex
CREATE INDEX `FK_product_meta` ON `product_meta`(`productId`);

-- CreateIndex
CREATE INDEX `FK_product_review` ON `product_review`(`productId`);

-- AddForeignKey
ALTER TABLE `category` ADD CONSTRAINT `FK_category` FOREIGN KEY (`parentId`) REFERENCES `category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cart` ADD CONSTRAINT `FK_cart` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `order` ADD CONSTRAINT `FK_order` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `FK_product` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_meta` ADD CONSTRAINT `FK_product_meta` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_review` ADD CONSTRAINT `FK_product_review` FOREIGN KEY (`productId`) REFERENCES `product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
