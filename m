Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAD56BC674
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Mar 2023 08:03:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7BB5C6904F;
	Thu, 16 Mar 2023 07:03:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86CCBC03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 07:03:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32G1qZiU007260; Thu, 16 Mar 2023 08:03:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Ci5sknF7UXMDUAY3YqKT9WwxF3sz7aPFnXQk6c5c62c=;
 b=po9jRyosupUd8B5wM6TRMmibHIBkwcC3tl4yAGngfPKtJo4pqvSWRPfGTdzEL1PBpl/e
 uR/SRzrVc5bLffs3LgDrEThsQ6UiYMR+0mflo8LbeJNDdhYLebqX0DseV2+6WIg87Tdi
 s2Amdq1Ful7T/f6W5MVlPKFdoPSTiWp4RtueteEWKk/AbLv/nnfR90jh2LHQRRjyMTVY
 MJpizQv+mxaxEQ7Jf4I4KmckZxyr4vSv9F8lykLLh3sGNkqVOY4V48a3WhrcYFLwHrZ/
 p5wlYfQy6+c2eqjp/Eho6DAy+qmaCkyWtym7CuUnRrpdr9biTmWCzzg1GZ5penufPOPF kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pbpwq22uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 08:03:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61BD810002A;
 Thu, 16 Mar 2023 08:03:47 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C2F320B9E0;
 Thu, 16 Mar 2023 08:03:47 +0100 (CET)
Received: from localhost (10.201.21.26) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 16 Mar
 2023 08:03:46 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 16 Mar 2023 08:03:43 +0100
Message-ID: <20230316070343.1074010-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230316070343.1074010-1-patrice.chotard@foss.st.com>
References: <20230316070343.1074010-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_04,2023-03-15_01,2023-02-09_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 2/2] configs: stm32mp13: Increase
	usb_pgood_delay for ST boards
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

With some USB device, the current usb_pgood_delay value is not long
enough to ensure a correct detection.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 include/configs/stm32mp13_st_common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/configs/stm32mp13_st_common.h b/include/configs/stm32mp13_st_common.h
index ad8126f6103..20ec11477d6 100644
--- a/include/configs/stm32mp13_st_common.h
+++ b/include/configs/stm32mp13_st_common.h
@@ -9,7 +9,7 @@
 #define __CONFIG_STM32MP13_ST_COMMON_H__
 
 #define STM32MP_BOARD_EXTRA_ENV \
-	"usb_pgood_delay=1000\0" \
+	"usb_pgood_delay=2000\0" \
 	"console=ttySTM0\0"
 
 #include <configs/stm32mp13_common.h>
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
