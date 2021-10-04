Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3814208E7
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Oct 2021 12:00:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83A03C5AB74;
	Mon,  4 Oct 2021 10:00:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8C66C5AB72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Oct 2021 10:00:32 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19447Jxd017146; 
 Mon, 4 Oct 2021 12:00:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=J6ITQz19boJx3Dzsu9JcEOaYd0lOLN6GkINYt7YnJ1Q=;
 b=PyWovSTk17tObvKWm9lE7S0eu3dHuzt5PZRsYnQpcoQdOFedZ5m+ut523uuxAJVeCwuh
 hKeGDcbvIK2wl/mI3GZ77X8qJbJz0Hgrq0IwDrBLsh3TRNwiPmSR7eB/lVwFv7P1/Jx4
 u5rlS4/87DoHUpHLmLGTOZTuOHFJrjIISq7HsJ8ZqNXa68v6PMAnT6x8Gkc8Rmv5kFuB
 7pQBbZan452wbmRHmaVEXGxGY9ZSMBzIhjenPnLb2XB5uQDW589W5ofdnDQI4u4mRtPZ
 GIb+OnDilIGmF4WTwNev7Su3EpSaInz7iLxT8V9qJSaQkiFmLgRSZh9e7KgkeOrqlYAf DA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bftaahk2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 12:00:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 294E5100044;
 Mon,  4 Oct 2021 12:00:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 58180233C7B;
 Mon,  4 Oct 2021 12:00:08 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 4 Oct 2021 12:00:07
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 4 Oct 2021 11:59:52 +0200
Message-ID: <20211004115942.3.Ibc8e0107187c533ff2b9f71f30b5abfe1e47e22d@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_02,2021-10-01_02,2020-04-07_01
Cc: Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Rick Chen <rick@andestech.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Stefan Roese <sr@denx.de>
Subject: [Uboot-stm32] [PATCH 3/6] Remove unused CONFIG_NO_RELOCATION
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

Remove the latest reference of CONFIG_NO_RELOCATION in code

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 include/configs/thunderx_88xx.h | 1 -
 scripts/config_whitelist.txt    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/configs/thunderx_88xx.h b/include/configs/thunderx_88xx.h
index 1ce0347300..600689843b 100644
--- a/include/configs/thunderx_88xx.h
+++ b/include/configs/thunderx_88xx.h
@@ -58,7 +58,6 @@
 /* Monitor Command Prompt */
 #define CONFIG_SYS_CBSIZE		512	/* Console I/O Buffer Size */
 #define CONFIG_SYS_MAXARGS		64		/* max command args */
-#define CONFIG_NO_RELOCATION		1
 #define PLL_REF_CLK			50000000	/* 50 MHz */
 #define NS_PER_REF_CLK_TICK		(1000000000/PLL_REF_CLK)
 
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index b125568a26..6479b49291 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -927,7 +927,6 @@ CONFIG_NON_SECURE
 CONFIG_NORBOOT
 CONFIG_NORFLASH_PS32BIT
 CONFIG_NO_ETH
-CONFIG_NO_RELOCATION
 CONFIG_NO_WAIT
 CONFIG_NS16550_MIN_FUNCTIONS
 CONFIG_NS8382X
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
