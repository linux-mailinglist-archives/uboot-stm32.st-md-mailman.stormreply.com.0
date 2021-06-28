Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E8B3B5E80
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Jun 2021 14:56:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0EC84C59783;
	Mon, 28 Jun 2021 12:56:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D0D7C58D78
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 12:56:13 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SCqciD032715; Mon, 28 Jun 2021 14:56:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=qlQefkGqqCQEo4S5C45+LpIzDRCcz5iglyOO5UTfQwk=;
 b=a5qaP5qop0QD0q1b047v6TqXQMCPFQVhJwFfJh364dFNA7u6DMU2Z2dZaQGGsI2JZef6
 umdfTO6dVoqPIsSNlLFJKf79xAmbke+1EVNUstrXq/ysY/da61sSfYeSoZ4nYdwT0acE
 cqmp85R+6SU33GLWc+WXHtPe0lbylc4flsCZVSNduL+vkzbKQ8egONkaUFZ5V16aHU6F
 3J4QSyhwrYHsFrF+PFxwf0StiF2YQrVQ7abMvTE7GwJeKnIVNQb6LInm+NcRpv/wwXEc
 99v4zzewCBu/wZRfFK/JHs+VlOEimCqHzCEMlG0yvd+jFFvKPovNbO058qTk/xdLPQcl lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39f1xsktw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 14:56:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 67E4A10002A;
 Mon, 28 Jun 2021 14:56:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88CF720B87F;
 Mon, 28 Jun 2021 14:56:11 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Jun 2021 14:56:11
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Jun 2021 14:55:59 +0200
Message-ID: <20210628145519.3.Id13cccdd894c43f0df0833fc71e3ff084eb4cc1d@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
References: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_11:2021-06-25,
 2021-06-28 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 3/7] stm32mp: cmd_stm32key: handle error in
	fuse_hash_value
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

Handle errors in fuse_hash_value function.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32key.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index d2045a5983..2529139ebc 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -25,7 +25,7 @@ static void read_hash_value(u32 addr)
 	}
 }
 
-static void fuse_hash_value(u32 addr, bool print)
+static int fuse_hash_value(u32 addr, bool print)
 {
 	struct udevice *dev;
 	u32 word, val;
@@ -36,21 +36,25 @@ static void fuse_hash_value(u32 addr, bool print)
 					  &dev);
 	if (ret) {
 		log_err("Can't find stm32mp_bsec driver\n");
-		return;
+		return ret;
 	}
 
 	for (i = 0; i < STM32_OTP_HASH_KEY_SIZE; i++) {
-		if (print)
-			printf("Fuse OTP %i : %x\n",
-			       STM32_OTP_HASH_KEY_START + i,
-			       __be32_to_cpu(*(u32 *)addr));
-
 		word = STM32_OTP_HASH_KEY_START + i;
 		val = __be32_to_cpu(*(u32 *)addr);
-		misc_write(dev, STM32_BSEC_OTP(word), &val, 4);
+		if (print)
+			printf("Fuse OTP %i : %x\n", word, val);
+
+		ret = misc_write(dev, STM32_BSEC_OTP(word), &val, 4);
+		if (ret != 4) {
+			log_err("Fuse OTP %i failed\n", word);
+			return ret;
+		}
 
 		addr += 4;
 	}
+
+	return 0;
 }
 
 static int confirm_prog(void)
@@ -104,7 +108,9 @@ static int do_stm32key_fuse(struct cmd_tbl *cmdtp, int flag, int argc, char *con
 	if (!yes && !confirm_prog())
 		return CMD_RET_FAILURE;
 
-	fuse_hash_value(addr, !yes);
+	if (fuse_hash_value(addr, !yes))
+		return CMD_RET_FAILURE;
+
 	printf("Hash key updated !\n");
 
 	return CMD_RET_SUCCESS;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
