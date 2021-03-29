Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE1734C21C
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Mar 2021 05:05:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88482C5719C;
	Mon, 29 Mar 2021 03:05:17 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB066C5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 03:05:15 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id gb6so5347628pjb.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Mar 2021 20:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ua7GpxrnJrtWKpxiDVh/lReoacATPHAtC5BNzYUWpOA=;
 b=vJjGF1jYna/APhjyBu6Ar1+a9qEAm4jl6/6diIegW7+XOEL3OU0yXHJpC3ULwgoDHD
 qPcRl9BxiRLZPhhsonUy/76dvgcfJAvRZqqRPXtGyGUaxu5LwzmAMAQ7ubDtWdVDEU2I
 Thy+qpjRSovYjzb/dwc1aqsudhzK/Ll1TUMEKEqLzz4Y/MS+V/56GOSnR46pzuB0+Vyn
 x2rsXP4vuOX8Gh3C3cJW/t/dinZgGhRCtzYe3SVrCQd+AsPxI+aOWZ7+jleVeyjfX8wW
 ca04S254TQ9I27ihFR6Iwzm3UAkOjFRoqptAA4C6WbA0Zp2bQxX8U35d192k5a4XlKJd
 cVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ua7GpxrnJrtWKpxiDVh/lReoacATPHAtC5BNzYUWpOA=;
 b=a3DYmjpKU11Ba/YpB1RN8s060F46xD6YZk3mFIKNuw7dZf6ev8Ax0WJh0YA+taYIwl
 xqJ73Wsu5dR8IBgL7VZoHWk2bUpNTQH3yqdk6KDagcrfaMhcVqeMLtRp39Rso2aFQgcO
 NPMXpiw/Ozy4x1lofzwPMpgWel9XOWRvnTCYvI0I9gc0+SHqjjfGZxuTfwbnOeMNmhho
 Tx3rPOyHbWo9u28gtZl78xRZLR1iKQ1xak26SNnj2Jp3motqnuks8QBQ1Odkz5je9kKf
 P5KXRD8x86UDJ2NSsrhJOgHAn9fAh/359YVI71Se2zFhsXO1bPhlaLthM4CJyRjS1fmA
 nSMQ==
X-Gm-Message-State: AOAM532kCg0LlPklZTsMh+eJ9FeYTY5V6azblF1Xot1LShcKKx03TsZg
 vDAFDqvLt07nusL7v4WFyLHF4sRLU/QT0YI0
X-Google-Smtp-Source: ABdhPJwXOO8GupMKPwETaWZ166nLPvceJn7yj/wU0tIyi0/QMBoKR3S3dDLW/HyUbNhow1Vzh5Ju3Q==
X-Received: by 2002:a17:902:d4cc:b029:e4:9cd9:f189 with SMTP id
 o12-20020a170902d4ccb02900e49cd9f189mr26539236plg.53.1616987114594; 
 Sun, 28 Mar 2021 20:05:14 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id a204sm15331914pfd.106.2021.03.28.20.05.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Mar 2021 20:05:14 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com
Date: Mon, 29 Mar 2021 11:04:49 +0800
Message-Id: <1616987091-3432-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616987091-3432-1-git-send-email-dillon.minfei@gmail.com>
References: <1616987091-3432-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 4/6] ram: stm32: fix strsep failed on read
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
v3: no changes

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
