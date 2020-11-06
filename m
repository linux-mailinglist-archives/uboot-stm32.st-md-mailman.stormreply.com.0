Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF6D2A900F
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 08:12:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E152C3FAE2;
	Fri,  6 Nov 2020 07:12:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0463AC3FAD4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 07:12:46 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A67C7wh016643; Fri, 6 Nov 2020 08:12:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=e/BJ+GW1IItyD2xaB3bFF/yot+Mr1Zh1Q969y9LzduY=;
 b=mx3NBqbyrAwrnOAJoHerBcQ2uELHSz9EF2ak1wX1lmE0nydb7u2dsY4ccS1qK+XdUKgm
 KvONkkw32yrvifSNYkJLNFFCIRwJcq4jd9DB9soP0Aoj1I8HJ6sGnNKSZ48RbsX1Oj7j
 AMKB5ASzASYj3ka/vHRCDKt1eh3BczW048t59oVX6MI5nJCPpQb4S5b7bLo7kFFMHSmY
 bVj+E0UKsvoyLP6612X2860yiVabalgF2awDCLLMHjrCMhrCm+t1dhTedhwiElQQAN2I
 HjQ6lZ5hpo/3gtE18L+UiF2M2ASg+ypNkoebpDNdWHVbIbf2RnetjsmMJ9I5/8rhjY7K eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gyw1u61u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 08:12:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B04810003D;
 Fri,  6 Nov 2020 08:12:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 369CD22461E;
 Fri,  6 Nov 2020 08:12:39 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 08:12:15
 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 08:12:00 +0100
Message-ID: <20201106071200.6933-5-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106071200.6933-1-patrice.chotard@st.com>
References: <20201106071200.6933-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_02:2020-11-05,
 2020-11-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v1 4/4] ARM: dts: stm32: Fix typo in
	stm32h7-u-boot.dtsi
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

Fix typo "firsct"

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

---

 arch/arm/dts/stm32h7-u-boot.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/dts/stm32h7-u-boot.dtsi b/arch/arm/dts/stm32h7-u-boot.dtsi
index 7182533cc9..54dd406b6b 100644
--- a/arch/arm/dts/stm32h7-u-boot.dtsi
+++ b/arch/arm/dts/stm32h7-u-boot.dtsi
@@ -39,7 +39,7 @@
 
 			/*
 			 * Memory configuration from sdram datasheet IS42S32800G-6BLI
-			 * firsct bank is bank@0
+			 * first bank is bank@0
 			 * second bank is bank@1
 			 */
 			bank1: bank@1 {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
