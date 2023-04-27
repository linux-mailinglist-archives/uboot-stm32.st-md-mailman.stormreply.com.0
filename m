Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ED86F06BE
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Apr 2023 15:37:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C36FC6907C;
	Thu, 27 Apr 2023 13:37:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 546B1C6907A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 13:37:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33RAn1WY004637; Thu, 27 Apr 2023 15:37:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=CmjsbqtdCryYNMnIZLddGyp7nyCuBRredKO+GQyVQr0=;
 b=Am4s9wptuvaRQ6RRMQ6rIrRvLiOr00Sfbq57QIoMqFEfEOc2/sQr+PYH8iRcIE7DqOkU
 w5UcfXHHD7fjjQeRwQKXuaZhtwpAERtnSJNjl/gyDp22D8hhrittoITE/0YYlQgPl1Cu
 +06K3pd9K6XwYK+LNiX3rC6/p2aXKyNjy5jO7QFp1hP0xgzFCfMXbH/3Ja/mVVSrVaVK
 9rB9RKsHejZWeAN8DSVBflDuJl1dKrF3W7vQLlccb7Ju8+RRKuCMEgWA9Pz+lEmJ3RJX
 s3m6t1IJczT2nM6TERQUilQLqF3W0qpY7J89/z3arHh3gzZLbS5h+d5+UN+6kZ3NTS5N aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3q6xdjm4p4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 15:37:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B56BD100034;
 Thu, 27 Apr 2023 15:36:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AEE8D226FD5;
 Thu, 27 Apr 2023 15:36:51 +0200 (CEST)
Received: from localhost (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 27 Apr
 2023 15:36:51 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 27 Apr 2023 15:36:36 +0200
Message-ID: <20230427153632.4.I8515a57201b19ed2af357f96106ede4b4cf078b7@changeid>
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
Cc: CITOOLS <MDG-smet-aci-reviews@list.st.com>,
 Mickael GARDET <m.gardet@overkiz.com>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 4/6] stm32mp: stm32prog: fix OTP read/write
	error management
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

Avoid to ignore the OTP read/write error and transmits the error
to STM32CubeProgrammer.

Today the error is only displayed in log error:
so the user on HOST thinks the OTP operation is performed.

Reported-by: Mickael GARDET <m.gardet@overkiz.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Fixes: 75ea9e75931c ("stm32mp: stm32prog: add TEE support in stm32prog command")
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 6f3641ccf57b..c85217f6d61e 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -1439,8 +1439,11 @@ int stm32prog_otp_write(struct stm32prog_data *data, u32 offset, u8 *buffer,
 
 	if (!data->otp_part) {
 		data->otp_part = memalign(CONFIG_SYS_CACHELINE_SIZE, otp_size);
-		if (!data->otp_part)
+		if (!data->otp_part) {
+			stm32prog_err("OTP write issue %d", -ENOMEM);
+
 			return -ENOMEM;
+		}
 	}
 
 	if (!offset)
@@ -1503,6 +1506,8 @@ int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
 	memcpy(buffer, (void *)((uintptr_t)data->otp_part + offset), *size);
 
 end_otp_read:
+	if (result)
+		stm32prog_err("OTP read issue %d", result);
 	log_debug("%s: result %i\n", __func__, result);
 
 	return result;
@@ -1556,6 +1561,8 @@ int stm32prog_otp_start(struct stm32prog_data *data)
 
 	free(data->otp_part);
 	data->otp_part = NULL;
+	if (result)
+		stm32prog_err("OTP write issue %d", result);
 	log_debug("%s: result %i\n", __func__, result);
 
 	return result;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
