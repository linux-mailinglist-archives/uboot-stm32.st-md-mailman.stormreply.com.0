Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB6F9B1AB6
	for <lists+uboot-stm32@lfdr.de>; Sat, 26 Oct 2024 22:18:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2018C78F60;
	Sat, 26 Oct 2024 20:18:42 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6AD5BC78021
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Oct 2024 20:18:41 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4XbWFD6wgLz9scR;
 Sat, 26 Oct 2024 22:18:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DeTUnZjxsy92MbdrUfxGZ9kKY0pquJGLJ5ZgTBm3gV8=;
 b=g7aCVHcwE7WWXan3sVnfQEK2eWItNawiFAgcYHIDrJ0WeB6WKxNr4A4Ig9gd9V2zWD4HVl
 ASJV8J7m0IsUcbi3rcrGEGKn7qcueEVYIXtGKY3vJpgzCxHHrILbV/vruJs8fQBq1/ZoMR
 /jWCUlL/mBoiUchwQtnFONOz+2DJ7D9rtRTvzPF5GMwcK94hBTGShdkBDelKFxOyRFUSEc
 K/8wfSv5T77HIqBsk5kCYY9EkUsd3aYVO6kZVQ5j4THQQW2BwWYxAgowRuVvhjohHg157S
 94uPFSbQVv0vCU3v3PdkRZ+tONekq4tsfHaai+joNkStJ2a4P/IZl+06qwQAQA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DeTUnZjxsy92MbdrUfxGZ9kKY0pquJGLJ5ZgTBm3gV8=;
 b=tw01I7IC1InnTgV3Tx9mxWonYI+NjgErFVUaq4Dbag+H62mXT9eSEUFE5UqfeqZ38Hp2SQ
 1h2Q25LBmzPflq0pvO+wTRPtAmniUUdl2wUqbOmXZbFrS60xL46pLUYJW1k1YL0ew1oZGU
 pN7fpItgN4YtGb9jcTDrzaBwIrd7yRWb3cnmaGCwSjnOJiQfV/uVS70NRurp3jbpjDg9hb
 cbwme7UU3ABFpRcQHGZ0OKqrDqv4nJbUsONQiNNllNPJ0tr5R6mmDjMWY2kg6lsjyvwU/e
 gh2bad+OJWDeWBRYmWqnmv3F3X/KJ0fOYwqfHYkOtargqGyQHgImGJCLo4Ha2A==
To: u-boot@lists.denx.de
Date: Sat, 26 Oct 2024 22:16:26 +0200
Message-ID: <20241026201741.171073-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: ac1f91wjqaz9p5qsm36dix44y7gs4eaj
X-MBO-RS-ID: aabf7eadb44be0abc39
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
Subject: [Uboot-stm32] [PATCH 9/9] mtd: spi-nor: Always build
	SPI_STACKED_PARALLEL code
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

