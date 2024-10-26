Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0659B1AB3
	for <lists+uboot-stm32@lfdr.de>; Sat, 26 Oct 2024 22:18:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3E44C7801C;
	Sat, 26 Oct 2024 20:18:32 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A670C7803A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Oct 2024 20:18:32 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4XbWF342H5z9swM;
 Sat, 26 Oct 2024 22:18:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrX6canwsPRk7Absj48A2L4NOOnm/t2ov3Dle4EUFyY=;
 b=aP9WZbXpSFs9HvUwsp8KkRFR7baiw96therfmyPrT7cdjFaLR+aOu4A9mv0ZHLTVPG+Dz/
 m2qtHeur3d34dST42I9XhAIxdtS5vtYY0tbqsNn+HjGnFkQHtcV/alDIwo5ep1R8UKbasv
 zHRH2DbY6V3Ge9n6rk5vmFDxJtbk5oGHVJQdd/uMOKqyHQeyDzjVY7H6tPNJyS7dJAgkP9
 /t36NlbWTFtsNStt/3cJES5KRBOZC2pWeKiWIJbt7hdcpNZ1UtzRjWnR3iPKPlNbNa7FKl
 y94p1rc68ZO/Jnq0fphWR1KQfsCkPwBwMv5b3A6vARkRjO6dakayEWl3O4SH+w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrX6canwsPRk7Absj48A2L4NOOnm/t2ov3Dle4EUFyY=;
 b=SyyAfgUwPmnxD9K1BmGXJbQEgDRYb5zXJOCMaCIu6SsPQ4ZIM9rD+7nr/8RHwuWIeqEtMJ
 pqH4i9ITEK4MommsCjnczfMWck/FwD6nveqCccxHqoconb0owYOzIxEApwlnNM2YUqWIXx
 yGHp/TylsgoYHzTOWyrgBz31I9ms1NIadIG9OuuVZrjKP1sTkdhX+hWRGH5ruOpyRW7iFk
 87z6eo0PX0yvWk286Qz5R7Vtx88s45vmYTMpCNSbNwOJ8dAXt1INahAPPP8IiP0K7q6Jpa
 m7LereF9u1KmYF5Fjl836noMUjN1usWiqDqOWUhybEeQ0eN5chDsAEow3TPN6w==
To: u-boot@lists.denx.de
Date: Sat, 26 Oct 2024 22:16:22 +0200
Message-ID: <20241026201741.171073-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: jg3n91fkx6ojbrzosywrsiyr3t8rxzqs
X-MBO-RS-ID: ee8424b1b04fda5e5b2
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
Subject: [Uboot-stm32] [PATCH 5/9] mtd: spi-nor: Remove recently added SST
	special case
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

Remove undocumented SST special case. This was added in commit
5d40b3d384dc ("mtd: spi-nor: Add parallel and stacked memories support")
without any explanation in the commit message. Remove it.

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
 drivers/mtd/spi/spi-nor-core.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index d22363e8267..3c47751348e 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -3578,19 +3578,6 @@ static int spi_nor_select_erase(struct spi_nor *nor,
 			mtd->erasesize = info->sector_size;
 	}
 
-	if ((JEDEC_MFR(info) == SNOR_MFR_SST) && info->flags & SECT_4K) {
-		nor->erase_opcode = SPINOR_OP_BE_4K;
-		/*
-		 * In parallel-memories the erase operation is
-		 * performed on both the flashes simultaneously
-		 * so, double the erasesize.
-		 */
-		if (nor->flags & SNOR_F_HAS_PARALLEL)
-			mtd->erasesize = 4096 * 2;
-		else
-			mtd->erasesize = 4096;
-	}
-
 	return 0;
 }
 
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
