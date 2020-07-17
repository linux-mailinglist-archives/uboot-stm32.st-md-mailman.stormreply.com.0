Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFC9223B42
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jul 2020 14:20:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57A6BC36B27
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Jul 2020 12:20:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F092C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jul 2020 12:20:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06HCEAfO000951; Fri, 17 Jul 2020 14:20:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Qq0+ZZ7Lfqsv2cvNlnmgfM8i4siwNBjS1JWiSNo12Kg=;
 b=PyQ8VOZfKc6hzdQKpZChTmFjwTHTxe3ouLEC5wEh05yMOmPVeWA7FgDeCwUdmH1JpNdG
 saDfJj6xoP+3OjqZec6RXPOM2RZVN0x/ntgkPAB54l0PWzlFl4MiW/g8kvOFiT/6vwBd
 g+WDkxsmwzYYv6W+gJxOa3IVZxCWjZ4PUld7KUplpcA3XqyO2zjafhN8I+bCXMVyYaGe
 aTyIxo/A1EvS0hRRaOdkQaou6CngtYnA0phQqqxITgE6e1IrV50r1Ce+3AK6ZHgG28Tt
 mNb1Kxku0YndFukBrY+9m7nWEyi06dVPtRTh3z2dbsGX3c0BqRM1I70dDaFRHa5PcsSi tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 327bkvruy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jul 2020 14:20:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BE22110002A;
 Fri, 17 Jul 2020 14:20:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55D092B33BE;
 Fri, 17 Jul 2020 14:20:17 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 17 Jul 2020 14:20:17 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 17 Jul 2020 14:20:15 +0200
Message-ID: <20200717142009.1.I33bddfcff61ece321e626b04e34f9b53d016d6f2@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-17_06:2020-07-17,
 2020-07-17 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Jon Hunter <jonathanh@nvidia.com>
Subject: [Uboot-stm32] [PATCH] psci: put psci_method in .data section if
	EFI_LOADER is not enabled
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

From: Yann Gautier <yann.gautier@st.com>

Move the variable psci_method in .data section when EFI is not
activated and the psci driver safely access it before relocation.

Without this patch the variable is located in .bss section
and the psci probe requested before relocation corrupts the device
tree (probe is requested by board_f.c::print_resetinfo()).

When EFI_LOADER is activated, this variable in already located in the
.data.efi_runtime section by __efi_runtime_data.

Signed-off-by: Yann Gautier <yann.gautier@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/firmware/psci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/psci.c b/drivers/firmware/psci.c
index 23cf807591..7d2e49fd3e 100644
--- a/drivers/firmware/psci.c
+++ b/drivers/firmware/psci.c
@@ -25,7 +25,11 @@
 #define PSCI_METHOD_HVC 1
 #define PSCI_METHOD_SMC 2
 
+#if CONFIG_IS_ENABLED(EFI_LOADER)
 int __efi_runtime_data psci_method;
+#else
+int psci_method __attribute__ ((section(".data")));
+#endif
 
 unsigned long __efi_runtime invoke_psci_fn
 		(unsigned long function_id, unsigned long arg0,
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
