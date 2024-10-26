Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 693609B1AB4
	for <lists+uboot-stm32@lfdr.de>; Sat, 26 Oct 2024 22:18:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D50E5C7803A;
	Sat, 26 Oct 2024 20:18:37 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A068C78021
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Oct 2024 20:18:36 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4XbWF82B5jz9sZL;
 Sat, 26 Oct 2024 22:18:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n4FEhnXIhPI/JH9xsKgCzkmspxmEXj0DmDHFxAY+P/o=;
 b=wT9vGvIpHva6rTAXDkZHSsxxgzXumWmwIrRxChXHdCKMPmw1Yt7lCtnFwdAWBIlfKB1A8Y
 bw2/Y73hIbbN53ZnD2g/HGJ7Kq860PSKYHyUVSdFN/peo1iyMxHp4J9zJJza0v+l/J3Ab4
 tSIdpPE6ny8SSznDASc5srL2WFMOgoU6Os3THOAAYCIjw3/cn99iAuRerTETIGVi/kag51
 q9bOWS3uJr0+97dkFnWXdM0lpYMH8CNBpe+Yb5754Qe99fsp7IQqeln+OAhnrrrY58MgVe
 Ut3bOOYKpdyQlyO5+6e3TYQzbTCJ0NvEriqgA3BjDoD+vu0CWm2bGgJvQTtDoA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n4FEhnXIhPI/JH9xsKgCzkmspxmEXj0DmDHFxAY+P/o=;
 b=C3X5Rfd4medtoL+XmhtIziMvKXIy+Vm1ANwvqX9uwxUcuaeCS3USOxTbm0S3ndnF8jlzg7
 OI/zq2xhBUt1A2gZZY1fKCL0g28ByWiaaquCyONNr/SAcjHKg1rSrydMtAbTPP904EAY1A
 V4ZCxKHvwI1A088XjXqYRxqTJBClwdqegVHMZRpvA6Lp7n7yg4NCZcQspTMTCR2/yjCCIS
 KeyK54OMmdCUhosCu/fETzgjcObxBzLltgcXAwBGBWx3SIJrdWopxWFgh+NF1QHkfMUut+
 bFkXuQBtOAJn1WF0vVgEwNobALYfIKsKwX6NOCz5ITG9XMcHyI9za602NGiNyg==
To: u-boot@lists.denx.de
Date: Sat, 26 Oct 2024 22:16:24 +0200
Message-ID: <20241026201741.171073-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: q4t9qbixywut7r4ominxct4cg6nj4iwt
X-MBO-RS-ID: 826a55ae4cac62fa71b
X-Rspamd-Queue-Id: 4XbWF82B5jz9sZL
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
Subject: [Uboot-stm32] [PATCH 7/9] mtd: spi-nor: Rewrite rem_bank_len
	calculation
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

Rewrite the code to make it clear exactly where the
SNOR_F_HAS_PARALLEL flag leads to *2 and /2 operation
compared to regular code path. No functional change.

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
 drivers/mtd/spi/spi-nor-core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index e49b7cad023..c1ee466bcc0 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -1593,13 +1593,14 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	}
 
 	while (len) {
-		if (nor->flags & SNOR_F_HAS_PARALLEL) {
-			bank = (u32)from / (SZ_16M << 0x01);
-			rem_bank_len = ((SZ_16M << 0x01) * (bank + 1)) - from;
-		} else {
-			bank = (u32)from / SZ_16M;
-			rem_bank_len = (SZ_16M * (bank + 1)) - from;
-		}
+		bank = (u32)from / SZ_16M;
+		if (nor->flags & SNOR_F_HAS_PARALLEL)
+			bank /= 2;
+
+		rem_bank_len = SZ_16M * (bank + 1);
+		if (nor->flags & SNOR_F_HAS_PARALLEL)
+			rem_bank_len *= 2;
+		rem_bank_len -= from;
 
 		offset = from;
 
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
