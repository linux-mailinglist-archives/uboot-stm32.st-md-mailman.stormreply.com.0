Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE518FE707
	for <lists+uboot-stm32@lfdr.de>; Thu,  6 Jun 2024 15:03:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AFAAC6DD67;
	Thu,  6 Jun 2024 13:03:20 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AC76C6B444
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jun 2024 13:03:19 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AE68F87666;
 Thu,  6 Jun 2024 15:03:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717678999;
 bh=iNQAEz1SXQr5mv/7JOm+IOln8rFvhdf48ItkZ8tpjHg=;
 h=From:To:Cc:Subject:Date:From;
 b=rkXx3qRFi8JXDKuh9OM8PSvg2foboBdDt7FbL6cnkrCp8hyr/oY4evDB/KzcxwBfj
 UUwkcwQch+BXEYM4uz7ZcfCrkIfZA82iIOOWP4cDEuRJfDBPFB3O/YMY0ZwkK/zURu
 EdcvuxTkV/flcrmsfuGKrZN+1KD0w44M6UKVZB/zFKkA0jNJ9zzdFzUdVX7DGSmoqP
 rmsP0EGl2//7aDe2P23wnPH05kS0Ot6CBqiSodmZGL3Boji+XP2MDLXafBvJ4UQuxf
 dxabaGsVzKF4yMUdLKKJJj25QLed8/mUxXvbfHEgj8DfgBQiuTLO+sC+/i0VXxkUXf
 Iq59G1aPe5G7Q==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Thu,  6 Jun 2024 15:02:46 +0200
Message-ID: <20240606130305.24563-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Fix livetree conversion on
	STM32MP15xx DHSOM
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

Unlike fdt_node_check_compatible() which returns 0 if node is compatible,
ofnode_device_is_compatible() return true which is non-zero if node is
compatible. The intention of the code is to exit from the function in
case the node is not compatible with "micrel,ks8851-mll". Add the missing
invert into the conditional to reinstate original behavior.

This exposes a follow up problem caused by conversion to DM based FMC2 EBI
driver, where the FMC2 EBI is not configured when accessed by this code.
Probe the KS8851 MAC, which also configures the FMC2 EBI as a dependency,
so that the KS8851 MAC CCR register can be accessed over the FMC2 EBI bus
and checked for EEPROM present bit.

Fixes: 5a605b7c8615 ("board: dhelectronics: stm32mp1: convert to livetree")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 board/dhelectronics/dh_stm32mp1/board.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index ebd45f9053f..4f4f537fee5 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -76,14 +76,25 @@
 
 static bool dh_stm32_mac_is_in_ks8851(void)
 {
-	ofnode node;
+	struct udevice *udev;
 	u32 reg, cider, ccr;
+	char path[256];
+	ofnode node;
+	int ret;
 
 	node = ofnode_path("ethernet1");
 	if (!ofnode_valid(node))
 		return false;
 
-	if (ofnode_device_is_compatible(node, "micrel,ks8851-mll"))
+	ret = ofnode_get_path(node, path, sizeof(path));
+	if (ret)
+		return false;
+
+	ret = uclass_get_device_by_of_path(UCLASS_ETH, path, &udev);
+	if (ret)
+		return false;
+
+	if (!ofnode_device_is_compatible(node, "micrel,ks8851-mll"))
 		return false;
 
 	/*
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
