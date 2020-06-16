Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3BA1FBB9C
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 18:25:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D8D0C36B0D
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 16:25:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E0C8C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 16:25:18 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GG7tO3024790; Tue, 16 Jun 2020 18:25:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=k3nf8yBTKq0qeZ9WbUpINq0w+GjZSEScdcPnASG6ACQ=;
 b=zNAAbYph6k5cbGGW1+spQKck/hWB98DWuksTd9UlL1y/GzaHDFfZQu1ElLqe578MqUf8
 XwTTVSr0XO2XOHMIRbd9s1OlQdJ2esnkiZj5DTJ7oHt5uSZRe8h5U+4s3cQP0Brl6IoD
 fNFwFNKxN2JhwawPrpGgNybh6lthyC+y4ntjbRFdVb5ivDFB9wKzfLZtUFRBqrfNcdoF
 NxrflvC3GRclV0YmkVz6o0EohNLocILnnKJGaz6a5r54bHBN0FQcGNuxWPDvt49Dp434
 PSn1Znx93zt1K0BAJSpnm4nfRZqtchL4Rh6sEVAz3YOf4vqT+5i1dA/PRB8GPVdSyoob Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mkx98fsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 18:25:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E24810002A;
 Tue, 16 Jun 2020 18:25:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 042B82C8923;
 Tue, 16 Jun 2020 18:25:16 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 16 Jun 2020 18:25:15 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 16 Jun 2020 18:25:14 +0200
Message-ID: <20200616182508.1.I15e9f84cc4116350cbec881d243a86f28b819123@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_07:2020-06-16,
 2020-06-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] arm: stm32mp: stm32prog: add "Device Name" in
	iproduct during DFU USB enumeration
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

Add "Device Name" in iproduct during DFU USB enumeration
to have this information in STM32CubeProgrammer trace
(this tools is compatible with @Name since v2.3)

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
index 969245e199..30547f94c9 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
@@ -197,10 +197,12 @@ bool stm32prog_usb_loop(struct stm32prog_data *data, int dev)
 	bool result;
 	/* USB download gadget for STM32 Programmer */
 	char product[128];
+	char name[SOC_NAME_SIZE];
 
+	get_soc_name(name);
 	snprintf(product, sizeof(product),
-		 "USB download gadget@Device ID /0x%03X, @Revision ID /0x%04X",
-		 get_cpu_dev(), get_cpu_rev());
+		 "USB download gadget@Device ID /0x%03X, @Revision ID /0x%04X, @Name /%s,",
+		 get_cpu_dev(), get_cpu_rev(), name);
 	g_dnl_set_product(product);
 
 	if (stm32prog_data->phase == PHASE_FLASHLAYOUT) {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
