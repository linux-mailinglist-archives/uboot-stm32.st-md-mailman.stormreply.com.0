Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE8E9AE521
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2024 14:40:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AA1BC78F6B;
	Thu, 24 Oct 2024 12:40:31 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27E57C78035
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 21:07:09 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XY4W060d6z9vB9;
 Tue, 22 Oct 2024 23:07:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729631228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1JWni7hirfTS1CW1sGDJ/1k64+AvSFQLEacM/7ltZzo=;
 b=YGwZYGv8nbJn29SzsGxv4fZvfxopI2fRyD2pAmqvkim+mRm2IDBUgAcqMbHt70OPL1Umj3
 TRj4VDKSSyovGoZHasS8elNzc0b10H3ABsWCdfPRFjyx2OQKCjhuPNNeADSBvfXZyvsf0b
 w2HhoHgJ9jkSgcl3HWELSpcrjoWsRcvrzzZ9RIxlX8DYwGY9DnOb1pzDN4MXW7tzZTUrsw
 dEkGEoME9LUUJ0T15KtuIcASL5X6ar2qgiupDzaMQ2jXPQzer1j66CjosbJk6hksor7s9M
 zvN3IRBUT+/aPJR+sJ30MCEXEcKlQ1pCz/gV13lq3qY4ml3yCQPcX6m3/U3ccQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729631227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1JWni7hirfTS1CW1sGDJ/1k64+AvSFQLEacM/7ltZzo=;
 b=hP9o4WajBMFP1+ELKpfJiQ7nOTKKiJ6IgAQ5qeoBiHKVfzj5uVTpUimjp/9oeMjNJBJGf7
 wQvS7n8ZK0StUWWG+3/ZDCkNZFwpzRNMnYBAx+Zejmacz18WwJ1ZXIP6tctd/uqJkvixNS
 /g/DH387SIPgu/4jB+6XeKuX/2AfgELShY4YITNG8h9tWLtpoGqDOm3bB3j/IcthNMMjXA
 NDR/Za2rIKQCFXGVyQTP7ZvoKOYb0XPW+7+s3UfFAixLEDYdiIrFqxn/ktRsuE2KxOLeAs
 6x5oJLzTs0+hmMVHTv9+35Hmxyis+6oWdyjDxl51+Iz2m/IkWcvlAUjLeMfbCg==
To: u-boot@lists.denx.de
Date: Tue, 22 Oct 2024 23:06:20 +0200
Message-ID: <20241022210633.271534-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
References: <20241022210633.271534-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: xat71a1dk6gawr69kakk43dhq8amobt9
X-MBO-RS-ID: 30097442ca02485413e
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
Subject: [Uboot-stm32] [PATCH 5/6] Revert "mtd: spi-nor: Add parallel
	memories support for read_sr and read_fsr"
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

This reverts commit 92e0ae42b47c13028da7e31ad835fcc659391ae7.

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
 drivers/mtd/spi/spi-nor-core.c | 50 ++++++++++------------------------
 1 file changed, 14 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index 19bf5cfb4f0..25fb034dcae 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -466,9 +466,8 @@ static ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
 }
 
 /*
- * Return the status register value. If the chip is parallel, then the
- * read will be striped, so we should read 2 bytes to get the sr
- * register value from both of the parallel chips.
+ * Read the status register, returning its value in the location
+ * Return the status register value.
  * Returns negative if error occurred.
  */
 static int read_sr(struct spi_nor *nor)
@@ -500,29 +499,18 @@ static int read_sr(struct spi_nor *nor)
 	if (spi_nor_protocol_is_dtr(nor->reg_proto))
 		op.data.nbytes = 2;
 
-	if (nor->flags & SNOR_F_HAS_PARALLEL) {
-		op.data.nbytes = 2;
-		ret = spi_nor_read_write_reg(nor, &op, &val[0]);
-		if (ret < 0) {
-			pr_debug("error %d reading SR\n", (int)ret);
-			return ret;
-		}
-		val[0] |= val[1];
-	} else {
-		ret = spi_nor_read_write_reg(nor, &op, &val[0]);
-		if (ret < 0) {
-			pr_debug("error %d reading SR\n", (int)ret);
-			return ret;
-		}
+	ret = spi_nor_read_write_reg(nor, &op, val);
+	if (ret < 0) {
+		pr_debug("error %d reading SR\n", (int)ret);
+		return ret;
 	}
 
-	return val[0];
+	return *val;
 }
 
 /*
- * Return the flag status register value. If the chip is parallel, then
- * the read will be striped, so we should read 2 bytes to get the fsr
- * register value from both of the parallel chips.
+ * Read the flag status register, returning its value in the location
+ * Return the status register value.
  * Returns negative if error occurred.
  */
 static int read_fsr(struct spi_nor *nor)
@@ -554,23 +542,13 @@ static int read_fsr(struct spi_nor *nor)
 	if (spi_nor_protocol_is_dtr(nor->reg_proto))
 		op.data.nbytes = 2;
 
-	if (nor->flags & SNOR_F_HAS_PARALLEL) {
-		op.data.nbytes = 2;
-		ret = spi_nor_read_write_reg(nor, &op, &val[0]);
-		if (ret < 0) {
-			pr_debug("error %d reading SR\n", (int)ret);
-			return ret;
-		}
-		val[0] &= val[1];
-	} else {
-		ret = spi_nor_read_write_reg(nor, &op, &val[0]);
-		if (ret < 0) {
-			pr_debug("error %d reading FSR\n", ret);
-			return ret;
-		}
+	ret = spi_nor_read_write_reg(nor, &op, val);
+	if (ret < 0) {
+		pr_debug("error %d reading FSR\n", ret);
+		return ret;
 	}
 
-	return val[0];
+	return *val;
 }
 
 /*
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
