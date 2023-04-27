Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BB96F06C0
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Apr 2023 15:37:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EEC7C6907C;
	Thu, 27 Apr 2023 13:37:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06090C6907A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 13:37:53 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RAPJaG023684; Thu, 27 Apr 2023 15:37:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=XVfynbPCNh7voIM7NndX7dYxWgt2t7DCED8w5ypFKjs=;
 b=eoiX/6F/V29rZqnABUYC9GI7zw0V18DSJNfyywc9l6zvuTpCoUyeGT9pLRhB1h8Q6n3v
 9gicv+LIbrSZWSsHFeOnpUwAKH0MG0POPOGoIidi7pPrOLPUQXvKV0l3MeDXZrVRIw2J
 GD0gLQDyHNfZ8u+HWx4Kbkn1xQNAj49wDisqPvNvpp2KdpAeanNlfZuo5OLj8uyH7cgK
 +0HVgTL4Oid4175m85fjrJqDXBcBn0ffuKRzQRMOEvCUScDuNiFV5LD1/tzJ9vThsbhT
 6wnkapAzpX6y35crWeRHrhOx3s08v31wc1Kt9IXb3xunqVPHcctd/Pys2T7wdpBANwxy rA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q5t4vywkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 15:37:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E5BF100039;
 Thu, 27 Apr 2023 15:37:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5960B2291A3;
 Thu, 27 Apr 2023 15:37:52 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 27 Apr
 2023 15:37:52 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 27 Apr 2023 15:36:37 +0200
Message-ID: <20230427153632.5.Icec632d485db8fb4f25d878dd3b90253a7b2c706@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230427133638.1477556-1-patrick.delaunay@foss.st.com>
References: <20230427133638.1477556-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_07,2023-04-27_01,2023-02-09_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: [Uboot-stm32] [PATCH 5/6] stm32mp: stm32prog: use the decimal
	format by default for offset parsing
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

Change the default base for offset parsing with simple_strtoull(),
so offset in flashlayout is coded in base 10 by default, even if string
start with '0'. The Octal encoding is not supported. The base 16
is still supported when the '0x' header is detected.

This patch solves an unexpected parsing result when the address,
provided by decimal value is starting by 0, for example 0x4400 = 00017408
is a invalid with current code.

...
P	0x04	fsbl1	Binary	mmc0	00017408	        tf-a.stm32
....

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index c85217f6d61e..90cf6c39b4a2 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -514,7 +514,7 @@ static int parse_offset(struct stm32prog_data *data,
 			stm32prog_err("Layout line %d: invalid part '%s'",
 				      i, p);
 	} else {
-		part->addr = simple_strtoull(p, &tail, 0);
+		part->addr = simple_strtoull(p, &tail, 10);
 		if (tail == p || *tail != '\0') {
 			stm32prog_err("Layout line %d: invalid offset '%s'",
 				      i, p);
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
