Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3AC447CB2
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Nov 2021 10:21:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A27AC5E2CD;
	Mon,  8 Nov 2021 09:21:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7738C5E2CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Nov 2021 09:21:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A87NwVL000757;
 Mon, 8 Nov 2021 10:21:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=zBeRgSHmYeKf2V1Uj2/qEjlnD2aP+LvSuAb3FPBohsc=;
 b=UJVzumgvLcpX32dLqak/24I/oTMmDvQKLGy3w+Vt9RqB0EuLCnYin4rVw+0axPDoN7e0
 52PTX+MCspipyKmBnSQ7VT9d9eDd7OvsIP/1kOiAMcOnG2ZeC0zo/GYQshlk4LZvyV/y
 hDILh8ywhcHd6kD78UN5o32xEjCo71OL0Lo4SwRqKyw0/quGo7wn23bc+Ieeo1qREjP2
 LiI10/Od/WylMon6kkoJElCROUn850h6ZCs5aKi0ZYxo65bBNyNYOgaMkakRuSWaW8Hk
 OlJSz/WarL5x6/AdW13crYdM3sWrwMkPRvIGC5H2ylOx2ClJl+lgjVO4SBj3HzRwdSVW ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c6qvp46jm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 10:21:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6B12F10002A;
 Mon,  8 Nov 2021 10:21:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2667216ED3;
 Mon,  8 Nov 2021 10:21:25 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 8 Nov 2021 10:21:25
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 8 Nov 2021 10:21:22 +0100
Message-ID: <20211108102034.2.I275896d33cc3ef96ef439f13eda5cc6a8f9665c3@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108102034.1.I5bb33aa84680ff548976f04f18cafca7ebb0ec91@changeid>
References: <20211108102034.1.I5bb33aa84680ff548976f04f18cafca7ebb0ec91@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_03,2021-11-03_01,2020-04-07_01
Cc: Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Stefan Roese <sr@denx.de>
Subject: [Uboot-stm32] [PATCH 2/2] scripts: remove CONFIG_IS_ENABLED and
	CONFIG_VAL in config_whitelist.txt
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

The helper macro CONFIG_IS_ENABLED and CONFIG_VAL are not real
configurations and they are no more present in u-boot.cfg so they can
be removed in config_whitelist.txt.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 scripts/config_whitelist.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 6792e284a1..cc2e241417 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -634,7 +634,6 @@ CONFIG_IRAM_SIZE
 CONFIG_IRAM_STACK
 CONFIG_IRAM_TOP
 CONFIG_IRDA_BASE
-CONFIG_IS_ENABLED
 CONFIG_JFFS2_DEV
 CONFIG_JFFS2_LZO
 CONFIG_JFFS2_NAND
@@ -3051,7 +3050,6 @@ CONFIG_USE_ONENAND_BOARD_INIT
 CONFIG_UTBIPAR_INIT_TBIPA
 CONFIG_U_BOOT_HDR_ADDR
 CONFIG_U_BOOT_HDR_SIZE
-CONFIG_VAL
 CONFIG_VAR_SIZE_SPL
 CONFIG_VERY_BIG_RAM
 CONFIG_VIDEO_BCM2835
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
