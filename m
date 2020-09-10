Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C55264080
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 10:50:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E8DDC424B8
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 08:50:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3A8DC3FAE3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 08:50:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08A8lTmn031730; Thu, 10 Sep 2020 10:50:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=5raMD6aMHRgL7Dp2Eu0K3tvtE8w+IB3lavoMbTQx+rs=;
 b=qdWjmD3Ci2uCUL+8FfapBedLEMOc2Z7GZMQaJ0xf0AvYGpZB2uKwBMJnleyaW4NuOtZ1
 y6O7U2DilinFS5JluebPq92MBEFN9XvwWBbeq3sx2i1dVbrqmHoVtmTEq+ha2xm6OleQ
 vujNOpPUVDOIvDmEiDHUTBa6t8WQkcKwLk/c0ejYnb42AIQvf0xiWSYA81Qg+nBgP8vI
 +CMBJBQ1F4XsOqTwpCUQRfBIcsVhK9l6arhxU211TKY4gvsgJSE5eRgt+1O5KkdUQJal
 hetwp3pM0nm0J43mIrJTfDGOBLMqgQ9hnnzwkasEfo9R2+uIWsC6Ib4MJOPqFRPUUGFm uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c1jfabds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Sep 2020 10:50:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3A56E100034;
 Thu, 10 Sep 2020 10:50:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 314EB21F69A;
 Thu, 10 Sep 2020 10:50:05 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 10 Sep 2020 10:50:04 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 10 Sep 2020 10:50:00 +0200
Message-ID: <20200910085004.12883-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910104956.v4.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
References: <20200910104956.v4.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-10_01:2020-09-10,
 2020-09-10 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v4 2/3] test: fdtdec: Add test for new no-map
	fdtdec_add_reserved_memory() parameter
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

Add a test to verify that the no-map property is added in reserved-memory
node when fdtdec_add_reserved_memory() no-map parameter is set to true.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>

---

(no changes since v2)

Changes in v2:
   - Add no-map property test into fdtdec test

 test/dm/fdtdec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/test/dm/fdtdec.c b/test/dm/fdtdec.c
index 4119003041..017157a2ec 100644
--- a/test/dm/fdtdec.c
+++ b/test/dm/fdtdec.c
@@ -101,10 +101,13 @@ static int dm_test_fdtdec_add_reserved_memory(struct unit_test_state *uts)
 	resv.start = 0x2000;
 	resv.end = 0x2fff;
 	ut_assertok(fdtdec_add_reserved_memory(blob, "rsvd_region1",
-					       &resv, &phandle1, false));
+					       &resv, &phandle1, true));
 	subnode = fdt_path_offset(blob, "/reserved-memory/rsvd_region1");
 	ut_assert(subnode > 0);
 
+	/* check that no-map property is present */
+	ut_assert(fdt_getprop(blob, subnode, "no-map", NULL) > 0);
+
 	/* phandles must be different */
 	ut_assert(phandle != phandle1);
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
