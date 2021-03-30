Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 030F734E786
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Mar 2021 14:35:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91DB5C5719D;
	Tue, 30 Mar 2021 12:35:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B33F8C56631
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 12:34:59 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12UCM4BA007762; Tue, 30 Mar 2021 14:34:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=Hz3uXPAGXyQ6GTFKvlxWxIq8d4B0an8dvq4OV/WQEGI=;
 b=E6eDeIKEw7Bhj5oxHEcWIViy9EE7X3+M4j/TNr8E+7Q+KMmEDO6g5NMa0BS0Mn35kVqe
 22lWsdwTXYn+UfdrRKBBEQ+Wvfu51roy+REaC32jJni6634Bj47/iInjPGctbUJZGwGa
 sUWInpwwr4cT0pNiDJ1j4B38UjtVpcx2SWAxcEGIgwJDUsEKo0xO3XFMw2Q1KRwhSc9S
 KGaU8U/ltVDbbf191QMXRVkgZfHN6pzOLXKBBOr2zTBuPQTYmU9FfIdzFgrHV87nGXax
 jHjwjnhSFV3YSIAbRf71VK4Lf+RA8/JUPVAnFnRctB1ttsgBriuEz1htx3qGfPQe4xih XA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37kxrwt8t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 14:34:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9585F10002A;
 Tue, 30 Mar 2021 14:34:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7556D2397BF;
 Tue, 30 Mar 2021 14:34:52 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 30 Mar 2021 14:34:52
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Mar 2021 14:34:50 +0200
Message-ID: <20210330143429.1.I654d7aeb07f9cd0602752861d06f4c17e9a0ee17@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-30_04:2021-03-30,
 2021-03-30 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>, Joe Hershberger <joe.hershberger@ni.com>
Subject: [Uboot-stm32] [PATCH] net: dwc_eth_qos: cosmetic: remove unused
	define EQOS_DESCRIPTOR_ALIGN
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

Remove the define EQOS_DESCRIPTOR_ALIGN unused since the
commit 6f1e668d964e ("net: dwc_eth_qos: Pad descriptors to cacheline size")

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/net/dwc_eth_qos.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index e8242ca4e1..0b1e95e98b 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -240,8 +240,6 @@ struct eqos_tegra186_regs {
 #define EQOS_AUTO_CAL_STATUS_ACTIVE			BIT(31)
 
 /* Descriptors */
-/* We assume ARCH_DMA_MINALIGN >= 16; 16 is the EQOS HW minimum */
-#define EQOS_DESCRIPTOR_ALIGN	ARCH_DMA_MINALIGN
 #define EQOS_DESCRIPTORS_TX	4
 #define EQOS_DESCRIPTORS_RX	4
 #define EQOS_DESCRIPTORS_NUM	(EQOS_DESCRIPTORS_TX + EQOS_DESCRIPTORS_RX)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
