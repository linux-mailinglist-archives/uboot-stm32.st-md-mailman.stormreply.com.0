Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1645F9B1AB1
	for <lists+uboot-stm32@lfdr.de>; Sat, 26 Oct 2024 22:18:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6CCEC78020;
	Sat, 26 Oct 2024 20:18:29 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DB3AC78018
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Oct 2024 20:18:22 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4XbWDs3zxRz9sW6;
 Sat, 26 Oct 2024 22:18:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rfskVvXTb2z8wYUr/yAe+p/aATAX3rByMtrBTKL6EWo=;
 b=DcCjLB9METbRLh34xI0tL3uhQGkeRLB0BYwERlA5S0pFpXHrRGM5gdrxgQJ75Fk4uek7hz
 UZEfKI39wQ0ADksQPEbaPuaCxfozEomYZr5dfBY9GWxeR1crawzsiav0u7lioR2QYAsQ9i
 6E50wGo55U4N+DIuys6nXerxzJPk00LlQaoYp75h42fiBMbGaZ8Lhs0RwkAzlWyAKKthYB
 1iX3kUevukQs+6a/1rySe3EpXmOyGkUjzA+8YTYzLRErVNpJeU+GJ2kx0sBt0eqkfcOvTu
 helxBBr7TrKDmfeXCWYby6b5/fuRaFbdXFdsOErZk7EnpxhZQaWWSN/Wd9GmSA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rfskVvXTb2z8wYUr/yAe+p/aATAX3rByMtrBTKL6EWo=;
 b=uHuaQ4yzb1xP8qCgTgXIqCZhibkbUrcYyLyE9W+sIGmndQarcd60dVTXNAHo9C0ITWAL/D
 hJRn51RHoOzaivqRFlS1IBCdBZ3HJGX/n1SB/yUapn+Pe466DAN8tGK0C3kA/N4MyaaMio
 n4CpDgmLR6NYkQBTw/kakekTKcqKDRdQ5nIXn2P5dCoTUYGnXn5gwixwAh7tX8d5anTzZp
 QRc/aJf3r+IH5EkHTVPV46vwWQkUA6/FUkKuAQ1wEgbopoGl65I51c9SolAt1dWdPiKRye
 mlUuVj6mbMuEUiObrWCGOiTtPN2FRgh0Vnpx24IYTwFAobHDKB7AatXQTGGyxA==
To: u-boot@lists.denx.de
Date: Sat, 26 Oct 2024 22:16:18 +0200
Message-ID: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: jp6yj9i9pzo4kj6nwzney16cogsj4zgz
X-MBO-RS-ID: 18fd3263a0d686e8d98
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Michael Walle <mwalle@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Ashok Reddy Soma <ashok.reddy.soma@amd.com>, Pratyush Yadav <p.yadav@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [Uboot-stm32] [PATCH 1/9] mtd: spi-nor: Remove recently added
	nor->addr_width == 3 test
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Remove undocumented nor->addr_width == 3 test. This was added in commit
5d40b3d384dc ("mtd: spi-nor: Add parallel and stacked memories support")
without any explanation in the commit message. Remove it.

This also has a bad side-effect which breaks READ operation of every SPI NOR
which does not use addr_width == 3, e.g. s25fs512s does not work at all. This
is because if addr_width != 3, rem_bank_len is always 0, and if rem_bank_len
is 0, then read_len is 0 and if read_len is 0, then the spi_nor_read() returns
-EIO.

Basic reproducer is as follows:
"
=> sf probe ; sf read 0x50000000 0 0x10000
SF: Detected s25fs512s with page size 256 Bytes, erase size 256 KiB, total 64 MiB
device 0 offset 0x0, size 0x10000
SF: 65536 bytes @ 0x0 Read: ERROR -5
"

Fixes: 5d40b3d384dc ("mtd: spi-nor: Add parallel and stacked memories support")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Ashok Reddy Soma <ashok.reddy.soma@amd.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Pratyush Yadav <p.yadav@ti.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Sean Anderson <seanga2@gmail.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Venkatesh Yadav Abbarapu <venkatesh.abbarapu@amd.com>
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 drivers/mtd/spi/spi-nor-core.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index f5c9868bbca..8dfdcda47fb 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -1595,16 +1595,14 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	}
 
 	while (len) {
-		if (nor->addr_width == 3) {
-			if (nor->flags & SNOR_F_HAS_PARALLEL) {
-				bank = (u32)from / (SZ_16M << 0x01);
-				rem_bank_len = ((SZ_16M << 0x01) *
-					(bank + 1)) - from;
-			} else {
-				bank = (u32)from / SZ_16M;
-				rem_bank_len = (SZ_16M * (bank + 1)) - from;
-			}
+		if (nor->flags & SNOR_F_HAS_PARALLEL) {
+			bank = (u32)from / (SZ_16M << 0x01);
+			rem_bank_len = ((SZ_16M << 0x01) * (bank + 1)) - from;
+		} else {
+			bank = (u32)from / SZ_16M;
+			rem_bank_len = (SZ_16M * (bank + 1)) - from;
 		}
+
 		offset = from;
 
 		if (nor->flags & SNOR_F_HAS_STACKED) {
@@ -1619,13 +1617,11 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 		if (nor->flags & SNOR_F_HAS_PARALLEL)
 			offset /= 2;
 
-		if (nor->addr_width == 3) {
 #ifdef CONFIG_SPI_FLASH_BAR
-			ret = write_bar(nor, offset);
-			if (ret < 0)
-				return log_ret(ret);
+		ret = write_bar(nor, offset);
+		if (ret < 0)
+			return log_ret(ret);
 #endif
-		}
 
 		if (len < rem_bank_len)
 			read_len = len;
@@ -2012,13 +2008,12 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 			}
 		}
 
-		if (nor->addr_width == 3) {
 #ifdef CONFIG_SPI_FLASH_BAR
-			ret = write_bar(nor, offset);
-			if (ret < 0)
-				return ret;
+		ret = write_bar(nor, offset);
+		if (ret < 0)
+			return ret;
 #endif
-		}
+
 		/* the size of data remaining on the first page */
 		page_remain = min_t(size_t,
 				    nor->page_size - page_offset, len - i);
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
