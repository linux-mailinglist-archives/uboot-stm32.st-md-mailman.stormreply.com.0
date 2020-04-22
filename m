Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F16371B4526
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 14:29:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEC87C36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 12:29:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6578AC36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 12:29:27 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MCECfq031949; Wed, 22 Apr 2020 14:29:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=lsKpWgwPg4wlkG0a9ZtLpxbkyKLLlg4UAgiPXP0f5Us=;
 b=erwBTNJpS5isxU3SGxE9MuEVYCcC3JgSpHzZ6X3XHLLHhnTvimHc1cwFa5rBpY2a6y/m
 yA2NnwhYxxxi0PtKwVwav6LIkWRZnTkEsFg+uaQ+vGTcILH3PrDccYGXmbMrhL6aG+nt
 LYZnfNc/keJGpir0z7iFqQvarbuCzcgfcO//8L2mGxki5IepGaZmVbbWfERshULE47a+
 GTKMl7hQjNb3nWmeTR8N+j3/0V8PAFf0Gt4KEnE2A83JH4r7C5450oH2PKxc+zW6XO32
 jFzI2EmpVtOFUnYlVEfaQILD74dPrvxAlad/c7mmlv4Wuo8AdioTAYHMD8BPH32cuWlt vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fq11pceu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 14:29:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B2C53100034;
 Wed, 22 Apr 2020 14:29:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA7B22AE6C5;
 Wed, 22 Apr 2020 14:29:25 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 22 Apr 2020 14:29:25 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Apr 2020 14:29:13 +0200
Message-ID: <20200422142834.v2.5.I5d296f8fd82b60a592b51029e7e420672d0e855b@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422122920.19340-1-patrick.delaunay@st.com>
References: <20200422122920.19340-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_03:2020-04-22,
 2020-04-22 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 05/12] board: stm32mp1: gt9147 IRQ before
	reset on EV1
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

Software workaround for I2C issue on EV1 board,
configure the IRQ line for touchscreen before LCD reset
to fix the used I2C address.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v2:
- remove debug message and unused return of board_ev1_init

 board/st/stm32mp1/stm32mp1.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 6a3e2e64bf..8e247bbc87 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -621,6 +621,38 @@ static bool board_is_dk2(void)
 }
 #endif
 
+static bool board_is_ev1(void)
+{
+	if (CONFIG_IS_ENABLED(TARGET_ST_STM32MP15x) &&
+	    (of_machine_is_compatible("st,stm32mp157a-ev1") ||
+	     of_machine_is_compatible("st,stm32mp157c-ev1") ||
+	     of_machine_is_compatible("st,stm32mp157d-ev1") ||
+	     of_machine_is_compatible("st,stm32mp157f-ev1")))
+		return true;
+
+	return false;
+}
+
+/* touchscreen driver: only used for pincontrol configuration */
+static const struct udevice_id goodix_ids[] = {
+	{ .compatible = "goodix,gt9147", },
+	{ }
+};
+
+U_BOOT_DRIVER(goodix) = {
+	.name		= "goodix",
+	.id		= UCLASS_NOP,
+	.of_match	= goodix_ids,
+};
+
+static void board_ev1_init(void)
+{
+	struct udevice *dev;
+
+	/* configure IRQ line on EV1 for touchscreen before LCD reset */
+	uclass_get_device_by_driver(UCLASS_NOP, DM_GET_DRIVER(goodix), &dev);
+}
+
 /* board dependent setup after realloc */
 int board_init(void)
 {
@@ -638,6 +670,9 @@ int board_init(void)
 
 	board_key_check();
 
+	if (board_is_ev1())
+		board_ev1_init();
+
 #ifdef CONFIG_DM_REGULATOR
 	if (board_is_dk2())
 		dk2_i2c1_fix();
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
