Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D7AA9C9F0
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Apr 2025 15:16:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C4D9C78F8B;
	Fri, 25 Apr 2025 13:16:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B087C78F88
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Apr 2025 13:16:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P7YbQo018347;
 Fri, 25 Apr 2025 15:16:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 4jHKfMwMz38eB5ObLfLE35f68LH8ngLBaR9OYBT2H0M=; b=hi/P3l5ETfKjiIKr
 AV4Z7RtmFh/6EIGpfYwm+8b0cYo2HoXPYFKLMlryKftA6PiedlwxaiJ1X6MsWw6H
 mRSn35tFi02I3uRPiqv4Z3EMEyzXCpFZjYWrsm8t6RIy7bXSZsrRdT+G0KHIi/cE
 v6EeXhLmZPgXwEB+47uiAmMcoD97je/kXjY0+Dv6hPYT+Kjg7tRFTUZnEOpeeldj
 JCr28KLtU4MZwELNoVtgoyaGCcNp5YdUfRwd+n27JdsVfZ50B57sBTGQHLpcNnLm
 X1TanrA7biquMAt08lwHJKI0kQKCTGW1tHW7jAW6DIk9N7rSrXmgjTS9TT3280lw
 QHjYmA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjvc8yn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Apr 2025 15:16:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0E1534005D;
 Fri, 25 Apr 2025 15:16:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EBAC590BF7D;
 Fri, 25 Apr 2025 15:15:55 +0200 (CEST)
Received: from localhost (10.252.18.92) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 15:15:55 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 25 Apr 2025 15:15:30 +0200
Message-ID: <20250425131533.392747-20-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250425131533.392747-1-patrice.chotard@foss.st.com>
References: <20250425131533.392747-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.18.92]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_03,2025-04-24_02,2025-02-21_01
Cc: Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2 19/22] arm: stm32mp: add helper function
	stm32mp_is_closed()
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

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

Add the helper function stm32mp_is_closed() to check the "closed" state in
product life cycle, when product secrets have  been provisioned into the
device, by "secure secret provisioning" tools (SSP) for example.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

 arch/arm/mach-stm32mp/cmd_stm32key.c          | 22 +++++++++++++++++++
 .../arm/mach-stm32mp/include/mach/sys_proto.h |  7 ++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index d6bf72d8e32..6bfa67859e1 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -618,3 +618,25 @@ U_BOOT_CMD_WITH_SUBCMDS(stm32key, "Manage key on STM32", stm32key_help_text,
 	U_BOOT_SUBCMD_MKENT(read, 2, 0, do_stm32key_read),
 	U_BOOT_SUBCMD_MKENT(fuse, 3, 0, do_stm32key_fuse),
 	U_BOOT_SUBCMD_MKENT(close, 2, 0, do_stm32key_close));
+
+/*
+ * Check the "closed" state in product life cycle, when product secrets have
+ * been provisioned into the device, by SSP tools for example.
+ * On closed devices, authentication is mandatory.
+ */
+bool stm32mp_is_closed(void)
+{
+	struct udevice *dev;
+	bool closed;
+	int ret;
+
+	ret = get_misc_dev(&dev);
+	if (ret)
+		return false;
+
+	ret = read_close_status(dev, false, &closed);
+	if (ret)
+		return false;
+
+	return closed;
+}
diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index bf1c39742c1..19073668497 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -120,3 +120,10 @@ u32 get_otp(int index, int shift, int mask);
 
 uintptr_t get_stm32mp_rom_api_table(void);
 uintptr_t get_stm32mp_bl2_dtb(void);
+
+/* helper function: check "closed" state in product "Life Cycle" */
+#ifdef CONFIG_CMD_STM32KEY
+bool stm32mp_is_closed(void);
+#else
+static inline bool stm32mp_is_closed(void) { return false; }
+#endif
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
