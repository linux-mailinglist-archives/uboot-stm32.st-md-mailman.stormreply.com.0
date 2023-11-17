Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A6F7EF6AE
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Nov 2023 18:01:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 134CDC6C85E;
	Fri, 17 Nov 2023 17:01:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00A30C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Nov 2023 17:01:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AHBUQ4s003521; Fri, 17 Nov 2023 18:01:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=8YNOvJcA3+H7HcOoLsQS+BL6qJ8QfXWrONNMR9j5dUw=; b=vm
 QiN6cDAFLTtZBVVmWZqmks8lMyEuGQfqoQvsTS5AJrvP6mHhA8F2vkVPnVZuE7Jj
 50PX8AHP66tLwwLDqyx+FTumOzMrzCVWJa/UZTC9Ko+OiOHYj8xKwxp63FfQ1BuH
 ItiU73xsUNLN7uRDrXGTt4c/Ucx4QU0k5rRz2nxQ3NEGqXFxFwgVT2uYIiCmtg4G
 YN0NeHvFKBMJFNM3kF38jLt5FJwAVDtuvuuk0g4cRpnZjHTRq1UAdU3dPeI6RB4a
 5W2Kls3eoRN25Hy6f3N/raoVuDOzpXVbyLzyRVAddXz8HSOgs+WuQCH0UCPEKY2j
 RlAagcCs1R1t1ojKwoAw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ua1chmedb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 18:01:11 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BADD0100034;
 Fri, 17 Nov 2023 18:01:10 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B44B0257AA2;
 Fri, 17 Nov 2023 18:01:10 +0100 (CET)
Received: from localhost (10.252.0.168) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 17 Nov
 2023 18:01:10 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 17 Nov 2023 18:01:07 +0100
Message-ID: <20231117170107.1147598-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117170107.1147598-1-patrice.chotard@foss.st.com>
References: <20231117170107.1147598-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.0.168]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_16,2023-11-17_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/2] board: st: common: simplify MTD device
	parsing
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

Simplify the way all MTD devices are parsed.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 board/st/common/stm32mp_dfu.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
index ded3bf81961..77edb86e78c 100644
--- a/board/st/common/stm32mp_dfu.c
+++ b/board/st/common/stm32mp_dfu.c
@@ -123,24 +123,9 @@ void set_dfu_alt_info(char *interface, char *devstr)
 		/* probe all MTD devices */
 		mtd_probe_devices();
 
-		/* probe SPI flash device on a bus */
-		if (!uclass_get_device(UCLASS_SPI_FLASH, 0, &dev)) {
-			mtd = get_mtd_device_nm("nor0");
-			if (!IS_ERR_OR_NULL(mtd))
+		mtd_for_each_device(mtd)
+			if (!mtd_is_partition(mtd))
 				board_get_alt_info_mtd(mtd, buf);
-
-			mtd = get_mtd_device_nm("nor1");
-			if (!IS_ERR_OR_NULL(mtd))
-				board_get_alt_info_mtd(mtd, buf);
-		}
-
-		mtd = get_mtd_device_nm("nand0");
-		if (!IS_ERR_OR_NULL(mtd))
-			board_get_alt_info_mtd(mtd, buf);
-
-		mtd = get_mtd_device_nm("spi-nand0");
-		if (!IS_ERR_OR_NULL(mtd))
-			board_get_alt_info_mtd(mtd, buf);
 	}
 
 	if (IS_ENABLED(CONFIG_DFU_VIRT)) {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
