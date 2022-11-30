Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9412263D3A9
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Nov 2022 11:42:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 450DAC65E4C;
	Wed, 30 Nov 2022 10:42:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 809C3C65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Nov 2022 10:42:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AU8JuCO008748; Wed, 30 Nov 2022 11:42:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=vAT2tgAik+FrC+ytRju735zsRf2ZN6qnoHRGkpjliZA=;
 b=ECrBk2/qilss5eJiztTh5XE36gDpWCx1/wz5I7xXVPLbEiJZHil5D/r2ScUPF8BmbOVh
 ZOz6LUfZa1nO2nLQVMYS1rTSv534SNf6tphJNtX4ZVo3EnqvY0qbERpDTy1gp7Y4Uxjb
 gbIz2cPuG0ps5k+xZ+BCoaSy2zL5g9ZbyY7tWdLWtIBg+poF23VLqA16Vkd18iV9nIW/
 PDHZyHeTJd+w9+HTZwQFhBs2ftM9uHN5RflIvzmT4/B37ChED7ENBFpTodDF/WnrxTv0
 Mw1yrj4myqQPp0gQ7ZWNcnmKzkAimnEDWhMZ7LLZOK26yZusaVNa9YU2cQ2WVMwsEvoo +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m5kq8nn3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 11:42:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC302100034;
 Wed, 30 Nov 2022 11:42:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B60862171E5;
 Wed, 30 Nov 2022 11:42:12 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 30 Nov
 2022 11:42:10 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 30 Nov 2022 11:42:02 +0100
Message-ID: <20221130114146.1.I1944fc560e894329a83e9cf8f50cab3610f4f334@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-30_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: [Uboot-stm32] [PATCH] dfu: Make DFU virtual backend SPL friendly
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

Define stub for dfu_*_virt function in SPL, because
CONFIG_SPL_DFU_VIRT is not defined.

This patch avoids compilation issue in dfu_fill_entity() when
CONFIG_SPL_DFU is activated because the dfu_fill_entity_virt()
function is not available.

Fixes: ec44cace4b8d2 ("dfu: add DFU virtual backend")
Reported-by: Marek Vasut <marex@denx.de>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
See initial patch proposal:
http://patchwork.ozlabs.org/project/uboot/patch/20221128193917.236188-1-marex@denx.de/

 include/dfu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dfu.h b/include/dfu.h
index dcb9cd9d799a..07922224ef19 100644
--- a/include/dfu.h
+++ b/include/dfu.h
@@ -495,7 +495,7 @@ static inline int dfu_fill_entity_mtd(struct dfu_entity *dfu, char *devstr,
 }
 #endif
 
-#ifdef CONFIG_DFU_VIRT
+#if CONFIG_IS_ENABLED(DFU_VIRT)
 int dfu_fill_entity_virt(struct dfu_entity *dfu, char *devstr,
 			 char **argv, int argc);
 int dfu_write_medium_virt(struct dfu_entity *dfu, u64 offset,
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
