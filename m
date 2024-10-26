Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 140799B1AB0
	for <lists+uboot-stm32@lfdr.de>; Sat, 26 Oct 2024 22:18:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B06D1C7801E;
	Sat, 26 Oct 2024 20:18:29 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F666C7801C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Oct 2024 20:18:27 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4XbWDy6Wlfz9smc;
 Sat, 26 Oct 2024 22:18:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZ2QLTpDAAkvelHCJeAOFOiAGhcbV1bLoGPfq9CYwdg=;
 b=ttn45R7mCTS3koQZi5kEeKXyHW66raosMaNZUsK7C4HPZzOMebdhzUV6Ovt/TEr0yVuX0U
 fmSc9vGfCNAmYp4fJXqjVYrwHeNE5nY2ktSAj+foAnV+jfbVQlQAvEqC1HQ7We+8RQ0l1N
 QJsPlSDz8pepHdP6MjRIEItlxNo4Ey2Wl9V3h0NtitLjAZ78h1p1zbR+9aq6BnY4VYc8lB
 FI/CWtOa50J0pFd+Tk9GTFZxdtjywW61AqAldva5jE4YgxFszFbQSW3DoAeeGnmOTJfA2d
 IPxknAC6B1YaK4qgcznjNTrSV/hLix3aPLCO8E9zzUSmpd3EuJIgHFoFRyImaw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1729973905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZ2QLTpDAAkvelHCJeAOFOiAGhcbV1bLoGPfq9CYwdg=;
 b=lATOZDiP5cZZ6epz9+OdYpZ5SqSh0uQOKe/KBRtEblSWI6NFBUPzmlsasfYne3L099P7Ex
 11q485YPvqhvaVpgy+NbvmIdroMHsB9N3S2w/zhWIzx9AIzhpu8Umd4qf8ZktIom+XjF3y
 fD+0kUJQG2jY4gkAHshPURgwVhu+3WHd8DhgW+RwLwenQ5kvIkkZ/tl4g0HSFDeE89XCfZ
 6nzQ6SHsOn/2lV2jfHqIkWW/F7Yh0cjKySm89qnVuW4V+8wjdgbY9IupPuO+dS7FlqNWCF
 foh1wb35JUKEulZ1EpD6q2KzfzC9K17cqtj5HMcpnZikCuN360coeG/RsF0uMQ==
To: u-boot@lists.denx.de
Date: Sat, 26 Oct 2024 22:16:20 +0200
Message-ID: <20241026201741.171073-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
References: <20241026201741.171073-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: 6u7bn78ujebip6f1fkrnkzrai3q99kdk
X-MBO-RS-ID: 6f0ae3836092742770c
X-Rspamd-Queue-Id: 4XbWDy6Wlfz9smc
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
Subject: [Uboot-stm32] [PATCH 3/9] mtd: spi-nor: Remove recently added
	set_4byte() call
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

Remove undocumented set_4byte() call. This was added in commit
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
 drivers/mtd/spi/spi-nor-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi/spi-nor-core.c b/drivers/mtd/spi/spi-nor-core.c
index 0b131ad9aba..3114281832b 100644
--- a/drivers/mtd/spi/spi-nor-core.c
+++ b/drivers/mtd/spi/spi-nor-core.c
@@ -4593,7 +4593,6 @@ int spi_nor_scan(struct spi_nor *nor)
 #else
 	/* Configure the BAR - discover bank cmds and read current bank */
 	nor->addr_width = 3;
-	set_4byte(nor, info, 0);
 	ret = read_bar(nor, info);
 	if (ret < 0)
 		return ret;
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
