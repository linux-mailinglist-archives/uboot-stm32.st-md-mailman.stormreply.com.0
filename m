Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBAA34A570
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Mar 2021 11:24:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4DBCC57B79;
	Fri, 26 Mar 2021 10:24:53 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D85A2C57B60
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 10:24:51 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id c204so4588029pfc.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 03:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tZ9AmA6m3/ysF1mBvOLg/KSyPiFBL0oO53AZ3hhyIpc=;
 b=lOloOsmlJDaKLas/S3kKvgvBnIPES5yd3U5fXh2kAxY3M1y1Kcea3I3c8/P0k3aT7Z
 4rdOCn6G4EFNzKMdkcsNBZJ27bVr9acQziaUuRrDAfNbn04i1YyImAG5vq00wCrXM34n
 kQf9kxyHINNEzjQZLaopINaLkh9Fed64gdt8HmY/3G2Ix6572AhdUS4hZeA0m6a+ao3N
 30/ATyh8H8ykL/+RbZ77mecSu9ZEp3hfC4Mods6zv6bNTUmBhmL6J+MlUrY5L+InD/Jj
 Bgey7oMMXUOe1E4FRpbSAcT2t8zATyKHiefqAGGc2EF4xymZonuCHKkRUm4k0Z5UbTwi
 MCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tZ9AmA6m3/ysF1mBvOLg/KSyPiFBL0oO53AZ3hhyIpc=;
 b=ieDnTSNgINoNP8p9Xl7nfkSLhMejYQsKCG/sRViJmqyXtBeNQ6wyxRQTl7AaadNobQ
 rwnDidXaopsdpQH695jxIrV1Xf7QuGUjGhT3dp7n0RKxZMmFaDT4S7CalAx0qwo1xtni
 PiZ31gt7UWjxnGQPNt1MzjS7zUo5xpLWzAiycZyRIuJ4OabtBEdgQRJcK+glG94jqx0Y
 J/B35jDL9/hDb/DCanVEyxrG5sZd9P3dtWqTkcDw6xLdq57qjxFJmmcljTikTDy3QWYd
 UpbtDAMCBAJlFEznRcImQnBUxrJakMka3O9LEyR+YfLM/yDzV18+M8U5KoTqVYhS0Fgp
 PqiA==
X-Gm-Message-State: AOAM533wlI/WQT6LEoH/EJTgBaKZYJhAUJIB6PXWlccdd5CeVvUh/x1N
 4EHejxG09zJXuqMgltNYCag=
X-Google-Smtp-Source: ABdhPJy1qh2hAcGYJURYK1osUTgSP/duh26OfuznBHJTRg7pM6T3QXSLXNiozf6KriLve7lbhZbMCQ==
X-Received: by 2002:a65:50c8:: with SMTP id s8mr11473299pgp.68.1616754290546; 
 Fri, 26 Mar 2021 03:24:50 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id ds3sm8126595pjb.23.2021.03.26.03.24.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Mar 2021 03:24:50 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com
Date: Fri, 26 Mar 2021 18:24:25 +0800
Message-Id: <1616754267-13845-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616754267-13845-1-git-send-email-dillon.minfei@gmail.com>
References: <1616754267-13845-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 4/6] ram: stm32: fix strsep failed on read
	only memory
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

strsep will change data from original memory address,
in case the memory is in non-sdram/sram place, will
run into a bug(hang at SDRAM: )

just add a temporary array to store bank_name[] to fix this
bug.

Fixes: f303aaf ("ram: stm32: add second SDRAM bank management")

Signed-off-by: dillon min <dillon.minfei@gmail.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

v2: no changes

 drivers/ram/stm32_sdram.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ram/stm32_sdram.c b/drivers/ram/stm32_sdram.c
index 540ad85..da27677 100644
--- a/drivers/ram/stm32_sdram.c
+++ b/drivers/ram/stm32_sdram.c
@@ -268,6 +268,7 @@ static int stm32_fmc_of_to_plat(struct udevice *dev)
 	u32 swp_fmc;
 	ofnode bank_node;
 	char *bank_name;
+	char _bank_name[128] = {0};
 	u8 bank = 0;
 	int ret;
 
@@ -300,6 +301,8 @@ static int stm32_fmc_of_to_plat(struct udevice *dev)
 	dev_for_each_subnode(bank_node, dev) {
 		/* extract the bank index from DT */
 		bank_name = (char *)ofnode_get_name(bank_node);
+		strcpy(_bank_name, bank_name);
+		bank_name = _bank_name;
 		strsep(&bank_name, "@");
 		if (!bank_name) {
 			pr_err("missing sdram bank index");
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
