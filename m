Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC7115AFD4
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:31:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85ED8C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:31:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B9F7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:31:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIE7qK031189; Wed, 12 Feb 2020 19:30:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=OiwrFh3/S2/hRMVHTzd8/kh4L3RtkxzxgBHJkkhEzTY=;
 b=kEVetsqlMJB2Z43e26EPP9tkAmN5Fj3TAfxS4go6UM8Rbwz2Rh+goAZdXfLKLfYbNPdp
 rREFML6wcRuRlZjnHJlgxTS4tiUwxRHzqeLBCUOmP+lNCMDx/mMxqxhw5egD6dVc0cr2
 h92hpKPoGwxIqzr/23CxKDH3u4jcYrfgULvHB2vX+BRnBXKpDMZCPdRK/LwXK8jDfu5l
 wjsYXaKppAEdp3R953nwraOxJK6v+LtnYywIeBOY0qkpGrs+UY4mbn7hJnXil/Rwx+KY
 +0+xxrBOLJEWTrCsIh0lkNqLB/u5/o1yvQFPgj/qXprY7kdPERG+CO7FXyU2+cjW3vjg wA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uvdqst6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:30:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EEAC0100038;
 Wed, 12 Feb 2020 19:30:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E584A2C38D7;
 Wed, 12 Feb 2020 19:30:25 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:30:25 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:30:12 +0100
Message-ID: <20200212183021.4844-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212183021.4844-1-patrick.delaunay@st.com>
References: <20200212183021.4844-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 01/10] env: add absolute path at
	CONFIG_ENV_EXT4_FILE
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

Add the absolute path to the default value of
CONFIG_ENV_EXT4_FILE = "/uboot.env".

This patch avoid the error :
  Saving Environment to EXT4... File System is consistent
  Please supply Absolute path

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

For information, it is the value used today by all the boards:

dragonboard820c_defconfig:29:CONFIG_ENV_EXT4_FILE="/uboot.env"
hikey960_defconfig:25:CONFIG_ENV_EXT4_FILE="/uboot.env"
stm32mp15_basic_defconfig:64:CONFIG_ENV_EXT4_FILE="/uboot.env"
stm32mp15_optee_defconfig:51:CONFIG_ENV_EXT4_FILE="/uboot.env"
stm32mp15_trusted_defconfig:50:CONFIG_ENV_EXT4_FILE="/uboot.env"


 env/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/env/Kconfig b/env/Kconfig
index 0d6f559b39..8059749701 100644
--- a/env/Kconfig
+++ b/env/Kconfig
@@ -467,7 +467,7 @@ config ENV_EXT4_DEVICE_AND_PART
 config ENV_EXT4_FILE
 	string "Name of the EXT4 file to use for the environment"
 	depends on ENV_IS_IN_EXT4
-	default "uboot.env"
+	default "/uboot.env"
 	help
 	  It's a string of the EXT4 file name. This file use to store the
 	  environment (explicit path to the file)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
