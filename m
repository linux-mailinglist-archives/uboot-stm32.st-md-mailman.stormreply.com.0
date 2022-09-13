Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C54A5B6C53
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Sep 2022 13:24:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41971C640E7;
	Tue, 13 Sep 2022 11:24:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FFFDC640E7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Sep 2022 11:24:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DBGSMo001523;
 Tue, 13 Sep 2022 13:23:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=AVFtJq439dGihLCVk+ofr3abn3Rdj0RunyYJiWnrWns=;
 b=PtCi3CzbVWo9zv7GRPVPaDf9b3e08hDJNfLWcHcFBxV2IDyM/y5UxiTu0BAueMxmrjFR
 vuwLUo6tnIS9kGdvXUnoe+q2hUIyCNOcV7Vh51hNPotTj22xFt3VnfeP1rO0m1xzpzwo
 EcALD/sFe66E94y04hpw1itieokDdCvVaKEMBO9jTg5lJ80pGlt+GGqCAtkSC9eFWrde
 fd3UE/+Qb7A7FNWdSZUCoICrxuk9qm0cUOKMHCN+1c14OteKXP60wrM7sUw0tejowDO0
 CVmjjvo1RVoomyxo7uBJcEjF5K++3Pj3vdKQUE5V5gKdqER77HU9HnbRlUO9zNyciref +w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjwv8mh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 13:23:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E1A7F10002A;
 Tue, 13 Sep 2022 13:23:54 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCF71222CA8;
 Tue, 13 Sep 2022 13:23:54 +0200 (CEST)
Received: from localhost (10.75.127.46) by EQNDAG1NODE5.st.com (10.75.129.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 13 Sep
 2022 13:23:54 +0200
From: Yann Gautier <yann.gautier@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 13 Sep 2022 13:23:45 +0200
Message-ID: <20220913112346.301480-2-yann.gautier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913112346.301480-1-yann.gautier@foss.st.com>
References: <20220913112346.301480-1-yann.gautier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE5.st.com
 (10.75.129.134)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_05,2022-09-13_01,2022-06-22_01
Cc: Peng Fan <peng.fan@nxp.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/3] mmc: stm32_sdmmc2: protect against
	unsupported modes
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

The UHS modes for SD, HS200 and HS400 modes for eMMC are not supported
by the stm32_sdmmc2 driver.
Make it clear by removing the corresponding caps after parsing the DT.

Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
---

 drivers/mmc/stm32_sdmmc2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
index 3cfa5a66f1..e1240b0cf3 100644
--- a/drivers/mmc/stm32_sdmmc2.c
+++ b/drivers/mmc/stm32_sdmmc2.c
@@ -675,6 +675,8 @@ static int stm32_sdmmc2_of_to_plat(struct udevice *dev)
 	if (ret)
 		return ret;
 
+	cfg->host_caps &= ~(UHS_CAPS | MMC_MODE_HS200 | MMC_MODE_HS400 | MMC_MODE_HS400_ES);
+
 	ret = clk_get_by_index(dev, 0, &plat->clk);
 	if (ret)
 		return ret;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
