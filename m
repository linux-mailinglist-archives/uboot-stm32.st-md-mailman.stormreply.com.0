Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FAB4EAEF5
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Mar 2022 16:01:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48202C5EC47;
	Tue, 29 Mar 2022 14:01:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11165C5AB61
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 14:01:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22TAHJ50017428;
 Tue, 29 Mar 2022 16:01:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=VCMcvL5e+Zgrv9yCIkThJJpUP8JoyFOiFUFwlAbCsng=;
 b=OCh+480FB4Wf5+Oz1I3MqQq1Z2nH1duCIDJPY6wezW9fvx6tPIiEYEVx6Asd23pmXpgR
 EGMxTjENIiy0A6Ybk1napuU3SA8odhojDp0rEzgvg85OjY9OBxb4RJQvuFbq8d0usr85
 PIGsr8LVPnaa7g9LsRloL3Wxf2xByAPv78ahoz45dCqYJ53hLNBZnVhteSPj7ym2Fq+h
 taJGdh3alqdhME8U3riE8lQxscWj1Y42cwP6xbywGg2M0XBt+Rs+l+bkclkKemkqPxYf
 jkHgcbvcTlQ9KeW9woIjMnD2qsmOnqJA+ynEPRXi+oLAXO6nrjoFeHdqAdZWd2Pkk3N4 UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1tkma64c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Mar 2022 16:01:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F279F100039;
 Tue, 29 Mar 2022 16:01:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EAD1D214D07;
 Tue, 29 Mar 2022 16:01:17 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 29 Mar 2022 16:01:17
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 29 Mar 2022 16:01:13 +0200
Message-ID: <20220329160058.1.Idf1aae409d6bace710ad5e51ceeb5b8854e363bd@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-29_05,2022-03-29_01,2022-02-23_01
Cc: Reuben Dowle <reubendowle0@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Aswath Govindraju <a-govindraju@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH] doc: mmc dev
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

Provide human readable descriptions of the speed nodes instead of the name
of constants from the code as it is already done for 'mmc rescan'
command in commit 212f078496e4 ("doc: mmc rescan speed mode").

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 doc/usage/mmc.rst | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/doc/usage/mmc.rst b/doc/usage/mmc.rst
index 02b5d7b1c7..55e3f9cf98 100644
--- a/doc/usage/mmc.rst
+++ b/doc/usage/mmc.rst
@@ -85,22 +85,26 @@ The 'mmc dev' command shows or set current mmc device.
 
    mode
        speed mode to set.
-       CONFIG_MMC_SPEED_MODE_SET should be enabled. The required speed mode is
-       passed as the index from the following list.
-
-       0   - MMC_LEGACY
-       1   - MMC_HS
-       2   - SD_HS
-       3   - MMC_HS_52
-       4   - MMC_DDR_52
-       5   - UHS_SDR12
-       6   - UHS_SDR25
-       7   - UHS_SDR50
-       8   - UHS_DDR50
-       9   - UHS_SDR104
-       10  - MMC_HS_200
-       11  - MMC_HS_400
-       12  - MMC_HS_400_ES
+       CONFIG_MMC_SPEED_MODE_SET should be enabled. The requested speed mode is
+       passed as a decimal number according to the following table:
+
+       ========== ==========================
+       Speed mode Description
+       ========== ==========================
+           0      MMC legacy
+           1      MMC High Speed (26MHz)
+           2      SD High Speed (50MHz)
+           3      MMC High Speed (52MHz)
+           4      MMC DDR52 (52MHz)
+           5      UHS SDR12 (25MHz)
+           6      UHS SDR25 (50MHz)
+           7      UHS SDR50 (100MHz)
+           8      UHS DDR50 (50MHz)
+           9      UHS SDR104 (208MHz)
+          10      HS200 (200MHz)
+          11      HS400 (200MHz)
+          12      HS400ES (200MHz)
+       ========== ==========================
 
        A speed mode can be set only if it has already been enabled in the device tree
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
