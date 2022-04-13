Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 883744FF9B8
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Apr 2022 17:06:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B51EC628AE;
	Wed, 13 Apr 2022 15:06:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0477C628A0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Apr 2022 15:06:22 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23DF3WMX000825;
 Wed, 13 Apr 2022 17:06:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=hC7z3c9XNcYsIs9hqNeZL0d95DfQX8sDaEEfCJ1ViOk=;
 b=TEF1lVRzsh4cg76NZNZlQXKO/8+tnLbapIOnRBs5MKPJ05WIJjJVBKv/W24W5kTL6MfG
 5ZR+3CLD9wC4N6qvs9q6oFZH8IlTkISsql5BCn3RHZr9H5WBYJMb6sSMGxVscqaY/ol2
 wWumDdJOqjnaHn4qyHj37NZTwyhQfNsvfsXk3RpQ9lzfeBqi+BYAA8fuMq/lW4cOv5i0
 GpIGszB4jGciD00kQb2yASagXIU3uXq5JMHAjcE+S7DAkniq9RF3PA/B/oVbCco0HWQD
 xAEKMFQvLysvlVpfz5+UNtFW7wL4+9qHd1Hb4SMbkX+XMXDcLBkfZ7WMnlxoW3OeSa3d 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fb74qeunw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Apr 2022 17:06:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B5D210002A;
 Wed, 13 Apr 2022 17:06:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 94953221789;
 Wed, 13 Apr 2022 17:06:21 +0200 (CEST)
Received: from localhost (10.75.127.45) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 13 Apr
 2022 17:06:21 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 13 Apr 2022 17:04:57 +0200
Message-ID: <20220413150500.23883-10-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220413150500.23883-1-patrice.chotard@foss.st.com>
References: <20220413150500.23883-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-13_02,2022-04-13_01,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v1 09/12] configs: stm32f746-disco: use
	CONFIG_DEFAULT_DEVICE_TREE as fdtfile
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

As stm32f46-disco, stm32f769-disco and stm32746g-eval are very similar
except their respective device tree file. These 3 boards uses the same
TARGET_STM32F746_DISCO flag (so same include/configs/stm32f746-disco.h
and same board file board/st/stm32f746-disco/stm32f746-disco.c)

To be able to compile these 3 boards, replace the hard-coded device-tree
name in include/configs/stm32f746-disco.h by CONFIG_DEFAULT_DEVICE_TREE
which is set in each board defconfig file with the correct value.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 include/configs/stm32f746-disco.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
index b93acdcc1f..cc3d4b4449 100644
--- a/include/configs/stm32f746-disco.h
+++ b/include/configs/stm32f746-disco.h
@@ -34,7 +34,7 @@
 #include <config_distro_bootcmd.h>
 #define CONFIG_EXTRA_ENV_SETTINGS				\
 			"kernel_addr_r=0xC0008000\0"		\
-			"fdtfile=stm32f746-disco.dtb\0"	\
+			"fdtfile="CONFIG_DEFAULT_DEVICE_TREE".dtb\0"	\
 			"fdt_addr_r=0xC0408000\0"		\
 			"scriptaddr=0xC0418000\0"		\
 			"pxefile_addr_r=0xC0428000\0" \
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
