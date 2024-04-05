Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB29389A244
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Apr 2024 18:16:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74726C6DD93;
	Fri,  5 Apr 2024 16:16:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 512ACC6DD6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Apr 2024 16:16:50 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 435EZbx0030619; Fri, 5 Apr 2024 18:16:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=ld332YC
 OaCBFkcO37QfO0KXWTfHnAU9fFlo7oW1yIgA=; b=YULnrLc5P2C2eaCUY8XjSnS
 I6oMHOUrkZPNQ0Qs2eoXRv7Ryo0inmWsAi5paRJIR0UnJOsW6BxcR9sOCLveOUuR
 vVt8h1GHSEpnh1XYeFglVmmQBuU5PvSlFigcctSZ/d+UgeemuwtXvM0by/wURf91
 IMY8Oub7gVg+kzfWZ0mPX+ALAn2Gd13KMdSDnabsTY+dpSbe/GGFm43V5Za3OyKV
 JFn/jtWI8k+OHqbSYHI8sqAMz0XSJgrArVadxYyFV6CaHsE4tnLd3l7sxh/8fWvD
 tBsJoOgMnbHP0Iu44ojG03a7l2EVhkEXokakn9uyUIXCIf9mzuoiRloKVvVv7ug=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x9emv8jty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 18:16:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 164A84002D;
 Fri,  5 Apr 2024 18:16:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C1CE821684D;
 Fri,  5 Apr 2024 18:15:32 +0200 (CEST)
Received: from localhost (10.252.29.225) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Apr
 2024 18:15:32 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Apr 2024 18:15:29 +0200
Message-ID: <20240405161529.1419902-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.29.225]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_17,2024-04-05_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, Yanhong Wang <yanhong.wang@starfivetech.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Joe Hershberger <joe.hershberger@ni.com>,
 Simon Glass <sjg@chromium.org>, Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Elmar Psilog <epsi@gmx.de>, Kever Yang <kever.yang@rock-chips.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Sean Anderson <seanga2@gmail.com>
Subject: [Uboot-stm32] [PATCH] net: dwc_eth_qos: Fix compilation warning in
	eqos_free_pkt()
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

Fix compilation warning:

../arch/arm/include/asm/io.h: In function 'eqos_free_pkt':
../arch/arm/include/asm/io.h:103:32: warning: 'rx_desc' may be used uninitialized [-Wmaybe-uninitialized]
  103 | #define writel(v,c)     ({ u32 __v = v; __iowmb(); __arch_putl(__v,c); __v; })
      |                                ^~~
../drivers/net/dwc_eth_qos.c:1220:27: note: 'rx_desc' was declared here
 1220 |         struct eqos_desc *rx_desc;
      |                           ^~~~~~~

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/net/dwc_eth_qos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index 9b3bce1dc87..9df3dde14f1 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -1217,7 +1217,7 @@ static int eqos_free_pkt(struct udevice *dev, uchar *packet, int length)
 	struct eqos_priv *eqos = dev_get_priv(dev);
 	u32 idx, idx_mask = eqos->desc_per_cacheline - 1;
 	uchar *packet_expected;
-	struct eqos_desc *rx_desc;
+	struct eqos_desc *rx_desc = NULL;
 
 	debug("%s(packet=%p, length=%d)\n", __func__, packet, length);
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
