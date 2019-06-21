Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BE84E908
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 15:27:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F389CA027B
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jun 2019 13:27:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5309CA0278
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:27:05 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5LDGtfe032277; Fri, 21 Jun 2019 15:27:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=2y+ml7P0AZkQQ1FBnDF9AlPoOF/r8tH4mxByL7q9f9A=;
 b=jYRAHtmyao9dAaHhlkkbLFw57NbdjsaEnrqBdkLgV4e2Vgs7YSkdPjNWakX54kFLZIHU
 suAuCjRPsoaiSTDMsZhoV/ePLJXs1/F0buQxJYpZspBx65MlsWOwZM2oWgS4tCmfhy5D
 Z6QvTSuiZZ+35PZBui5FzqdP2Ue0ypmk5WfYrN5khnNo93Wwk7ta3aiEQ0Yp3uqYuT4T
 YTdj8qbpLVpPJnZhmbscvktudAMcYH6b5rG6Qp/S7oMRMlS5k+DSxFN7Bo4Ard9R7U6G
 Mjz3cfY0CYNRuqrHmUrhG+egkThSvRv6c5LW8Vv0M667u8pPbXtihSily5lmzI4fVY3t BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t7wxss9hg-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 21 Jun 2019 15:27:04 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BDBDA4D;
 Fri, 21 Jun 2019 13:27:03 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A01532A50;
 Fri, 21 Jun 2019 13:27:03 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 15:27:03 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun 2019 15:27:03
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 21 Jun 2019 15:26:41 +0200
Message-ID: <1561123618-2029-3-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
References: <1561123618-2029-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-21_09:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Bin Meng <bmeng.cn@gmail.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 03/20] serial: stm32: Fix warnings when
	compiling with W=1
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

This patch solves the following warnings:

drivers/serial/serial_stm32.c: In function 'stm32_serial_probe':
warning: comparison of unsigned expression < 0 is always false [-Wtype-limits]
  if (plat->clock_rate < 0) {
                       ^

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/serial/serial_stm32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/serial/serial_stm32.c b/drivers/serial/serial_stm32.c
index cca8b70..3ab536a 100644
--- a/drivers/serial/serial_stm32.c
+++ b/drivers/serial/serial_stm32.c
@@ -195,9 +195,9 @@ static int stm32_serial_probe(struct udevice *dev)
 	}
 
 	plat->clock_rate = clk_get_rate(&clk);
-	if (plat->clock_rate < 0) {
+	if (!plat->clock_rate) {
 		clk_disable(&clk);
-		return plat->clock_rate;
+		return -EINVAL;
 	};
 
 	_stm32_serial_init(plat->base, plat->uart_info);
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
