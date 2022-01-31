Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 660EC4A4BC4
	for <lists+uboot-stm32@lfdr.de>; Mon, 31 Jan 2022 17:21:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20CCAC5E2C6;
	Mon, 31 Jan 2022 16:21:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78A0FC0614D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jan 2022 16:21:48 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VFAof9015316;
 Mon, 31 Jan 2022 17:21:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=KJpPcP6c3l+4EpIso6P+Hbwaa69F1ID98PSugBzme4I=;
 b=TbQg4+lphGwqRiKSpfFGUR1DjPMnVNRLIpPhC2DMv4AYRjoniZsA2k2jr7n7aKdrvZPp
 Mr2PopdCobXIAAQipDYlAa0r5VEncxOpBqH7U3D9NUvIVpGG16bYDKx0JuPcmb9bAHZz
 8acyQhLh1jUEAHyA1dJnvF4eMiIdDudFO+MhAOI0C1KGJ8ESvhUc479h5U+gy5e3joaD
 IrFm8pQoC5P8rPXAF0f3Em1Tj+aJV0t9YK9raWH9eqWLw7wzdRfvJFh7FyHd2s2k6dSG
 yZfRt8rkcSX8g5WdZHIQT1K+VFCghPsG6SzSKZJPRR1Lavf+dr+8d6JNEEmKD3xSJuFx Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dwutpmjm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 17:21:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0CD7B10002A;
 Mon, 31 Jan 2022 17:21:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 03AB4222CA0;
 Mon, 31 Jan 2022 17:21:46 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 31 Jan 2022 17:21:45
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 31 Jan 2022 17:21:37 +0100
Message-ID: <20220131172131.1.I32a8f213d330dccd922f7aafc60d3d63fcbe8615@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_07,2022-01-31_01,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tero Kristo <t-kristo@ti.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/4] cmd: clk: test the number of argument in
	setfreq command
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

Test the number of argument in setfreq command to avoid a crash when
the command setfreq is called without argument:

  STM32MP> clk setfreq
  data abort
  pc : [<ddba3f18>]	   lr : [<ddba3f89>]
  reloc pc : [<c018ff18>]	   lr : [<c018ff89>]
  sp : dbaf45b8  ip : ddb1d859	 fp : 00000002
  r10: dbb3fd80  r9 : dbb11e90	 r8 : ddbf38cc
  r7 : ddb39725  r6 : 00000000	 r5 : 00000000  r4 : dbb3fd84
  r3 : dbb3fd84  r2 : 0000000a	 r1 : dbaf45bc  r0 : 00000011
  Flags: nzCv  IRQs off  FIQs off  Mode SVC_32 (T)
  Code: 4dd3 1062 85a3 ddbd (7803) 2b30
  Resetting CPU ...

Fixes: 7ab418fbe612 ("clk: add support for setting clk rate from cmdline")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 cmd/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/cmd/clk.c b/cmd/clk.c
index dbbdc31b35..52237791cf 100644
--- a/cmd/clk.c
+++ b/cmd/clk.c
@@ -120,6 +120,9 @@ static int do_clk_setfreq(struct cmd_tbl *cmdtp, int flag, int argc,
 	s32 freq;
 	struct udevice *dev;
 
+	if (argc != 3)
+		return CMD_RET_USAGE;
+
 	freq = dectoul(argv[2], NULL);
 
 	dev = clk_lookup(argv[1]);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
