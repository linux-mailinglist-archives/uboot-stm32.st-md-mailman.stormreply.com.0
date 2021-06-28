Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5214C3B5E81
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Jun 2021 14:56:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16DF0C597AA;
	Mon, 28 Jun 2021 12:56:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E988CC58D78
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 12:56:13 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SCqjQY009496; Mon, 28 Jun 2021 14:56:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=/rL3FY+O/fnnS0gNAJMOxWute20BdfrZwbaWJhdft/c=;
 b=mGUomV95Rbl7H09kO9+18rduBf6CSQXu8TXgs2FvEdtw7Iod2YqHe1vyt81wMmaXTyiZ
 K36T59PTFOUQNhG6VHsmPovhzjLcwkBQBuYZTeCIKBRE+Ra8exzbWQpFFWDpC8FaRXai
 XY73vTSQSq8DQm2LQKjf1I778ZoqWbSLhtLjIAbMkQlUpdd62gVvg2/hq3+5hAO4B+Y6
 uAdLavZla+XAZJNveEbPapbclgfkze3udV5Luht+z4YJzueDUnMIBd+HGqTfzAat3LIa
 oriK2znAOI4VPZJ/ZCWT56zFJOB7xVgSb6gsIALaJpT2Bg85iFCYG2ltSFddUxYff098 Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39fc110x0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 14:56:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 71FAE100034;
 Mon, 28 Jun 2021 14:56:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AD8320B87F;
 Mon, 28 Jun 2021 14:56:12 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Jun 2021 14:56:12
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Jun 2021 14:56:00 +0200
Message-ID: <20210628145519.4.I8410e2048aae4150e956478327751a71d8124024@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
References: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_11:2021-06-25,
 2021-06-28 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 4/7] stm32mp: cmd_stm32key: lock of PKH OTP
	after fuse
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

Lock the OTP value of key's hash after the command
$> stm32key fuse <address>

This operation forbids a second update of these OTP as they are
ECC protected in BSEC: any update of these OTP with a different value
causes a BSEC disturb error and the closed chip will be bricked.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32key.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
index 2529139ebc..c4cb6342fa 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32key.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -39,8 +39,9 @@ static int fuse_hash_value(u32 addr, bool print)
 		return ret;
 	}
 
-	for (i = 0; i < STM32_OTP_HASH_KEY_SIZE; i++) {
-		word = STM32_OTP_HASH_KEY_START + i;
+	for (i = 0, word = STM32_OTP_HASH_KEY_START;
+	     i < STM32_OTP_HASH_KEY_SIZE;
+	     i++, word++, addr += 4) {
 		val = __be32_to_cpu(*(u32 *)addr);
 		if (print)
 			printf("Fuse OTP %i : %x\n", word, val);
@@ -50,8 +51,13 @@ static int fuse_hash_value(u32 addr, bool print)
 			log_err("Fuse OTP %i failed\n", word);
 			return ret;
 		}
-
-		addr += 4;
+		/* on success, lock the OTP for HASH key */
+		val = 1;
+		ret = misc_write(dev, STM32_BSEC_LOCK(word), &val, 4);
+		if (ret != 4) {
+			log_err("Lock OTP %i failed\n", word);
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
