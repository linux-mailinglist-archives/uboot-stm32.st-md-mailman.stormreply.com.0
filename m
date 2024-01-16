Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C7182EC7D
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jan 2024 11:03:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D25BC6B457;
	Tue, 16 Jan 2024 10:03:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E07FC6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 10:03:24 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40G6CAXw015531
 for <uboot-stm32@st-md-mailman.stormreply.com>; Tue, 16 Jan 2024 11:03:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=e3SAiu+
 JQ2G7bWIfo14Sh2tznvfcErdG/CDP/PHcdsQ=; b=TFnMOjcoJK3YyUbjAh6NVxK
 fTf7BDdXG5QE3C6krZza3GArmguY5I526VvymnmbGE3dS9C/HKSae11hPpcNyBra
 hIRRk4lSrVaL3AV9oNYmgbtyuJpHwd+uPUP3XmLolXu0Nb5hn6UWlYkcSkE2wh1u
 sGjw+Cnspr6gpkQLvvZhoGzJdYkcHBjj3kxIM8KJc434RPNpd6VFZNj00uT1fjcT
 27KBtQHhqhE7bWD30aBKoeYEdcWDMNx0Z1oe4kY9P++LjamkmTGySnofFwAIMl6d
 sRY7d9+MGEtN7mvUP13KDUhWS8+yVsYIxfeqR6wdud4FL6oJM8v1Frn4CKXVMMQ=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vkmfydpyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 11:03:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F64A10002A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 11:03:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7512E2207DB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jan 2024 11:03:21 +0100 (CET)
Received: from localhost (10.201.20.205) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 16 Jan
 2024 11:03:21 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Date: Tue, 16 Jan 2024 11:03:18 +0100
Message-ID: <20240116100318.491530-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.205]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [U-BOOT internal][PATCH] configs: stm32mp15: set
	stdin/stdout/stderr to serial
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

Set stdin/stdout/stderr to "serial" in environment to fix the
following warning:
In:    No input devices available!
Out:   No output devices available!
Err:   No error devices available!

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 include/configs/stm32mp15_st_common.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/configs/stm32mp15_st_common.h b/include/configs/stm32mp15_st_common.h
index 60838cb0e3f..6dd73b21c2a 100644
--- a/include/configs/stm32mp15_st_common.h
+++ b/include/configs/stm32mp15_st_common.h
@@ -12,7 +12,10 @@
 	"usb_pgood_delay=2000\0" \
 	"console=ttySTM0\0" \
 	"splashimage=" __stringify(CONFIG_SYS_LOAD_ADDR) "\0" \
-	"splashpos=m,m\0"
+	"splashpos=m,m\0" \
+	"stdin=serial\0" \
+	"stdout=serial\0" \
+	"stderr=serial\0"
 
 #include <configs/stm32mp15_common.h>
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
