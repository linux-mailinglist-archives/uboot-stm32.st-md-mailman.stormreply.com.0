Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B83C1B2ABC
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 17:11:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66BDBC36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 15:11:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06B81C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 15:11:53 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LF90U6030173; Tue, 21 Apr 2020 17:11:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=x8K7x5bVUh5e/hfXUpNu/sH7RoXMCDZLaeCj1as6sSQ=;
 b=fw4Lxjjjv34MA2lG5ENq9mBp7lqbiHfZ+TzuwTyiV/rtmBVsigEREf8fy6Roqhd/CmGj
 Hwtg0kc+s0TmhFGUlHUUrx64LDf23RbA68hLoUKl7aJkSG5v5AQhGHNQHDas+1OSortp
 I69vqxFYX9epQDhOtHpVpHSzk+pNIk6jwaKtds4xA4wvv3XvOoGXyJQC7Nwad5kwsbBS
 h/exkdAR7iksLedhC5/VFxM5YmILChmjhjmx5G6bAdHoaWL8SH9DFusuMpbBnZiWHPit
 EqqhiA/i2TrN6X/0MQ4Nao0OLPUW2FEHwCzbrbAfjCbUAY+ylzmsANWLuIqtdW6oiAPY xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fqaw8ug1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 17:11:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2EB8100034;
 Tue, 21 Apr 2020 17:11:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA4882BE249;
 Tue, 21 Apr 2020 17:11:51 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Apr 2020 17:11:51 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 Apr 2020 17:11:26 +0200
Message-ID: <20200421171123.7.Ibcf2b148dc7ba271546063667955e82cf997d7ee@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421151128.18072-1-patrick.delaunay@st.com>
References: <20200421151128.18072-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_05:2020-04-20,
 2020-04-21 signatures=0
Cc: Marek Vasut <marex@denx.de>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 7/9] board: st: stpmic1: add function
	stmpic_buck1_set
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

Add a function stmpic_buck1_set to configure buck1 voltage
in SPL as regulator framework is not available.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/common/stpmic1.c | 24 ++++++++++++++++++++++++
 board/st/common/stpmic1.h |  6 ++++++
 2 files changed, 30 insertions(+)
 create mode 100644 board/st/common/stpmic1.h

diff --git a/board/st/common/stpmic1.c b/board/st/common/stpmic1.c
index ca10a2246b..a912242ad9 100644
--- a/board/st/common/stpmic1.c
+++ b/board/st/common/stpmic1.c
@@ -9,6 +9,30 @@
 #include <power/pmic.h>
 #include <power/stpmic1.h>
 
+int stmpic_buck1_set(u32 voltage_mv)
+{
+	struct udevice *dev;
+	int ret;
+	u32 value;
+
+	ret = uclass_get_device_by_driver(UCLASS_PMIC,
+					  DM_GET_DRIVER(pmic_stpmic1), &dev);
+	if (ret)
+		return ret;
+
+	/* VDDCORE= STMPCI1 BUCK1 ramp=+25mV, 5 => 725mV, 36 => 1500mV */
+	value = ((voltage_mv - 725) / 25) + 5;
+	if (value < 5)
+		value = 5;
+	if (value > 36)
+		value = 36;
+
+	return pmic_clrsetbits(dev,
+			       STPMIC1_BUCKX_MAIN_CR(STPMIC1_BUCK1),
+			       STPMIC1_BUCK_VOUT_MASK,
+			       STPMIC1_BUCK_VOUT(value));
+}
+
 int board_ddr_power_init(enum ddr_type ddr_type)
 {
 	struct udevice *dev;
diff --git a/board/st/common/stpmic1.h b/board/st/common/stpmic1.h
new file mode 100644
index 0000000000..a020dddbe0
--- /dev/null
+++ b/board/st/common/stpmic1.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */
+/*
+ * Copyright (C) 2020, STMicroelectronics - All Rights Reserved
+ */
+
+int stmpic_buck1_set(u32 voltage_mv);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
