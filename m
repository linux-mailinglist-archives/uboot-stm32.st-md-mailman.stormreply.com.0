Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A35E56148A
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jun 2022 10:18:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 123CFC5F1F2;
	Thu, 30 Jun 2022 08:18:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D59AC5F1EF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 08:18:13 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U3VaqP022295;
 Thu, 30 Jun 2022 10:18:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=AwEde/x0Bdive8wlrcPdcvxNhAVraoZpq59HQu8nGC8=;
 b=yELQfMCTO40rQ1uhI3JiZysrS/oWR8bUGhLvroLPtjSDn8ucbNGpiJ6Zw8C4Y0TfWE2S
 1EnAxWxebieR+K6PP8Xlt0tu2Uhq8vrN85sLLClXZ35ZXeQsPwYcaNW6OiZH77lL3/kh
 G8383ogHvg58b4kvaSKR8cX+na2oZ8pH/UnfdOKCcUf4uNbET4F69tuclMT0pGXr1Djs
 JJ+gEsIo6hwQUe/zodtoaFhbdQwVdxTSI0tKfjV0zxaPL81exLCrOe2i/E4VjtaV5bds
 zPclT3nV6Tgzty7s/W26vYrGzUlrL/YlMWV87LmMqsohxCJGvG0WWpPbufrUsK1DdCaS RA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gwsq1meqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 10:18:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D05BB10003A;
 Thu, 30 Jun 2022 10:18:11 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC3182132C4;
 Thu, 30 Jun 2022 10:18:11 +0200 (CEST)
Received: from localhost (10.75.127.45) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 30 Jun
 2022 10:17:43 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Jun 2022 10:16:30 +0200
Message-ID: <20220630101610.6.Ide5bc18fb9246988ca219eb5b44b865220215a96@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630101610.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
References: <20220630101610.1.I32e861dc46886c23a866443be2bace22d86ae24e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_04,2022-06-28_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH 06/10] configs: stm32mp13: Add support for
	baudrates higher than 115200
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

On STM32MP13x STMicroelectronics boards, the UART can reliably go up to
4000000 bauds when connected to the external ST-LINKV3.

This patch adds the support of higher baudrates on STMicroelectronics
STM32MP13x boards with ST-LINKV3.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 include/configs/stm32mp13_st_common.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/configs/stm32mp13_st_common.h b/include/configs/stm32mp13_st_common.h
index ec64b12f7ab..c51022b40d2 100644
--- a/include/configs/stm32mp13_st_common.h
+++ b/include/configs/stm32mp13_st_common.h
@@ -14,4 +14,9 @@
 
 #include <configs/stm32mp13_common.h>
 
+/* uart with on-board st-link */
+#define CONFIG_SYS_BAUDRATE_TABLE      { 9600, 19200, 38400, 57600, 115200, \
+					 230400, 460800, 921600, \
+					 1000000, 2000000, 4000000}
+
 #endif
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
