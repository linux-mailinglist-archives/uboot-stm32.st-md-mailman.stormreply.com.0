Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E33034A49B
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jun 2019 16:57:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B908CB36EB
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Jun 2019 14:57:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CD29CB36E5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2019 14:57:26 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5IEtweE027216; Tue, 18 Jun 2019 16:57:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=9cMjbfbiESLHCMt2fd94r2wObJtzOztfXkGas+s5uNU=;
 b=Oj5Ytb3Jyx9LpqfecQPYKkpCLTFSLyhSpYgwV+zDbgqTBaEhd96ABF4Untfq8cZ8HSJJ
 +DLe145zJqMKvrPcAPN5AjyBCPy4GUlRLD+Z9pQEyiki5J8KG5Srs4jlX9gtXxr8qnG3
 L+TCzRKwEs03o40FP1JkZV8dtXnX+Pa/6HnWl3cw8/RsWvFvk6hz1j1CWihsn73/GLH4
 tndwGMi6UMbNEXjuauZ8CXcwFB8QWF16Q7PmuIbQgBg56zykIdAkSV/GyxQqmPAeV9E6
 iXZPqfzc0P9EppEq2v1+hs5LDwNI54OVYZyuSWv9cSWyLsS3zrzlkFkomK0E8njYvhsh Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t68n3qb8t-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 18 Jun 2019 16:57:23 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4D37331;
 Tue, 18 Jun 2019 14:57:23 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 31CF42B70;
 Tue, 18 Jun 2019 14:57:22 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 18 Jun
 2019 16:57:22 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 18 Jun 2019 16:57:22
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 18 Jun 2019 16:57:17 +0200
Message-ID: <1560869838-22025-2-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560869838-22025-1-git-send-email-patrick.delaunay@st.com>
References: <1560869838-22025-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-18_07:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrick Delaunay <patrick.delaunay@st.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>
Subject: [Uboot-stm32] [PATCH v2 2/3] ARM: dts: stm32mp1: remove override
	for g-tx-fifo-size
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

Remove the override for usbotg_hs on g-tx-fifo-size as the correct
binding, used in the kernel device tree, is now supported in dwc2
device driver.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- move dt update in a separate patch

 arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
index 5b19e44..994092a 100644
--- a/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157c-ev1-u-boot.dtsi
@@ -56,10 +56,6 @@
 	};
 };
 
-&usbotg_hs {
-	g-tx-fifo-size = <576>;
-};
-
 &v3v3 {
 	regulator-always-on;
 };
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
