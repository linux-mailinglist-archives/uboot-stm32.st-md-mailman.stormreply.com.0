Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CACE752F0A7
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 18:28:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9156FC0D2BB;
	Fri, 20 May 2022 16:28:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38643C0D2B9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 16:28:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KAHt0W015565;
 Fri, 20 May 2022 18:28:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Q4vp9pXHmtJfgUw6aSOtbyhCfp3zKNU/xXyL0Zk6+Z4=;
 b=AWnx0HBNm2frE/arzlxOYOEgtCuxH/4VbtpiOr0Jt2zo09Wfgiy4S9W+WBm13VDW4zyA
 udEA9iuynDpL+S/w4FBSCCtw7tMN8MLpLRS/+x5XKnowgZNuMTik/Pc1t/k43SfM2Vn+
 v2Fon1Vji7H7tgT+AMzo6wntCTC38ACI5dMgqiYpsvcrqUltYXdet2gPvSERCnzge58T
 l1AIwmXN6wIHgE89iVMIoCuqY5ze+nYx5q5foJoWXG+8RxEq8984bXPVtSWhjJGtdIqM
 CLb2GLN5r9D0PbKGOv8v2iagkHO2exGvnJ/0ladaK6vYm0DsDalVo42txEzKaUyHRnTv fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23s2583c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 18:28:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B6EF2100034;
 Fri, 20 May 2022 18:27:59 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B19D7235F26;
 Fri, 20 May 2022 18:27:59 +0200 (CEST)
Received: from localhost (10.75.127.46) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 18:27:19 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 20 May 2022 18:24:49 +0200
Message-ID: <20220520182444.v2.11.I35fae2ba5868b79e66ccef249270e1cf1bf3f04b@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520162454.1864832-1-patrick.delaunay@foss.st.com>
References: <20220520162454.1864832-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_04,2022-05-20_02,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH v2 11/16] board: stm32pm1: add stm32mp13 board
	support
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

Add stm32mp15x prefix to all STM32MP15x board specific functions,
this patch is a preliminary step for STM32MP13x support.

This patch also adds the RCC probe to avoid circular access with
usbphyc probe as clk provider.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- fix typo in commit message

 board/st/stm32mp1/stm32mp1.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 07b1a63db7..6f5ff423fe 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -554,8 +554,7 @@ static void sysconf_init(void)
 	clrbits_le32(syscfg + SYSCFG_CMPCR, SYSCFG_CMPCR_SW_CTRL);
 }
 
-/* Fix to make I2C1 usable on DK2 for touchscreen usage in kernel */
-static int dk2_i2c1_fix(void)
+static int board_stm32mp15x_dk2_init(void)
 {
 	ofnode node;
 	struct gpio_desc hdmi, audio;
@@ -564,6 +563,7 @@ static int dk2_i2c1_fix(void)
 	if (!IS_ENABLED(CONFIG_DM_REGULATOR))
 		return -ENODEV;
 
+	/* Fix to make I2C1 usable on DK2 for touchscreen usage in kernel */
 	node = ofnode_path("/soc/i2c@40012000/hdmi-transmitter@39");
 	if (!ofnode_valid(node)) {
 		log_debug("no hdmi-transmitter@39 ?\n");
@@ -611,7 +611,7 @@ error:
 	return ret;
 }
 
-static bool board_is_dk2(void)
+static bool board_is_stm32mp15x_dk2(void)
 {
 	if (CONFIG_IS_ENABLED(TARGET_ST_STM32MP15x) &&
 	    of_machine_is_compatible("st,stm32mp157c-dk2"))
@@ -620,7 +620,7 @@ static bool board_is_dk2(void)
 	return false;
 }
 
-static bool board_is_ev1(void)
+static bool board_is_stm32mp15x_ev1(void)
 {
 	if (CONFIG_IS_ENABLED(TARGET_ST_STM32MP15x) &&
 	    (of_machine_is_compatible("st,stm32mp157a-ev1") ||
@@ -644,7 +644,7 @@ U_BOOT_DRIVER(goodix) = {
 	.of_match	= goodix_ids,
 };
 
-static void board_ev1_init(void)
+static void board_stm32mp15x_ev1_init(void)
 {
 	struct udevice *dev;
 
@@ -655,13 +655,22 @@ static void board_ev1_init(void)
 /* board dependent setup after realloc */
 int board_init(void)
 {
+	struct udevice *dev;
+	int ret;
+
+	/* probe RCC to avoid circular access with usbphyc probe as clk provider */
+	if (IS_ENABLED(CONFIG_CLK_STM32MP13)) {
+		ret = uclass_get_device_by_driver(UCLASS_CLK, DM_DRIVER_GET(stm32mp1_clock), &dev);
+		log_debug("Clock init failed: %d\n", ret);
+	}
+
 	board_key_check();
 
-	if (board_is_ev1())
-		board_ev1_init();
+	if (board_is_stm32mp15x_ev1())
+		board_stm32mp15x_ev1_init();
 
-	if (board_is_dk2())
-		dk2_i2c1_fix();
+	if (board_is_stm32mp15x_dk2())
+		board_stm32mp15x_dk2_init();
 
 	if (IS_ENABLED(CONFIG_DM_REGULATOR))
 		regulators_enable_boot_on(_DEBUG);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
