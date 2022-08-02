Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 111DD5878EC
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Aug 2022 10:21:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF9EEC640F0;
	Tue,  2 Aug 2022 08:21:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24CC6C035BF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Aug 2022 08:21:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2723eGkK018967;
 Tue, 2 Aug 2022 10:21:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=EV2BOufjixjXqBBRLGaYU4HzFbKuPLENZM9fzFFQBeE=;
 b=GdQuSyoLdIlimQFK2EDtacj23FS0I966nDv+be/30zDfLTo845XtmazOporko0wBD3qw
 UVfvcCb98NN4liJPqB17UmYlO68HAxfg30kJ+rc3GdargC62OCydsG7GGMtzB0IwNPeE
 R1VBQ2P8SgldbD49Z2+LG5xuIxrt/iCNDJ9q2xJuLwMdmoYnkauaXiTFkdIjRkCALbXY
 A1qio3QBaIxPOuoSkYDAfyBHA+Eq7hoh1P0PrBXvJw1fbzal2H1fcSd9parwU/tnfKxM
 ZtWYo7YJiJeotcsHOY2IWvyQvXXWrpU82bU1pwYtzRmxIENDS88bs5/hpFffFHw8DxHx gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hmuhhm1vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Aug 2022 10:21:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A78BA10002A;
 Tue,  2 Aug 2022 10:21:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9AC75212300;
 Tue,  2 Aug 2022 10:21:41 +0200 (CEST)
Received: from localhost (10.75.127.48) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 2 Aug
 2022 10:21:41 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 2 Aug 2022 10:21:35 +0200
Message-ID: <20220802082135.271308-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-02_04,2022-08-01_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>
Subject: [Uboot-stm32] [PATCH] lmb: Fix LMB_MEMORY_REGIONS flag usage
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

This patch is fixing a broken boot observed on stm32mp157c-dk2 board.

IS_ENABLED macro should be used to check if a compilation flag is set
to "y" or "m".
LMB_MEMORY_REGIONS is set to a numerical value, IS_ENABLED macro is not
suitable in this case.

Fixes: 7c1860fce4e3 ("lmb: Fix lmb property's defination under struct lmb")
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 include/lmb.h | 2 +-
 lib/lmb.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/lmb.h b/include/lmb.h
index 1476d78c28..7298c2ccc4 100644
--- a/include/lmb.h
+++ b/include/lmb.h
@@ -68,7 +68,7 @@ struct lmb_region {
 struct lmb {
 	struct lmb_region memory;
 	struct lmb_region reserved;
-#if IS_ENABLED(CONFIG_LMB_MEMORY_REGIONS)
+#ifdef CONFIG_LMB_MEMORY_REGIONS
 	struct lmb_property memory_regions[CONFIG_LMB_MEMORY_REGIONS];
 	struct lmb_property reserved_regions[CONFIG_LMB_RESERVED_REGIONS];
 #endif
diff --git a/lib/lmb.c b/lib/lmb.c
index f21fe672ae..c599608fa3 100644
--- a/lib/lmb.c
+++ b/lib/lmb.c
@@ -108,7 +108,7 @@ void lmb_init(struct lmb *lmb)
 #if IS_ENABLED(CONFIG_LMB_USE_MAX_REGIONS)
 	lmb->memory.max = CONFIG_LMB_MAX_REGIONS;
 	lmb->reserved.max = CONFIG_LMB_MAX_REGIONS;
-#elif IS_ENABLED(CONFIG_LMB_MEMORY_REGIONS)
+#elif defined(CONFIG_LMB_MEMORY_REGIONS)
 	lmb->memory.max = CONFIG_LMB_MEMORY_REGIONS;
 	lmb->reserved.max = CONFIG_LMB_RESERVED_REGIONS;
 	lmb->memory.region = lmb->memory_regions;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
