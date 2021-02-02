Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5AB30BEE9
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Feb 2021 13:59:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9721BC57184;
	Tue,  2 Feb 2021 12:59:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AC6BC57181
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Feb 2021 12:59:41 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 112CvgRW002838; Tue, 2 Feb 2021 13:59:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=0E3VPQKe8bIMKNsC5bPhZmBq/I26a9XIL9yqF4zFYks=;
 b=g1ZZpSJ6zhepgpQOkZ+rjspAHv3/+9La7Xo+xAmgSXoN37h93Yr+iPoT6TTNpznmx/9z
 TXrgtaYQsD8uJz16XKGU55rXF9GF+2FTQyD/EOKzmDUGW95SDjuFMy/Hw+QkE+0eyZeI
 Ps67HYpgvXfme14TLhdlbGcar7FYuRHIBHKFu5llJEvNzJ2zMuOQxlverYZ9wRi+xj/e
 j1NqeCBYRH7bp5Rkjfv2A5hO4vhrjabzCGtI+qCsBvAWLzf8EE2bfvMiK+AgRHx3AWcw
 KRZ1ws7XZmk+hwgJQBtA2ga6uqQvFKqBhMza5BsRTbo4QK25Kx410F54anmG7hFsHq5Q eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36d0frs8qs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 13:59:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED907100038;
 Tue,  2 Feb 2021 13:59:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E669F234483;
 Tue,  2 Feb 2021 13:59:39 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Feb 2021 13:59:39
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 2 Feb 2021 13:59:12 +0100
Message-ID: <20210202135729.5.I0fd0759810c8b211efa5597dd4333772abcde528@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210202125913.13597-1-patrick.delaunay@foss.st.com>
References: <20210202125913.13597-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_06:2021-02-02,
 2021-02-02 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 5/5] configs: stm32mp15: increase the number
	of reserved memory region in lmb
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

This patch avoid this issue by increasing the max number of
supported reserved memory in lmb library.


Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index d3e5775a5a..df59ef70b1 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -157,3 +157,4 @@ CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 CONFIG_ERRNO_STR=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
+CONFIG_LMB_RESERVED_REGIONS=16
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index d392b0ff2a..0078dccf66 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -137,3 +137,4 @@ CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
 CONFIG_ERRNO_STR=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
+CONFIG_LMB_RESERVED_REGIONS=16
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
