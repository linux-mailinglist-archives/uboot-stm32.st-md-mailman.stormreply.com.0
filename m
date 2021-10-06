Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4463742435D
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Oct 2021 18:50:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4B20C5719E;
	Wed,  6 Oct 2021 16:50:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CCABC5719C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Oct 2021 16:50:22 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 196DX0Ep023573; 
 Wed, 6 Oct 2021 18:50:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=c+kob06LHqOd9HTOWMFhPvzA5mXWYqADVm4zfCW0hTY=;
 b=XkuX54+SYS/UOPdcxOQxh+1M+ecAoYeOc0DFxPpeKuAY7G+ZYao3JZqySBOON7JjYP+4
 L9QEd3NV/Io0EkCCGescfASnB3GZVEoYHBisga2LcTErFQ1DMSB5uujeRo1lodXzSsN7
 rUUDUq821Zbj+6lDukWWpk2pBDskcMp5aF8ibxdDLP0QzSucGSs9eM1w3INeahHtXZ7Z
 4494fJcG15NAJUhvzlM/YLCM3p2RsW52AeFXiXZuGvW9bJwAkpNaw2GHlWI2RgwMb60k
 r5Vo+A15e5cnramoN0O+QYTu+9XRwbAVh/tzXERy2zLy7/5Rr8HZRCTqfEb5++nr1DP2 zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bh8e8jubj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 18:50:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3ECA910002A;
 Wed,  6 Oct 2021 18:49:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E37F423152A;
 Wed,  6 Oct 2021 18:49:57 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 6 Oct 2021 18:49:57
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 6 Oct 2021 18:49:47 +0200
Message-ID: <20211006184935.1.Ifd2b939d3737fc79221a7032a05d1c8ab5a9957b@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_04,2021-10-06_01,2020-04-07_01
Cc: Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Rick Chen <rick@andestech.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Holger Brunck <holger.brunck@hitachi-powergrids.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Stefan Roese <sr@denx.de>,
 Ilko Iliev <iliev@ronetix.at>
Subject: [Uboot-stm32] [PATCH] pm9263: Remove unused
	CONFIG_USER_LOWLEVEL_INIT
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

Remove the latest reference of CONFIG_USER_LOWLEVEL_INIT in code

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 include/configs/pm9263.h     | 1 -
 scripts/config_whitelist.txt | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/configs/pm9263.h b/include/configs/pm9263.h
index c13f8de7c1..fb2d2bf8ce 100644
--- a/include/configs/pm9263.h
+++ b/include/configs/pm9263.h
@@ -136,7 +136,6 @@
 		 AT91_WDT_MR_WDDIS |				\
 		 AT91_WDT_MR_WDD(0xfff))
 
-#define CONFIG_USER_LOWLEVEL_INIT	1
 
 /*
  * Hardware drivers
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 5bcd2c26c4..4a31346b30 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -3085,7 +3085,6 @@ CONFIG_USB_TTY
 CONFIG_USB_TUSB_OMAP_DMA
 CONFIG_USB_ULPI_TIMEOUT
 CONFIG_USB_XHCI_EXYNOS
-CONFIG_USER_LOWLEVEL_INIT
 CONFIG_USE_INTERRUPT
 CONFIG_USE_ONENAND_BOARD_INIT
 CONFIG_UTBIPAR_INIT_TBIPA
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
