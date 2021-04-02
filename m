Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FD6352789
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Apr 2021 10:43:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E29CCC58D60;
	Fri,  2 Apr 2021 08:43:15 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53463C58D5F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Apr 2021 08:43:14 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id m11so574139pfc.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Apr 2021 01:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IGCRz/Ru8GXFujGbvCbEoFdWvW6b2JzyeWsFcNQnnzw=;
 b=tfcKGuBDRPB9QpvgZeG6mLQifiV1hIu5p1tnZCy5i54UxW6GWsDnKc1JABpsPIalCo
 QntGZNkZe3w52DOk/DPgz7pX4aDBanbNh3wycVoJowikiK6XVriDhpxe5z3pZsfkuUzn
 kyaQjOcUbsH2SsWBpJ8yxlEM1yEOZdFJ1AJn7U0PT57nG6ZnAW2X+lCNWAWMKjdu2PYV
 xRrau6yJQJvuCZS6dS4XFmYPjikVMino+gVq296QX+yqt1JL/vL5Sc8QTZSagDdS9AqC
 3eWVoNfmsup6z340y2lMQpH+wzqUiC98WmI/bo1LKI53ac7X73AWg73vs0HqYcW4CZHV
 SbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IGCRz/Ru8GXFujGbvCbEoFdWvW6b2JzyeWsFcNQnnzw=;
 b=pnUQWLhPXzbWvetXiTxlMSip+8lq8J7nRXNnjL2sKoKoVe1bzhYnyFB+xvTJP6Q1ef
 tdzAafkS2/c/oLKo7URGVKL217drDvYx7NjtdqLpa5AxeMK8DtCBrMraotFSr6Q7Mwj+
 5/AiZvjoai/Yv46wvnZaMO4p2aYKnH+VvDWW+uJnwiBps9dtRALFd1XEH5NuOcbPDILU
 +ac6RORXkbO3T3IFSnpGt22fcwyfq5ZtHFpNQylZ3Oo5/qQHYd4MPHxRgrnFgM48AtXo
 6A/0pu+TFMWgvNMAlXiMXcs9zeI6K+k9zkvbrhjrVj0n1KMLtXKNjCz7dRZwf8lD8u5K
 Kehg==
X-Gm-Message-State: AOAM533LQiU9mDT5WOVW/zji366EX5uNVLg9SLvudylp1Q29srlCk0tG
 0jZPaErhGPiinLFaCVNDnvU=
X-Google-Smtp-Source: ABdhPJyRuvEwCDjekxVy8XUulhKnJ7tUq/71bwLFpFLWAsJ8nKEtidB7WN4Wi65qBxRqgWyuBLiZHw==
X-Received: by 2002:a63:1c48:: with SMTP id c8mr10052127pgm.234.1617352993004; 
 Fri, 02 Apr 2021 01:43:13 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id fs9sm7359708pjb.40.2021.04.02.01.43.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Apr 2021 01:43:12 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com,
 sjg@chromium.org
Date: Fri,  2 Apr 2021 16:42:40 +0800
Message-Id: <1617352961-20550-7-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617352961-20550-1-git-send-email-dillon.minfei@gmail.com>
References: <1617352961-20550-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v4 6/7] ram: stm32: fix strsep failed on read
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

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
v4: use strlcpy suggested by Patrice CHOTARD

 drivers/ram/stm32_sdram.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ram/stm32_sdram.c b/drivers/ram/stm32_sdram.c
index 540ad85..3e25cc7 100644
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
+		strlcpy(_bank_name, bank_name, sizeof(_bank_name));
+		bank_name = (char *)_bank_name;
 		strsep(&bank_name, "@");
 		if (!bank_name) {
 			pr_err("missing sdram bank index");
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
