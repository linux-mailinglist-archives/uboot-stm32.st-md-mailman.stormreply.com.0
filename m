Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 797B6333887
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Mar 2021 10:16:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B08CC57B7E;
	Wed, 10 Mar 2021 09:16:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A660C57192
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 09:16:53 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12A9Cqf1007609; Wed, 10 Mar 2021 10:16:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=jO5GV4fF9L9RuC/YCqL6GsLZcEPr+s+v+CN1WFCmaJc=;
 b=Fm4T11ehMr7XM4FFefaGMB412de7o/GC0Dc0zqgjz9RM0ZFcZbS/mT31sQKIdjea0NYj
 6BTnk2uKak4BkPjrH7949bnLhcNgiG+9ZydTr7qMqZhhbOVdtB9BuzGDMwTPzUW668cg
 04S6uPLYyT7xDgtTjk/SO+RlOey2eaGenfLrSXNS3eWwxdVSikeQTNLmgwUdZeOoLxY2
 JGHKfstxyAAPycwyW3O+j+t+xIwTfkBI+iUjpq+je65WWP9Jz9CQWAVUNk7UXZlQlQOe
 ynRtaaY11EedRcy0bnCcxelmJlv7nS4HpiHdN0c3f1xj+Gtlwgjc+W1tbruqweGchafC xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 374036y312-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 10:16:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CFA2210002A;
 Wed, 10 Mar 2021 10:16:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C6C9C228D95;
 Wed, 10 Mar 2021 10:16:51 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 10 Mar 2021 10:16:51
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 10 Mar 2021 10:16:32 +0100
Message-ID: <20210310101622.v2.8.I0fd0759810c8b211efa5597dd4333772abcde528@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
References: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-10_07:2021-03-09,
 2021-03-10 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH v2 8/8] configs: stm32mp15: increase the
	number of reserved memory region in lmb
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

For the latest kernel device tree the max number of reserved regions
in lmb library is reached: 8 with 5 reserved regions in device tree.

When a new region is added, the lmb allocation for the device tree
relocation failed and boot with ramdisk failed.

This patch avoids this issue by increasing the max number of
supported reserved memory in lmb library to 16.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- Add CONFIG_LMB_USE_MAX_REGIONS=n and reduce LMB_MEMORY_REGIONS
  to reduce the used size in stack

 configs/stm32mp15_basic_defconfig   | 3 +++
 configs/stm32mp15_trusted_defconfig | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 1c680984b8..a290224a46 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -168,3 +168,6 @@ CONFIG_WDT_STM32MP=y
 CONFIG_ERRNO_STR=y
 # CONFIG_HEXDUMP is not set
 CONFIG_FDT_FIXUP_PARTITIONS=y
+# CONFIG_LMB_USE_MAX_REGIONS is not set
+CONFIG_LMB_MEMORY_REGIONS=2
+CONFIG_LMB_RESERVED_REGIONS=16
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 107041119f..ebd4c05891 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -148,3 +148,6 @@ CONFIG_WDT_STM32MP=y
 CONFIG_ERRNO_STR=y
 # CONFIG_HEXDUMP is not set
 CONFIG_FDT_FIXUP_PARTITIONS=y
+# CONFIG_LMB_USE_MAX_REGIONS is not set
+CONFIG_LMB_MEMORY_REGIONS=2
+CONFIG_LMB_RESERVED_REGIONS=16
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
