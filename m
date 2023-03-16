Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D5B6BC673
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Mar 2023 08:03:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D0F7C6904A;
	Thu, 16 Mar 2023 07:03:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 484D0C03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 07:03:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32G1qcbP007327; Thu, 16 Mar 2023 08:03:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=b91t+iQSzcgrRCezZdIo4eBBwGmTl1UC+RPQ39ogAjQ=;
 b=7eqGbOlDZyi9sHu837jB6/uq8B7JtS0XAQB8GFGnLT1oZmi2AgfXPU/tl6o0DJ45rSiB
 XxSwS1MPTixJh3+/CXKA3RKDZ3zgO/SUj/cIKC++3eiUYYfatr2+Gjiejjd9F/ucCjDS
 MsmLRRpASu84k/16cIgQ9VUAuFwu+woAunizvFP80pWP6r+NaFOvHOD9pxGiVsheNzfH
 cjZEF4IUj8lRpUaFvCu4T1p6B2v1CKIp8khyap17xjuCmu0PpP4odFzu6gS4ijyI+Pen
 FDtgTKiEwSYT5m3py+TDBhtLGJ6zCJGkCP0IB4T50NmYnKTcCU/scXucgxqu3LTS6jOo Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pbpwq22uf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 08:03:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 24FBE10002A;
 Thu, 16 Mar 2023 08:03:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0960220B9E0;
 Thu, 16 Mar 2023 08:03:46 +0100 (CET)
Received: from localhost (10.201.21.26) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 16 Mar
 2023 08:03:45 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 16 Mar 2023 08:03:42 +0100
Message-ID: <20230316070343.1074010-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_04,2023-03-15_01,2023-02-09_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/2] configs: stm32mp15: Add usb_pgood_delay
	for ST boards
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

Add usb_pgood_delay to ensure a correct detection of USB devices.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 include/configs/stm32mp15_st_common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/configs/stm32mp15_st_common.h b/include/configs/stm32mp15_st_common.h
index d0cd4130cec..866cd7a719f 100644
--- a/include/configs/stm32mp15_st_common.h
+++ b/include/configs/stm32mp15_st_common.h
@@ -9,6 +9,7 @@
 #define __CONFIG_STM32MP15_ST_COMMON_H__
 
 #define STM32MP_BOARD_EXTRA_ENV \
+	"usb_pgood_delay=2000\0" \
 	"console=ttySTM0\0"
 
 #include <configs/stm32mp15_common.h>
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
