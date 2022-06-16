Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1542B54E76A
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Jun 2022 18:38:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3D4FC03FE0;
	Thu, 16 Jun 2022 16:38:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6237C03FCB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 16:38:12 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GFZfmH023408;
 Thu, 16 Jun 2022 18:38:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=x/pJGJW+UHIExTuEVtSMJ2lTG57bYynhc2LAgr23lwo=;
 b=lRYnDJngNH9Hj6JwX5rmy4Wh3J+Sxb6rD7EvP2S9K7Jr3cUEzJ9joxePbcGb/9/9EfLe
 V+eThpJhOW2u294zOtuPFfD71Tk//2lZWsC0cvoW07GDnApLQhR+lcJkOwIPtg2CajEd
 21ty6Gt/49g2bh7SDBJ073CXePs/L4DaAICiePyQ7E7dk1xyFt0uZvT2xrRgx2Us+8ER
 Zo7zppuxskE+2Au5MBcPA8Dd77Gn74eLThHem8eNtZSzL5mKaGn/9SrzEgwsy2GtS3Hb
 D3RJxIB147tb9QcOkFFq1UBf+jgtg4tNasyYZyrB3bG9i2bSff8Xa929Iyttccz6GCnt gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gmjd2b480-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jun 2022 18:38:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 182EE100034;
 Thu, 16 Jun 2022 18:38:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 13C5522788E;
 Thu, 16 Jun 2022 18:38:04 +0200 (CEST)
Received: from localhost (10.75.127.118) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 16 Jun
 2022 18:38:03 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 16 Jun 2022 18:37:59 +0200
Message-ID: <20220616183756.1.Iec6058719fd0d81d3fe21d5607ed8125c1cc4039@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_12,2022-06-16_01,2022-02-23_01
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>,
 Simon Glass <sjg@chromium.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] stm32mp: stm32prog: fix the last character of
	dfu_alt_add third parameter
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

The third parameter of dfu_alt_add(), the string description of alternate,
is build in stm32prog_alt_add() with a unnecessary character ';' at the
end of the string.

This separator was required in the first implementation of
dfu_alt_add() but is no more needed in the current implementation;
this separator is managed only in dfu_config_interfaces() which call
dfu_alt_add() for this parameter without this separator.

And since the commit 53b406369e9d ("DFU: Check the number of arguments
and argument string strictly"), this added character cause an error when
the stm32prog command is executed because the third parameter of
dfu_alt_add() must be a string with a numerical value; 's' must be NULL
in the result of call in dfu_fill_entity_mmc():
  third_arg = simple_strtoul(argv[2], &s, 0);

Fixes: 53b406369e9d ("DFU: Check the number of arguments and argument string strictly")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index b7111123ba..c391b6c7ab 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -1262,7 +1262,7 @@ static int stm32prog_alt_add(struct stm32prog_data *data,
 				   "raw 0x%llx 0x%llx",
 				   part->addr, nb_blk);
 		offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
-				   " mmcpart %d;", -(part->part_id));
+				   " mmcpart %d", -(part->part_id));
 	} else {
 		if (part->part_type == PART_SYSTEM &&
 		    (part->target == STM32PROG_NAND ||
@@ -1280,7 +1280,7 @@ static int stm32prog_alt_add(struct stm32prog_data *data,
 			offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
 					   " %d", part->dev_id);
 		offset += snprintf(buf + offset, ALT_BUF_LEN - offset,
-				   " %d;", part->part_id);
+				   " %d", part->part_id);
 	}
 	ret = -ENODEV;
 	switch (part->target) {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
