Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5253A7B12CC
	for <lists+uboot-stm32@lfdr.de>; Thu, 28 Sep 2023 08:25:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A29EC6A60C;
	Thu, 28 Sep 2023 06:25:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C48FFC6B462
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 12:44:50 +0000 (UTC)
Received: from maia.denx.de (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: hws@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2E42C86D59;
 Wed, 27 Sep 2023 14:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1695818690;
 bh=bU3GTze++gST0wdvHMclEVODFjEn76nk82xtA++toEA=;
 h=From:To:Cc:Subject:Date:From;
 b=gNSlkDtWL8+tZBC+j0X/ggB2we8l3i0WUItAapyNqwn6A1Oaoy9FSXqy3IcXVAzfj
 QIRy5Y4Qkp4oK29cYJl54ispK/1AQkC3boSPBSEWa79pd51NWwbeb8Si6aWZA0vXzj
 NM+4FeJPfl42S4VjOG8RaTrq9guxzN9J9/wHGDIYrYiprvFk1Gwb21HbfvbJg/2uKS
 QCeVLG+lhQ/h6M07gdiWMRGrmvBX4g95SVKGRRvnCrJdKXAQuRLqa598bU6P2pHRZo
 PBOVJfUsbh7+QezqxljF2XF+N61JBMIY4dVQJuqzH3WST0z+GK735rsJYImwCdS4Wy
 4tXwcqByEzC4A==
From: Harald Seiler <hws@denx.de>
To: u-boot@lists.denx.de
Date: Wed, 27 Sep 2023 14:44:40 +0200
Message-ID: <20230927124440.247726-1-hws@denx.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Mailman-Approved-At: Thu, 28 Sep 2023 06:25:27 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Harald Seiler <hws@denx.de>
Subject: [Uboot-stm32] [PATCH 1/2] ram: stm32mp1: Only print RAM config with
	CONFIG_SPL_DISPLAY_PRINT
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

Ensure that the RAM configuration line is only printed when
CONFIG_SPL_DISPLAY_PRINT is set.

Signed-off-by: Harald Seiler <hws@denx.de>
---
 drivers/ram/stm32mp1/stm32mp1_ram.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ram/stm32mp1/stm32mp1_ram.c b/drivers/ram/stm32mp1/stm32mp1_ram.c
index a6c19af9722..2808d07c3ae 100644
--- a/drivers/ram/stm32mp1/stm32mp1_ram.c
+++ b/drivers/ram/stm32mp1/stm32mp1_ram.c
@@ -126,7 +126,8 @@ static int stm32mp1_ddr_setup(struct udevice *dev)
 		dev_dbg(dev, "no st,mem-name\n");
 		return -EINVAL;
 	}
-	printf("RAM: %s\n", config.info.name);
+	if (CONFIG_IS_ENABLED(DISPLAY_PRINT))
+		printf("RAM: %s\n", config.info.name);
 
 	for (idx = 0; idx < ARRAY_SIZE(param); idx++) {
 		ret = ofnode_read_u32_array(node, param[idx].name,
-- 
2.41.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
