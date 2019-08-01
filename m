Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3069A7D898
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Aug 2019 11:31:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC88CC35E02
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Aug 2019 09:31:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77587C35E01
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Aug 2019 09:31:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x719UXnF005452; Thu, 1 Aug 2019 11:31:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=emmxedgxecxiFT0pwMd4uR+ySQF1XWD65UkAHB6bpCU=;
 b=MvI0gvPB9IfdJ9LwJJCMauMmHaC2KH4xHyHXR22ftoNXBOzk5xULnhz8em+238t/iz2T
 4Y+SdNsiVyp9OY1OVlthk3H5xkzBKX52i1ek1oXyVvQBxygmrG032wuVKrcQgcSVKJbG
 yArfo9IGCMalx4L0sAkEXkIIPHTcBQybXYoW0svGxnG7XfReXoYCVW+YHgUCg6lmjYo+
 /xTUNdjTupA6YMpVr0KMXUqWY0MV17wbATl31Vy7S79lPb4igPn6Z15uSdaDbvMFBSj9
 M6zROSHJ9eoPf7UVXkpp7Va5A9UTByaKOrtdzbV5zTXiA1CIzB2D9mFdbTT38pVdmok6 Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4mh9p-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 01 Aug 2019 11:31:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 921F8122;
 Thu,  1 Aug 2019 09:29:12 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 86A5FEA4CA;
 Thu,  1 Aug 2019 11:29:12 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 1 Aug 2019
 11:29:12 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 1 Aug 2019 11:29:11
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 1 Aug 2019 11:29:02 +0200
Message-ID: <1564651743-28430-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-01_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] net: dwc_eth_qos: Change eqos_ops
	function to static
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

This patch solves many warnings when compiling with W=1:
warning: no previous prototype for '....' [-Wmissing-prototypes]

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/net/dwc_eth_qos.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dwc_eth_qos.c b/drivers/net/dwc_eth_qos.c
index 07b3667..6df9956 100644
--- a/drivers/net/dwc_eth_qos.c
+++ b/drivers/net/dwc_eth_qos.c
@@ -621,7 +621,7 @@ err:
 	return ret;
 }
 
-void eqos_stop_clks_tegra186(struct udevice *dev)
+static void eqos_stop_clks_tegra186(struct udevice *dev)
 {
 	struct eqos_priv *eqos = dev_get_priv(dev);
 
@@ -636,7 +636,7 @@ void eqos_stop_clks_tegra186(struct udevice *dev)
 	debug("%s: OK\n", __func__);
 }
 
-void eqos_stop_clks_stm32(struct udevice *dev)
+static void eqos_stop_clks_stm32(struct udevice *dev)
 {
 	struct eqos_priv *eqos = dev_get_priv(dev);
 
@@ -1290,7 +1290,7 @@ err:
 	return ret;
 }
 
-void eqos_stop(struct udevice *dev)
+static void eqos_stop(struct udevice *dev)
 {
 	struct eqos_priv *eqos = dev_get_priv(dev);
 	int i;
@@ -1344,7 +1344,7 @@ void eqos_stop(struct udevice *dev)
 	debug("%s: OK\n", __func__);
 }
 
-int eqos_send(struct udevice *dev, void *packet, int length)
+static int eqos_send(struct udevice *dev, void *packet, int length)
 {
 	struct eqos_priv *eqos = dev_get_priv(dev);
 	struct eqos_desc *tx_desc;
@@ -1385,7 +1385,7 @@ int eqos_send(struct udevice *dev, void *packet, int length)
 	return -ETIMEDOUT;
 }
 
-int eqos_recv(struct udevice *dev, int flags, uchar **packetp)
+static int eqos_recv(struct udevice *dev, int flags, uchar **packetp)
 {
 	struct eqos_priv *eqos = dev_get_priv(dev);
 	struct eqos_desc *rx_desc;
@@ -1409,7 +1409,7 @@ int eqos_recv(struct udevice *dev, int flags, uchar **packetp)
 	return length;
 }
 
-int eqos_free_pkt(struct udevice *dev, uchar *packet, int length)
+static int eqos_free_pkt(struct udevice *dev, uchar *packet, int length)
 {
 	struct eqos_priv *eqos = dev_get_priv(dev);
 	uchar *packet_expected;
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
