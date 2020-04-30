Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A8F1BF4E0
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 12:06:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDDFEC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 10:06:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 381FFC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 10:06:32 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03UA4ZgH006367; Thu, 30 Apr 2020 12:06:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=NrxMvoqU2SVUYFxDsjjzgQvd1eAVQoxgIRCh8kV5zWc=;
 b=otNf4nmFEn5ZtPPwvlOGA+wunznY8cXR1AaOyI80xwh0cVH2MI+1PoT2N+8PIfmzbSE0
 omZBgcu1cD4eHwNKvP/fqgs2YDN7Ze+y6yeGfKXtIwe6X5GSyNzkU+SiLwyPpNqLa+NP
 76zbvgJCEJqYVXk4hIc2/QAd5kcujpFWlZU7Vml0m9Vo+YjcmuCvFhHDr7zNu72P9SGw
 LWvnBnGLXclVY8T08rR/GaBXB87vXr5QJbtzCFGTUyGUcrhUtUfpH1TVjIwE5RxQhMna
 1bRKbZI6FJL47AlaAaLv1Tw3wEzr1FomP6VK5ZqcN7wc6MdK43Oy3OsMkPkILVq7OGQy fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30qst09412-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 12:06:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D4468100039;
 Thu, 30 Apr 2020 12:06:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB8C22B3BD4;
 Thu, 30 Apr 2020 12:06:23 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 30 Apr 2020 12:06:23 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Apr 2020 12:06:16 +0200
Message-ID: <20200430100619.28557-3-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430100619.28557-1-patrice.chotard@st.com>
References: <20200430100619.28557-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_06:2020-04-30,
 2020-04-30 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v4 2/5] sandbox: phy: add driver_data for bind
	test cmd
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

Add driver data to existing compatible string "sandbox,phy".
Add an additional compatible string without driver_data

This will verify that bind command parses, finds and passes the
correct driver data to device_bind_with_driver_data() by using
driver_data in the second sandbox_phy_ids table entry.
In sandbox_phy_bind() a check is added to validate driver_data
content.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/phy/sandbox-phy.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/sandbox-phy.c b/drivers/phy/sandbox-phy.c
index 84ff5c6275..5f36da7692 100644
--- a/drivers/phy/sandbox-phy.c
+++ b/drivers/phy/sandbox-phy.c
@@ -8,6 +8,8 @@
 #include <dm.h>
 #include <generic-phy.h>
 
+#define DRIVER_DATA 0x12345678
+
 struct sandbox_phy_priv {
 	bool initialized;
 	bool on;
@@ -71,6 +73,14 @@ static int sandbox_phy_exit(struct phy *phy)
 	return 0;
 }
 
+static int sandbox_phy_bind(struct udevice *dev)
+{
+	if (dev_get_driver_data(dev) != DRIVER_DATA)
+		return -ENODATA;
+
+	return 0;
+}
+
 static int sandbox_phy_probe(struct udevice *dev)
 {
 	struct sandbox_phy_priv *priv = dev_get_priv(dev);
@@ -90,13 +100,19 @@ static struct phy_ops sandbox_phy_ops = {
 };
 
 static const struct udevice_id sandbox_phy_ids[] = {
-	{ .compatible = "sandbox,phy" },
+	{ .compatible = "sandbox,phy_no_driver_data",
+	},
+
+	{ .compatible = "sandbox,phy",
+	  .data = DRIVER_DATA
+	},
 	{ }
 };
 
 U_BOOT_DRIVER(phy_sandbox) = {
 	.name		= "phy_sandbox",
 	.id		= UCLASS_PHY,
+	.bind		= sandbox_phy_bind,
 	.of_match	= sandbox_phy_ids,
 	.ops		= &sandbox_phy_ops,
 	.probe		= sandbox_phy_probe,
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
