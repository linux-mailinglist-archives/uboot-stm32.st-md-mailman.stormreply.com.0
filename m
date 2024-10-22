Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A88E9AE520
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2024 14:40:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 156AAC78F69;
	Thu, 24 Oct 2024 12:40:31 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 903CDC6DD6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 21:07:06 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XY4Vy1hsrz9vB8;
 Tue, 22 Oct 2024 23:07:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729631226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DMuQE5YVORYoNDZ4HBy6XVxfjndhkRzXyWTBtg0BxPA=;
 b=ijKlPD35Y/D+eML1V0LjEbD/CXsXMso+jwCsMfyNrHxoDj7luz/H4UxOuC6ZBHm5BfBYY4
 0AiQjMa006gP2NGoGoulwoPcyzRdC2ThYAsPtw4dNxQMKQtal4r02u9kozZSANBV8u1EzT
 hUj9RMfPXt48u3g13KQrylxH2vjm3yTAxz5Y3PstAJRv2+0r6VwsZyvXVgScDITRZdt9wf
 bNcchHREpsx8Y+gLHUWg+uPaOy6jJO4j+gck9fWS2cY33cWEid7VHsBHQGYeZ9PAjKzm3g
 EWG17HCn2k4F7O/pAVm0n/MD6qv7djfkOSAxakxFAQafnDroZrGVJ7HP8UxTkw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729631224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DMuQE5YVORYoNDZ4HBy6XVxfjndhkRzXyWTBtg0BxPA=;
 b=qFnR+HZrh3CQvafmBusbvWu9p5cuYpg44V1jAbhApMUXGr7DvuMulKxzoHCW4gBTxvyqaS
 B+kRJj8+VDDApz2PiaWqgSsBQMtwO0c1O2TJpyBQ3GOWzSB0a84Z1STtCiCEx8MKQ16GCa
 b6RH/3LQrJWhmRBZnLCUw9R8xrjzfAW1w9jlUoIBZH1+NsqnxR22UaOhB6i+IvyJtJB4zs
 Bwyusmtf3kAznBW7u6Iq1CrJHsDhb6W2DfEcp3qGAnLk3n9FQxbMlzlAmqmPfCNDDa/f1G
 dKvbDlRaHcW9A6AyewA3hBc2kBE2adhqymbDh+y0Htzxre4uQjTkZ3XWfK6ukA==
To: u-boot@lists.denx.de
Date: Tue, 22 Oct 2024 23:06:19 +0200
Message-ID: <20241022210633.271534-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: rxcsxwrddaz9d4yagcfzey8ttoe968sa
X-MBO-RS-ID: 4f8581b090d59a72c83
X-Rspamd-Queue-Id: 4XY4Vy1hsrz9vB8
X-Mailman-Approved-At: Thu, 24 Oct 2024 12:40:30 +0000
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
Subject: [Uboot-stm32] [PATCH 4/6] Revert "mtd: spi-nor: Add parallel and
	stacked memories support in read_bar and write_bar"
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

This reverts commit c480ec2c45b221b2044c6268c9773e78fa47f305.

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
 drivers/mtd/spi/spi-nor-core.c | 55 +++++-----------------------------
 1 file changed, 8 insertions(+), 47 deletions(-)

diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index f5c9868bbca..19bf5cfb4f0 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -956,32 +956,12 @@ static int clean_bar(struct spi_nor *nor)
 
 static int write_bar(struct spi_nor *nor, u32 offset)
 {
-	u8 cmd, bank_sel, upage_curr;
+	u8 cmd, bank_sel;
 	int ret;
-	struct mtd_info *mtd = &nor->mtd;
-
-	/* Wait until previous write command is finished */
-	if (spi_nor_wait_till_ready(nor))
-		return 1;
-
-	if (nor->flags & (SNOR_F_HAS_PARALLEL | SNOR_F_HAS_STACKED) &&
-	    mtd->size <= SZ_32M)
-		return 0;
-
-	if (mtd->size <= SZ_16M)
-		return 0;
-
-	offset = offset % (u32)mtd->size;
-	bank_sel = offset >> 24;
 
-	upage_curr = nor->spi->flags & SPI_XFER_U_PAGE;
-
-	if (!(nor->flags & SNOR_F_HAS_STACKED) && bank_sel == nor->bank_curr)
-		return 0;
-	else if (upage_curr == nor->upage_prev && bank_sel == nor->bank_curr)
-		return 0;
-
-	nor->upage_prev = upage_curr;
+	bank_sel = offset / SZ_16M;
+	if (bank_sel == nor->bank_curr)
+		goto bar_end;
 
 	cmd = nor->bank_write_cmd;
 	write_enable(nor);
@@ -991,19 +971,15 @@ static int write_bar(struct spi_nor *nor, u32 offset)
 		return ret;
 	}
 
+bar_end:
 	nor->bank_curr = bank_sel;
-
-	return write_disable(nor);
+	return nor->bank_curr;
 }
 
 static int read_bar(struct spi_nor *nor, const struct flash_info *info)
 {
 	u8 curr_bank = 0;
 	int ret;
-	struct mtd_info *mtd = &nor->mtd;
-
-	if (mtd->size <= SZ_16M)
-		return 0;
 
 	switch (JEDEC_MFR(info)) {
 	case SNOR_MFR_SPANSION:
@@ -1015,30 +991,15 @@ static int read_bar(struct spi_nor *nor, const struct flash_info *info)
 		nor->bank_write_cmd = SPINOR_OP_WREAR;
 	}
 
-	if (nor->flags & SNOR_F_HAS_PARALLEL)
-		nor->spi->flags |= SPI_XFER_LOWER;
-
 	ret = nor->read_reg(nor, nor->bank_read_cmd,
-			    &curr_bank, 1);
+				    &curr_bank, 1);
 	if (ret) {
 		debug("SF: fail to read bank addr register\n");
 		return ret;
 	}
 	nor->bank_curr = curr_bank;
 
-	// Make sure both chips use the same BAR
-	if (nor->flags & SNOR_F_HAS_PARALLEL) {
-		write_enable(nor);
-		ret = nor->write_reg(nor, nor->bank_write_cmd, &curr_bank, 1);
-		if (ret)
-			return ret;
-
-		ret = write_disable(nor);
-		if (ret)
-			return ret;
-	}
-
-	return ret;
+	return 0;
 }
 #endif
 
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
