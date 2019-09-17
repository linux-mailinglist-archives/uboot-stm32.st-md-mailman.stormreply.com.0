Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D2CB48D4
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 10:10:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44388C35E02
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Sep 2019 08:10:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91825C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Sep 2019 08:10:10 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8H87io4008254; Tue, 17 Sep 2019 10:10:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=VnDYfAUtj9UbBO3qOL1swsTDq7ecu5gvWnzxg0P8RiE=;
 b=JiYaNikue22ui30AtsjANri4+15MAzq4ppENMZcD3EamKubkKqhjFraA+bvrXmlmZnDe
 0t/GsmLp4MPwnSyv/PaN6X2PiLWilGCuKMh5IrgL+bAuI5fFIdydPkqSIZR7bNv65Dbf
 v5kSbwMZgsMvIT8n8MI+aNGkKqDQymHBLMJGADySw6CWC/0qiRnlTEMp7A6XT8rGSZKz
 8t8/g+p0TP9b2RdRCg8C0ANPficBjn+HOs0zNzHLj8RJu9mBZMR6lICocHWxGqUc/Um6
 ZLBvPGGL/w1oSj2fE+mmfYB8G1TnCdp/IvxeruFbMJgz/5SGmcPFNVMdJ5ZGvopvqM+e NQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v0np10316-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 17 Sep 2019 10:10:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0ED3056;
 Tue, 17 Sep 2019 08:09:58 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C1D182AC5E7;
 Tue, 17 Sep 2019 10:09:57 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 17 Sep
 2019 10:09:57 +0200
Received: from localhost (10.201.23.73) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 17 Sep 2019 10:09:57
 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 17 Sep 2019 10:09:42 +0200
Message-ID: <20190917080946.9593-3-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917080946.9593-1-patrice.chotard@st.com>
References: <20190917080946.9593-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.73]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-17_05:2019-09-11,2019-09-17 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/5] configs: stm32f429-evaluation: Disable
	CONFIG_NET flag
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

Network support was never added on this board, disable
CONFIG_NET flag to avoid following warning:

===================== WARNING ======================
This board does not use CONFIG_DM_ETH (Driver Model
for Ethernet drivers). Please update the board to use
CONFIG_DM_ETH before the v2020.07 release. Failure to
update by the deadline may result in board removal.
See doc/driver-model/migration.rst for more info.
====================================================

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 configs/stm32f429-evaluation_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/stm32f429-evaluation_defconfig b/configs/stm32f429-evaluation_defconfig
index 51f587f629..2b118a0dff 100644
--- a/configs/stm32f429-evaluation_defconfig
+++ b/configs/stm32f429-evaluation_defconfig
@@ -17,12 +17,12 @@ CONFIG_CMD_GPT=y
 # CONFIG_RANDOM_UUID is not set
 CONFIG_CMD_MMC=y
 # CONFIG_CMD_SETEXPR is not set
-# CONFIG_CMD_MII is not set
 CONFIG_CMD_CACHE=y
 CONFIG_CMD_TIMER=y
 # CONFIG_ISO_PARTITION is not set
 CONFIG_OF_CONTROL=y
 CONFIG_DEFAULT_DEVICE_TREE="stm32429i-eval"
+# CONFIG_NET is not set
 CONFIG_DM_MMC=y
 CONFIG_ARM_PL180_MMCI=y
 CONFIG_MTD_NOR_FLASH=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