Prevent the code gated by SPI_STACKED_PARALLEL from bitrot
by using if (CONFIG_IS_ENABLED(SPI_STACKED_PARALLEL)) around
it. That way, it is always at least compiled.

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
 drivers/mtd/spi/spi-nor-core.c | 116 ++++++++++++++++-----------------
 1 file changed, 58 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index 74aec6b60c4..a3a62fff213 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -3047,13 +3047,6 @@ static int spi_nor_init_params(struct spi_nor *nor,
 			       const struct flash_info *info,
 			       struct spi_nor_flash_parameter *params)
 {
-#if CONFIG_IS_ENABLED(DM_SPI) && CONFIG_IS_ENABLED(SPI_STACKED_PARALLEL)
-	struct udevice *dev = nor->spi->dev;
-	u64 flash_size[SNOR_FLASH_CNT_MAX] = {0};
-	u32 idx = 0, i = 0;
-	int rc;
-#endif
-
 	/* Set legacy flash parameters as default. */
 	memset(params, 0, sizeof(*params));
 
@@ -3172,62 +3165,69 @@ static int spi_nor_init_params(struct spi_nor *nor,
 
 		spi_nor_post_sfdp_fixups(nor, params);
 	}
-#if CONFIG_IS_ENABLED(DM_SPI) && CONFIG_IS_ENABLED(SPI_STACKED_PARALLEL)
-	/*
-	 * The flashes that are connected in stacked mode should be of same make.
-	 * Except the flash size all other properties are identical for all the
-	 * flashes connected in stacked mode.
-	 * The flashes that are connected in parallel mode should be identical.
-	 */
-	while (i < SNOR_FLASH_CNT_MAX) {
-		rc = ofnode_read_u64_index(dev_ofnode(dev), "stacked-memories",
-					   idx, &flash_size[i]);
-		if (rc == -EINVAL) {
-			break;
-		} else if (rc == -EOVERFLOW) {
-			idx++;
-		} else {
-			idx++;
-			i++;
-			if (!(nor->flags & SNOR_F_HAS_STACKED))
-				nor->flags |= SNOR_F_HAS_STACKED;
-			if (!(nor->spi->flags & SPI_XFER_STACKED))
-				nor->spi->flags |= SPI_XFER_STACKED;
+
+	if (CONFIG_IS_ENABLED(SPI_STACKED_PARALLEL)) {
+		u64 flash_size[SNOR_FLASH_CNT_MAX] = { 0 };
+		struct udevice *dev = nor->spi->dev;
+		u32 idx = 0, i = 0;
+		int rc;
+
+		/*
+		 * The flashes that are connected in stacked mode should be of same make.
+		 * Except the flash size all other properties are identical for all the
+		 * flashes connected in stacked mode.
+		 * The flashes that are connected in parallel mode should be identical.
+		 */
+		while (i < SNOR_FLASH_CNT_MAX) {
+			rc = ofnode_read_u64_index(dev_ofnode(dev), "stacked-memories",
+						   idx, &flash_size[i]);
+			if (rc == -EINVAL) {
+				break;
+			} else if (rc == -EOVERFLOW) {
+				idx++;
+			} else {
+				idx++;
+				i++;
+				if (!(nor->flags & SNOR_F_HAS_STACKED))
+					nor->flags |= SNOR_F_HAS_STACKED;
+				if (!(nor->spi->flags & SPI_XFER_STACKED))
+					nor->spi->flags |= SPI_XFER_STACKED;
+			}
 		}
-	}
 
-	i = 0;
-	idx = 0;
-	while (i < SNOR_FLASH_CNT_MAX) {
-		rc = ofnode_read_u64_index(dev_ofnode(dev), "parallel-memories",
-					   idx, &flash_size[i]);
-		if (rc == -EINVAL) {
-			break;
-		} else if (rc == -EOVERFLOW) {
-			idx++;
-		} else {
-			idx++;
-			i++;
-			if (!(nor->flags & SNOR_F_HAS_PARALLEL))
-				nor->flags |= SNOR_F_HAS_PARALLEL;
+		i = 0;
+		idx = 0;
+		while (i < SNOR_FLASH_CNT_MAX) {
+			rc = ofnode_read_u64_index(dev_ofnode(dev), "parallel-memories",
+						   idx, &flash_size[i]);
+			if (rc == -EINVAL) {
+				break;
+			} else if (rc == -EOVERFLOW) {
+				idx++;
+			} else {
+				idx++;
+				i++;
+				if (!(nor->flags & SNOR_F_HAS_PARALLEL))
+					nor->flags |= SNOR_F_HAS_PARALLEL;
+			}
 		}
-	}
 
-	if (nor->flags & (SNOR_F_HAS_STACKED | SNOR_F_HAS_PARALLEL)) {
-		params->size = 0;
-		for (idx = 0; idx < SNOR_FLASH_CNT_MAX; idx++)
-			params->size += flash_size[idx];
-	}
-	/*
-	 * In parallel-memories the erase operation is
-	 * performed on both the flashes simultaneously
-	 * so, double the erasesize.
-	 */
-	if (nor->flags & SNOR_F_HAS_PARALLEL) {
-		nor->mtd.erasesize <<= 1;
-		params->page_size <<= 1;
+		if (nor->flags & (SNOR_F_HAS_STACKED | SNOR_F_HAS_PARALLEL)) {
+			params->size = 0;
+			for (idx = 0; idx < SNOR_FLASH_CNT_MAX; idx++)
+				params->size += flash_size[idx];
+		}
+		/*
+		 * In parallel-memories the erase operation is
+		 * performed on both the flashes simultaneously
+		 * so, double the erasesize.
+		 */
+		if (nor->flags & SNOR_F_HAS_PARALLEL) {
+			nor->mtd.erasesize <<= 1;
+			params->page_size <<= 1;
+		}
 	}
-#endif
+
 	spi_nor_late_init_fixups(nor, params);
 
 	return 0;
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
