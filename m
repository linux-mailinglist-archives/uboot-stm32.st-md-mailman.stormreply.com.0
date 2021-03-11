Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BEE336C97
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Mar 2021 07:55:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69CBEC57B79;
	Thu, 11 Mar 2021 06:55:33 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4246C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 06:44:23 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id a24so9713268plm.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 22:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4FAlR+ZHwEt+dYICOpsf9K0ji7f6dH9p6NwvJHj/jc8=;
 b=bwxTxgOudsXSffaMjDncAAbqPBSJCJq/wZX9k/1qXHdJCoJZzhwB0DyKruLnISQyck
 sRAmZH0e64rNvCtx2GR4xMgguunj2Xv2JbJziFjKbJCdH2UROsWYaS4ha+5hdXNe8/GH
 iaEieGHYA7ZS8MmMNoYuXV9bNPr4V6DVk/upLr06+J4DWRJdfz5GaubQw83X7cuynReW
 LFzleC5PI0Viddr62XGQPdEIOIyC7h3plAlIufrZsResc45zYhmt+sNN2uACIZeafDMV
 zQ+D4Sm/E+vGipfbgRnS0H2e5E3rBo6HPmqG2Ej6kROfd1d9vzKmqe8gwuDDn9ozv6TD
 FFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4FAlR+ZHwEt+dYICOpsf9K0ji7f6dH9p6NwvJHj/jc8=;
 b=ohyY/h3sHiB2pbB+RXEMjFy6/ldmsVABlrQgF85jnI5ilWx+WZMw0N4ZiiZKtBjWJU
 knJ7FdE3eV6mLZvM798S/ARhz7hTfB0mp7gQmaNUjHJn8f9MxpyYUteDA1UbkWYseOgS
 Hnp3cIPxhziskM/JOHj7z3eMLjnFz7TdFM5F1GdaQTuVCt+29JmC5EoD3YXaCgRXWp1E
 kYq3U5CU9v4ViNoYx3vaNVoFaocHW1uDnqZqw4qYlCbx0ac1/7/A4DRTT01tErFGQE5R
 k4FzeCFq3AbIZgGD3cOCh0jIAEptIeNOZzgorL6CvmRWvZ57fvmGlsvOnxIr3apdPlWj
 OR4g==
X-Gm-Message-State: AOAM530dK2iOLORyzix1Gt/RjLJ423kyCfiykLEKs3YOkZr6SVX5xT8H
 lmifJs6g0WlrCZazYHe6Yyg=
X-Google-Smtp-Source: ABdhPJxrqofWKswsBdzTwhy1Q01F13sxgmhs0lmIy86GYMfxk4OlQSViWGM6vlZD3uKJIoCrEEEkyA==
X-Received: by 2002:a17:90b:b0d:: with SMTP id
 bf13mr7383815pjb.7.1615445062389; 
 Wed, 10 Mar 2021 22:44:22 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id i17sm1446652pfq.135.2021.03.10.22.44.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Mar 2021 22:44:22 -0800 (PST)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com
Date: Thu, 11 Mar 2021 14:44:00 +0800
Message-Id: <1615445040-13757-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615445040-13757-1-git-send-email-dillon.minfei@gmail.com>
References: <1615445040-13757-1-git-send-email-dillon.minfei@gmail.com>
X-Mailman-Approved-At: Thu, 11 Mar 2021 06:55:31 +0000
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH 4/4] ram: stm32: fix strsep failed on read
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
---
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
