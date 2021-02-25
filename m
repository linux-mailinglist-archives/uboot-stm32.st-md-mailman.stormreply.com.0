Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FB6324E7B
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Feb 2021 11:49:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 558F3C57B58;
	Thu, 25 Feb 2021 10:49:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B594C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 10:49:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PAbCaU003688; Thu, 25 Feb 2021 11:49:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=edfnj/RQ6gLmfFxrxnjoevz10VUrNXCzrnzJpefecUo=;
 b=oPVCxJc3xsIgHJcF2px58Ucozo6bygxxXrxbfkh8WsWM/8v+We+zR4VyeXGCxT2UJRus
 vugcpj4zpSKa1TgyYzHspF4x+QIfNtahcjRP+iz1a3VLxLp2LuLCCiJ9psC7QwwPPNLQ
 rUeCWUgUXik8f+F3xcrtMPUMRC2Kw2QGf6rxyvMMppF8dzof7FYWfFKCf3/xIENDTWI9
 tjG75zWZbQjcx4KAFkc2x3F4NJMGeGr1jxU3u8PzOsNjmNrk4pS+LKrqqKbzBDPa6W5s
 FlBaxQzXktwTOoow/i9pZRopXg7QNYxnbmoCZlmrYBJ0YsK4L8drp+2ANKOjhG1ef6vI sQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66u5249-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 11:49:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C512B10002A;
 Thu, 25 Feb 2021 11:49:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9BF40226200;
 Thu, 25 Feb 2021 11:49:35 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Feb 2021 11:49:35
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Feb 2021 11:49:28 +0100
Message-ID: <20210225114917.1.If8dd5ef8c9f53bfc56498a9c7c8f23ea05588829@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_06:2021-02-24,
 2021-02-25 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] board: st: remove the nand MTD configuration
	for NOR boot in stm32mp1 board
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

Since commit d5d726d3cc47 ("configs: stm32mp1: only support SD card after
NOR in bootcmd_stm32mp"), the stm32mp1 boards only support SD card after
NOR boot device, so the MTD partitions for nand0 or spi-nand0 are useless
(no need of "UBI" partition in nand0 or spi-nand0).

This patch removes these nand MTD update for nor boot and simplify nand0
and spi-nand0 support (remove the mtd_boot variable).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 board/st/common/stm32mp_mtdparts.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/board/st/common/stm32mp_mtdparts.c b/board/st/common/stm32mp_mtdparts.c
index 69eb10844d..f074fc189d 100644
--- a/board/st/common/stm32mp_mtdparts.c
+++ b/board/st/common/stm32mp_mtdparts.c
@@ -122,28 +122,24 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 		log_debug("mtd device = %s\n", dev->name);
 	}
 
-	if (nor || nand) {
+	if (nand) {
 		mtd = get_mtd_device_nm("nand0");
 		if (!IS_ERR_OR_NULL(mtd)) {
-			const char *mtd_boot = CONFIG_MTDPARTS_NAND0_BOOT;
 			const char *mtd_tee = CONFIG_MTDPARTS_NAND0_TEE;
-
 			board_set_mtdparts("nand0", ids, parts,
-					   !nor ? mtd_boot : NULL,
+					   CONFIG_MTDPARTS_NAND0_BOOT,
 					   !nor && tee ? mtd_tee : NULL,
 					   "-(UBI)");
 			put_mtd_device(mtd);
 		}
 	}
 
-	if (nor || spinand) {
+	if (spinand) {
 		mtd = get_mtd_device_nm("spi-nand0");
 		if (!IS_ERR_OR_NULL(mtd)) {
-			const char *mtd_boot = CONFIG_MTDPARTS_SPINAND0_BOOT;
 			const char *mtd_tee = CONFIG_MTDPARTS_SPINAND0_TEE;
-
 			board_set_mtdparts("spi-nand0", ids, parts,
-					   !nor ? mtd_boot : NULL,
+					   CONFIG_MTDPARTS_SPINAND0_BOOT,
 					   !nor && tee ? mtd_tee : NULL,
 					   "-(UBI)");
 			put_mtd_device(mtd);
@@ -152,11 +148,9 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 
 	if (nor) {
 		if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev)) {
-			const char *mtd_boot = CONFIG_MTDPARTS_NOR0_BOOT;
 			const char *mtd_tee = CONFIG_MTDPARTS_NOR0_TEE;
-
 			board_set_mtdparts("nor0", ids, parts,
-					   mtd_boot,
+					   CONFIG_MTDPARTS_NOR0_BOOT,
 					   tee ? mtd_tee : NULL,
 					   "-(nor_user)");
 		}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
