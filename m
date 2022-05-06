Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5282B51D130
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 May 2022 08:22:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C1D9C628AA;
	Fri,  6 May 2022 06:22:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75AE8C5E2CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 06:22:40 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24605NIw018215;
 Fri, 6 May 2022 08:22:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=m1N1NBcaSoBmIpx20hlMkoabWJkgBZCsZ5Pj1/sB7CA=;
 b=aYe6gK/rY1YMjFMAa21GfxiWLYpOUawwbAtjqiGmDXaJcaI2S7EYJyq/y2WNOC0ix8Vo
 0ouQgSA0S5R7xKrLr9rIabyJFPEWsub593UraZcjGXlYUVwRWaTau11Q7/pxhBiL0l3W
 DZUTWfpQbPysbyecRdjWZSkeyn9y0Y1IGW1n8q8si9PfYTDW6jQq5gSCWO6WIwVwKxhC
 wmP/MS7pA95vKVs6nYUT/45PRjC0+uqZvipUlfaw5MiEQ99XOsSyBGmj3pGBb9P7SiMv
 HpEyfoHDCkyGzDu1vPj5bK0ZsMdazooNWG5AnP0ZotPmVpXTLiIK8a29zGZa/eRDaimo Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frthk6ayx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 08:22:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B4D4A10002A;
 Fri,  6 May 2022 08:22:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF277210F88;
 Fri,  6 May 2022 08:22:38 +0200 (CEST)
Received: from localhost (10.75.127.47) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 6 May
 2022 08:22:37 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 May 2022 08:22:35 +0200
Message-ID: <20220506082232.v2.2.Ic4641ddc829feecc12b775615bd175f3f35c3ea9@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506082232.v2.1.Ia5711b14a17cf1d042bdab9d3f28437d5c53272c@changeid>
References: <20220506082232.v2.1.Ia5711b14a17cf1d042bdab9d3f28437d5c53272c@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_02,2022-05-05_01,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>
Subject: [Uboot-stm32] [PATCH v2 2/2] usb: host: ehci-generic: Remove
	DM_REGULATOR flag
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

Since commit 16cc5ad0b439 ("power: regulator: add dummy helper")
regulator dummy helper are always available even if DM_REGULATOR
is not set.
DM_REGULATOR flag is no more needed to protect no DM core,
remove it.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

Changes in v2:
  - update commit message

 drivers/usb/host/ehci-generic.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/usb/host/ehci-generic.c b/drivers/usb/host/ehci-generic.c
index 8760169035..4734af0396 100644
--- a/drivers/usb/host/ehci-generic.c
+++ b/drivers/usb/host/ehci-generic.c
@@ -26,12 +26,9 @@ struct generic_ehci {
 	struct clk_bulk clocks;
 	struct reset_ctl_bulk resets;
 	struct phy phy;
-#ifdef CONFIG_DM_REGULATOR
 	struct udevice *vbus_supply;
-#endif
 };
 
-#ifdef CONFIG_DM_REGULATOR
 static int ehci_enable_vbus_supply(struct udevice *dev)
 {
 	struct generic_ehci *priv = dev_get_priv(dev);
@@ -62,17 +59,6 @@ static int ehci_disable_vbus_supply(struct generic_ehci *priv)
 	else
 		return 0;
 }
-#else
-static int ehci_enable_vbus_supply(struct udevice *dev)
-{
-	return 0;
-}
-
-static int ehci_disable_vbus_supply(struct generic_ehci *priv)
-{
-	return 0;
-}
-#endif
 
 static int ehci_usb_probe(struct udevice *dev)
 {
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
