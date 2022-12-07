Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9732D645567
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Dec 2022 09:27:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CB4AC65E6D;
	Wed,  7 Dec 2022 08:27:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF7B6C65E6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 08:27:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B73eoKf015901; Wed, 7 Dec 2022 09:27:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=mPTNpfjrxptFZ9p6XJMjpQKbkfPmv6mQEt6jBSbJmWc=;
 b=MSO4Eo5mJCUY3yLXT5wlJw0oJIcwrZlBYS15eDMULcyDGBHSlZPt39KNLzR/lGgAvLGS
 MftcSJT2JFpPUaJcYBxWPpqgRZ5CSU7gtIux48gtnLcqynz2Ju5W2bBovov97yTchAG0
 8YQyvBARwHK8UAzE9k7S51iYc0hPvSu29wkbiRVu7AmuR2Dw6rSiU1s75oAfJQ1fK7d5
 ZhMs/uP8BaTflZ7ntYnKdWf6AJbZ+7MQHJ2ugnvDvYzomXK9wwTXNWTTLE9QDZw27tn2
 MygxKfFyp15SirA0+MBmgejXzQzqJfIcYaSDOnaLZC4qZ7kmaMWvi8KBfxGjbPHqWoUe xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m7vfexth7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 09:27:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 66163100042;
 Wed,  7 Dec 2022 09:26:49 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5F6AD2194C3;
 Wed,  7 Dec 2022 09:26:49 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 7 Dec
 2022 09:26:48 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 7 Dec 2022 09:26:42 +0100
Message-ID: <20221207092619.3.I18679d6b943d4f01727b3eccbdc853a210c90077@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221207082644.3515486-1-patrick.delaunay@foss.st.com>
References: <20221207082644.3515486-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_04,2022-12-06_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [Uboot-stm32] [PATCH 3/5] configs: SBx81LIFXCAT: move
	MTDPART_DEFAULT in defconfig
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

Replace MTDPARTS_DEFAULT in the config include file by
CONFIG_MTDPARTS_DEFAULT in defconfig to complete the Kconfig migration.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/SBx81LIFXCAT_defconfig | 1 +
 include/configs/SBx81LIFXCAT.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/SBx81LIFXCAT_defconfig b/configs/SBx81LIFXCAT_defconfig
index 125871301e34..80dbbb11c9ba 100644
--- a/configs/SBx81LIFXCAT_defconfig
+++ b/configs/SBx81LIFXCAT_defconfig
@@ -35,6 +35,7 @@ CONFIG_CMD_MII=y
 CONFIG_CMD_PING=y
 CONFIG_CMD_SNTP=y
 # CONFIG_CMD_LED is not set
+CONFIG_MTDPARTS_DEFAULT="mtdparts=spi0.0:768K(boot)ro,256K(boot-env),14M(user),1M(errlog)"
 CONFIG_DOS_PARTITION=y
 CONFIG_OF_CONTROL=y
 CONFIG_ENV_OVERWRITE=y
diff --git a/include/configs/SBx81LIFXCAT.h b/include/configs/SBx81LIFXCAT.h
index 9a9663b34ba8..23d37394e076 100644
--- a/include/configs/SBx81LIFXCAT.h
+++ b/include/configs/SBx81LIFXCAT.h
@@ -21,7 +21,6 @@
  * for your console driver.
  */
 
-#define MTDPARTS_DEFAULT "mtdparts=spi0.0:768K(boot)ro,256K(boot-env),14M(user),1M(errlog)"
 #define MTDPARTS_MTDOOPS "errlog"
 
 /*
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
