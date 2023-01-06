Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7029066002D
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Jan 2023 13:21:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31517C6905D;
	Fri,  6 Jan 2023 12:21:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58DFEC69060
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Jan 2023 12:21:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 306BKqOs015885; Fri, 6 Jan 2023 13:21:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=iwBGcj9h4XqcWmVBjjqISxi/vRJhqhx2mMRGdW8NjEA=;
 b=VexUrMCkg0NEzFzewYnSJ9sz6VnekSXof9dmdz4HJdjPbT7vYvLxlD2Jm+Zs5f6PoXIw
 zBSqakExjF2BPT0yhocP4bmzHCg7VnbgdatTQRKVPDJ71GDBnQ6s/wzYpzYOkPnig9jY
 SfinLl3TNSmQVsxG2Nd8HeWadIcJ8gnT1U2+CBwWhP0/DIzTQMWHAiwks/U+Q4cIabjc
 RWgUhAUB2jYjw5DUFr5CplRB55t6LVmW4LfG6ddLV3A0ExQZzxrwJ5tr4Mv+FuUMquJF
 BVg9aMvjfZ4FdDrFQpBrttgx3v+U4LKCR+M+HvGzrJzr9wuGcyGVLykLuly1kIilco1T ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mx41mn45g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 13:21:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA60610002A;
 Fri,  6 Jan 2023 13:21:35 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E21CF2105AC;
 Fri,  6 Jan 2023 13:21:35 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Fri, 6 Jan
 2023 13:21:32 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Jan 2023 13:20:19 +0100
Message-ID: <20230106131952.6.I7f8de74df18e8fba66161d68de5b6725437af691@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106122020.1110552-1-patrick.delaunay@foss.st.com>
References: <20230106122020.1110552-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_06,2023-01-06_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Etienne CARRIERE <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH 6/6] configs: stm32mp13: Activate command
	stm32key
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

Activate the command stm32key with CONFIG_CMD_STM32KEY.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/stm32mp13_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index f3d5e9812c6c..70b0d5dc99bf 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -7,6 +7,7 @@ CONFIG_DEFAULT_DEVICE_TREE="stm32mp135f-dk"
 CONFIG_SYS_PROMPT="STM32MP> "
 CONFIG_STM32MP13x=y
 CONFIG_DDR_CACHEABLE_SIZE=0x10000000
+CONFIG_CMD_STM32KEY=y
 CONFIG_TARGET_ST_STM32MP13x=y
 CONFIG_ENV_OFFSET_REDUND=0x940000
 # CONFIG_ARMV7_NONSEC is not set
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
