Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A24A9B1AB5
	for <lists+uboot-stm32@lfdr.de>; Sat, 26 Oct 2024 22:18:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE976C7801F;
	Sat, 26 Oct 2024 20:18:35 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77487C6DD9D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Oct 2024 20:18:34 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4XbWF608kcz9slg;
 Sat, 26 Oct 2024 22:18:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tcq2n+hybtG1blHsjbiuXXq0He8UxCx2e4DuNROHdzk=;
 b=MMhpFcrfci7xPfTOcV7GllNNSRlJ7jvjYfi5FyWMys/rFdz0xihKOVNJCPd3WQAd6Dr86S
 g+NeFgxE4jd5VIJMOz+BHNHWywcYJSFQiXyFjjnBNK1LUye/G0TP0SLSUXkZfT4mcMG1zg
 PShbImUVLXUGtWiej9KBvbWnea1HLPekNgnK1mdXnbtwDO6Rm2Lgc8h+2NMlxEiDUFvmqM
 wfoEBv7dRJzTqJqI66N1NGIiyiG09bxM6XBmOua0Dg0OiPJKWEBLaDrjsPDCR+0P5AonYh
 oQKzDx8R9v4u0mBAKcDS/d4C6B1wjBlbfEa03EQCP5yOtVAFX20LuJ6mVz/OFQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tcq2n+hybtG1blHsjbiuXXq0He8UxCx2e4DuNROHdzk=;
 b=S/0ANqqXrJteHTWjy17E/LL6kRdstmCd9C9pWw1lGCFbEFvrLsDBRBAfHzrTRPvbwNWj0x
 ixu4mgO4KWjOXFBH13JuZrxRncfzMq7rPLa8pXxNPLQ0Exm6DXH2GRSaLyDC01QdX2YzHF
 td0aWGX14rkDHfg0fnqQ/UQxpRTOBPc1dUGLc7bqzCPWA+bpQ05JuDjDdbpGohBHHVQGTr
 UkwAzTeK7DCPvHvdK0plarB+2sKsIQUGg8hUDcEzkJ3I3+VHXqBh1y9XHJigN9Mtp+kVCB
 iY8yXQ8DWAZL++YlFhPG/ati5147L+AVOeFYIaJJ0cpXNkLBeoo4VkPaLlFgqg==
To: u-boot@lists.denx.de
Date: Sat, 26 Oct 2024 22:16:23 +0200
Message-ID: <20241026201741.171073-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: tdddyxc93t5mqsxtorzk456amx41ehcj
X-MBO-RS-ID: de35553da99372237c2
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
Subject: [Uboot-stm32] [PATCH 6/9] mtd: spi-nor: Fix multiple coding style
	issues
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

The offset variable is set, but never used afterward.
Fix indent. Fix predecrement without justification.
Remove use of parenthesis where unnecessary.

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
 drivers/mtd/spi/spi-nor-core.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index 3c47751348e..e49b7cad023 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -1134,12 +1134,10 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 			offset /= 2;
 
 		if (nor->flags & SNOR_F_HAS_STACKED) {
-			if (offset >= (mtd->size / 2)) {
-				offset = offset - (mtd->size / 2);
+			if (offset >= (mtd->size / 2))
 				nor->spi->flags |= SPI_XFER_U_PAGE;
-			} else {
+			else
 				nor->spi->flags &= ~SPI_XFER_U_PAGE;
-			}
 		}
 #ifdef CONFIG_SPI_FLASH_BAR
 		ret = write_bar(nor, addr);
@@ -1588,7 +1586,7 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
 
 	if ((nor->flags & SNOR_F_HAS_PARALLEL) && (offset & 1)) {
-	    /* We can hit this case when we use file system like ubifs */
+		/* We can hit this case when we use file system like ubifs */
 		from--;
 		len++;
 		is_ofst_odd = true;
@@ -1969,9 +1967,9 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 			return ret;
 
 		*retlen += 1; /* We've written only one actual byte */
-		++buf;
-		--len;
-		++to;
+		buf++;
+		len--;
+		to++;
 	}
 
 	for (i = 0; i < len; ) {
@@ -1991,7 +1989,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 			page_offset = do_div(aux, nor->page_size);
 		}
-		offset = (to + i);
+		offset = to + i;
 		if (nor->flags & SNOR_F_HAS_PARALLEL)
 			offset /= 2;
 
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
