Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 234A14208E5
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Oct 2021 12:00:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAA8BC5AB73;
	Mon,  4 Oct 2021 10:00:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC782C57182
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Oct 2021 10:00:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194565WC017615; 
 Mon, 4 Oct 2021 12:00:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=YYPPgE+mCWmmtrmhhZhRyOoc8VgKs/dULrmcvGMeIxA=;
 b=HknayWODJTgBBOgfGxBZpNk9SO5qs00y3kQc78nHiZpzLKb1E2lz0pX4CIOT7tajZav8
 LrZUqGATq+xk5vJYyMgNri4cBNOqJWFbo2lKlrQmYWU0fcG86Zj4mjhRmzsaBLuAoDOB
 YHRCNSZPAl82YCUwJLUfpzQ4trHMxykN9tBLeuRIeg987hOcUHBLCQFZT/H/iD481fik
 DQtr37ORVm6rIawt0CUDVBmcmLST7kLv+wW85KoBrnXSFWnMhnWAuINCg6JWLJ8rJeuN
 26IVu59J2hq3Bq15+ATVhn2GPRuTGkW/YLQ6Gf20pmoHeovr7rtIsy38D1krgyaY6JtZ mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bfu5y1dkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 12:00:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3592D100038;
 Mon,  4 Oct 2021 12:00:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2EC32233C6A;
 Mon,  4 Oct 2021 12:00:15 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 4 Oct 2021 12:00:12
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 4 Oct 2021 11:59:54 +0200
Message-ID: <20211004115942.5.I524a7a0139ad01d1a9b935314446e64fec9d5b8b@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_02,2021-10-01_02,2020-04-07_01
Cc: Stefan Roese <sr@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>
Subject: [Uboot-stm32] [PATCH 5/6] Remove unused CONFIG_CONS_NONE
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

Remove the latest reference of CONFIG_CONS_NONE in code

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 include/configs/MPC8560ADS.h | 1 -
 scripts/config_whitelist.txt | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/configs/MPC8560ADS.h b/include/configs/MPC8560ADS.h
index 3a9ea03292..dcd538fdf1 100644
--- a/include/configs/MPC8560ADS.h
+++ b/include/configs/MPC8560ADS.h
@@ -191,7 +191,6 @@
 
 /* Serial Port */
 #define CONFIG_CONS_ON_SCC	/* define if console on SCC */
-#undef  CONFIG_CONS_NONE	/* define if console on something else */
 
 #define CONFIG_SYS_BAUDRATE_TABLE  \
 	{300, 600, 1200, 2400, 4800, 9600, 19200, 38400,115200}
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index fe618ff39a..b3ebd20c57 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -149,7 +149,6 @@ CONFIG_COMMON_BOOT
 CONFIG_COMPAT
 CONFIG_CONS_EXTC_PINSEL
 CONFIG_CONS_EXTC_RATE
-CONFIG_CONS_NONE
 CONFIG_CONS_ON_SCC
 CONFIG_CONS_SCIF0
 CONFIG_CONS_SCIF1
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
