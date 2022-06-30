Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 719BB56148C
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jun 2022 10:18:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29DE6C60465;
	Thu, 30 Jun 2022 08:18:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AA76C5F1F0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jun 2022 08:18:13 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U8E7Y8002975;
 Thu, 30 Jun 2022 10:18:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=/yh5jUvzbIJfUmF2VKvOml40b5U7FGom+wfH/gsH9BE=;
 b=0K0va8frXNrIXFBM15WYab8m7KfjLIsYmJonkerzFMZQL7ITCsA5LG2UfdYv+l/o/PKl
 qehKVrjzbSXqD10GGhxt2h9AYwhWCDmJcCa2s1D8gFeH4ezXFOQc7yHanmbxlNfVqIl8
 4XXntT5bFyXfScRiatV1qPZ6i18b7Vp92EVeDid9/NzZfpUMoZqpI3SU2eOYR68mF8m1
 CmiUPtnPluooiq7+20MINf8kCTVlZ3TfWcm3YkatQIsKSyPDiWTA3dGWq/FqUZIbjJV8
 SyKF3USXRmyPkP6F4H1voKy/SXvs++AHoc0Gb2r8v6ZI2HChGp+PcwrAcIgWyXgbXrzk 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gydcujrqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jun 2022 10:18:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF519100039;
 Thu, 30 Jun 2022 10:18:11 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CAE392132C2;
 Thu, 30 Jun 2022 10:18:11 +0200 (CEST)
Received: from localhost (10.75.127.45) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 30 Jun
 2022 10:17:45 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Jun 2022 10:16:32 +0200
Message-ID: <20220630101610.8.Ib45cd17f31c3ffeccd95a162ea3ecf7e5a4392a1@changeid>
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
Subject: [Uboot-stm32] [PATCH 08/10] configs: stm32mp13: activate RTC support
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

Activate the RTC driver in STM32MP13x config.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 configs/stm32mp13_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 3fa1642b2e4..9b0c5a36b04 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -47,6 +47,8 @@ CONFIG_DM_REGULATOR_SCMI=y
 CONFIG_RESET_SCMI=y
 CONFIG_DM_RNG=y
 CONFIG_RNG_OPTEE=y
+CONFIG_DM_RTC=y
+CONFIG_RTC_STM32=y
 CONFIG_SERIAL_RX_BUFFER=y
 CONFIG_SYSRESET_PSCI=y
 CONFIG_TEE=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
