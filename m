Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CEF5671A3
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Jul 2022 16:57:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8A79C640F6;
	Tue,  5 Jul 2022 14:57:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECDA4C640F5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Jul 2022 14:57:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265CZDdt011260;
 Tue, 5 Jul 2022 16:57:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Rvsq5eOhpFCDsbX/xWTcjrvbrXQsSqKVKJKcKni/BPI=;
 b=a+AMthcxh9AFdFpUV8/EY1l9S6VhCRMYexaxQPWYg92o08ztH48RUGMdAofCNHyZ2pvJ
 TtxdIpD7egpYY1L+Z5jFmhCHgQgEQr6tOGTcmyz4oQLT0hZuNwICUcwZv3zXhtmy4aCU
 ljRnCp8OesxtnAFV71hM/WBSzZ2B+cJ7CR1fb0Pir8iDB2yokHLXmXoruqt/O4+ayMQW
 62z8OrssrJDsib90GfIk2lZHwn7n92VdAXmeeY94Bb09G6xsFM4DiOevwztApccEiQK/
 ndRQS1uLR6p+1OGJqdZq/iH57KRoCtqs45oozQqm0q4NypVCtAVKu3PrHpKt1H9KnyqO jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h2ben8fnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jul 2022 16:57:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 87B3E100039;
 Tue,  5 Jul 2022 16:57:16 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C9C52248B6;
 Tue,  5 Jul 2022 16:57:16 +0200 (CEST)
Received: from localhost (10.75.127.50) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 5 Jul
 2022 16:56:02 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 5 Jul 2022 16:55:56 +0200
Message-ID: <20220705165545.3.Ia0aa1dcca7e4958830461ea4304b5826049f38aa@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220705165545.1.If6846005f2384c6cc800089ee2d23466c0b2054f@changeid>
References: <20220705165545.1.If6846005f2384c6cc800089ee2d23466c0b2054f@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-05_11,2022-06-28_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: [Uboot-stm32] [PATCH 3/4] configs: stm32mp15: increase malloc size
	for pre-reloc
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

With support of SCMI in OP-TEE, the early malloc usage
increase, the associated defined CONFIG_SYS_MALLOC_F_LEN
need to be increased.

For example, for stm32mp15_defconfig and
stm32mp157c-dk2-scmi.dtsi, we have:

Early malloc usage: 14098 / 80000

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/stm32mp15_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index 48185d32baa..76b187bead1 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -1,7 +1,7 @@
 CONFIG_ARM=y
 CONFIG_ARCH_STM32MP=y
 CONFIG_TFABOOT=y
-CONFIG_SYS_MALLOC_F_LEN=0x3000
+CONFIG_SYS_MALLOC_F_LEN=0x20000
 CONFIG_ENV_OFFSET=0x480000
 CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
