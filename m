Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1314208E1
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Oct 2021 12:00:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14521C5AB70;
	Mon,  4 Oct 2021 10:00:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7F97C57182
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Oct 2021 10:00:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1945fwoL009081; 
 Mon, 4 Oct 2021 12:00:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=9qPv9RaqLIIiXidtQ4tNT4BYWw5oVj6Lml2McSU94Lw=;
 b=8XZY3uTksCRdqAdUmIMPwTpDVVp63sce8xq8+QiLWzfqB38jeZBXkVBaqqkMtboYUwcm
 WhZvDK5XSAkmDXRBfSPojcCCuMu+w0xRkpUYcq3GdqGvhGObSFTKhckAm1LnSUoB33dC
 OL1MVz+VXkGm3zRNqosdPigh+D/glWrH5wv7m2s7qBn2aXy5xEbCBCxJM3FM0VOQWivL
 HGASMmceALApoFcn2ZXyq5yOhg6E8leCVJgHb6siothWelTPjsBOA3u5vKJGarty9MKC
 hge8CbSq+g1Xpeitx03ZeQuoK3m23sHlwNvCBzJF8Hcew8C50LNjAMi7Bym7mT/wI0bx FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bfupph9th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 12:00:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2391E100039;
 Mon,  4 Oct 2021 12:00:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 19EB4233C73;
 Mon,  4 Oct 2021 12:00:06 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 4 Oct 2021 12:00:05
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 4 Oct 2021 11:59:51 +0200
Message-ID: <20211004115942.2.Ie0f69e59ca3de9def2b0cf0a825c333bed4707fa@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_02,2021-10-01_02,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Stefan Roese <sr@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/6] am33x: Remove unused define
	CONFIG_MUSB_HOST
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

This define was left over from a previous revision, and was never used.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 include/configs/am335x_sl50.h | 7 -------
 scripts/config_whitelist.txt  | 1 -
 2 files changed, 8 deletions(-)

diff --git a/include/configs/am335x_sl50.h b/include/configs/am335x_sl50.h
index dff946801c..7fbf421149 100644
--- a/include/configs/am335x_sl50.h
+++ b/include/configs/am335x_sl50.h
@@ -62,13 +62,6 @@
 /* Bootcount using the RTC block */
 #define CONFIG_SYS_BOOTCOUNT_BE
 
-#if defined(CONFIG_SPL_BUILD) && defined(CONFIG_SPL_USB_ETHER)
-/* Remove other SPL modes. */
-/* disable host part of MUSB in SPL */
-#undef CONFIG_MUSB_HOST
-/* disable EFI partitions and partition UUID support */
-#endif
-
 /* Network. */
 
 #endif	/* ! __CONFIG_AM335X_SL50_H */
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index ca043b2f26..b125568a26 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -857,7 +857,6 @@ CONFIG_MTD_UBI_DEBUG_PARANOID
 CONFIG_MTD_UBI_GLUEBI
 CONFIG_MTD_UBI_MODULE
 CONFIG_MULTI_CS
-CONFIG_MUSB_HOST
 CONFIG_MVGBE_PORTS
 CONFIG_MVMFP_V2
 CONFIG_MVS
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
