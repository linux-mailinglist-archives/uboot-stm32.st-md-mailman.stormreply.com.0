Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 679EE5ADF9B
	for <lists+uboot-stm32@lfdr.de>; Tue,  6 Sep 2022 08:15:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C00CC640FE;
	Tue,  6 Sep 2022 06:15:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2465EC640F2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 06:15:55 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2865pVd1032350;
 Tue, 6 Sep 2022 08:15:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=1drCsChSoKgOeauFUmFg/XEbWoCzh6Gf4DtSVjHIzJE=;
 b=YWW2Q7YJOITJck/+o3QN0kQv7wc7O+rNFAOgBTzm+QY83Ng8kRl+2vCpOCZPCcxnSvFe
 J9ZwPGJN0QQZSw/igjdERmaB+qvi7H6LSG6ubPLWVKab4cIKjvle1RWaWcPo8KVs9bE4
 IyqG5O9/bXEbijSHu6HheysjcECyD9kFQkrHjgTQHYmJv/LDxZ4/We00zKXNUqfn/bHQ
 5kqeqZPaYSSXdPkCG3mP6osDvtNXAQNqKJi7Vv130DUWGAYpZC5Khi8GEqZaurjDpsa7
 bA5Bt76NjXc4BTI12OC/1mC6c8vIxEP0qWIICH9jqAn9znLI1zrO/JUz5AhXKuq5gkZy Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jbvbn6c7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 08:15:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A82EB100034;
 Tue,  6 Sep 2022 08:15:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A235B2132D4;
 Tue,  6 Sep 2022 08:15:40 +0200 (CEST)
Received: from localhost (10.75.127.47) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 6 Sep 2022
 08:15:40 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 6 Sep 2022 08:15:29 +0200
Message-ID: <20220906061529.3788894-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906061529.3788894-1-patrice.chotard@foss.st.com>
References: <20220906061529.3788894-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_03,2022-09-05_03,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v1 4/4] usb: ehci: Remove unused ehci_{setup,
	shutdown}_phy() helpers
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

Remove unused ehci_{setup,shutdown}_phy() helpers now replaced by
generic_{setup,shutdown}_phy().

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Simon Glass <sjg@chromium.org>

---

 drivers/usb/host/ehci-hcd.c | 66 -------------------------------------
 drivers/usb/host/ehci.h     |  4 ---
 2 files changed, 70 deletions(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index f033198a7c..fb970e3148 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -1767,69 +1767,3 @@ struct dm_usb_ops ehci_usb_ops = {
 };
 
 #endif
-
-#ifdef CONFIG_PHY
-int ehci_setup_phy(struct udevice *dev, struct phy *phy, int index)
-{
-	int ret;
-
-	if (!phy)
-		return 0;
-
-	ret = generic_phy_get_by_index(dev, index, phy);
-	if (ret) {
-		if (ret != -ENOENT) {
-			dev_err(dev, "failed to get usb phy\n");
-			return ret;
-		}
-	} else {
-		ret = generic_phy_init(phy);
-		if (ret) {
-			dev_dbg(dev, "failed to init usb phy\n");
-			return ret;
-		}
-
-		ret = generic_phy_power_on(phy);
-		if (ret) {
-			dev_dbg(dev, "failed to power on usb phy\n");
-			return generic_phy_exit(phy);
-		}
-	}
-
-	return 0;
-}
-
-int ehci_shutdown_phy(struct udevice *dev, struct phy *phy)
-{
-	int ret = 0;
-
-	if (!phy)
-		return 0;
-
-	if (generic_phy_valid(phy)) {
-		ret = generic_phy_power_off(phy);
-		if (ret) {
-			dev_dbg(dev, "failed to power off usb phy\n");
-			return ret;
-		}
-
-		ret = generic_phy_exit(phy);
-		if (ret) {
-			dev_dbg(dev, "failed to power off usb phy\n");
-			return ret;
-		}
-	}
-
-	return 0;
-}
-#else
-int ehci_setup_phy(struct udevice *dev, struct phy *phy, int index)
-{
-	return 0;
-}
-
-int ehci_shutdown_phy(struct udevice *dev, struct phy *phy)
-{
-	return 0;
-}
-#endif
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index 5170044a3a..5770d35b46 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -295,9 +295,5 @@ int ehci_register(struct udevice *dev, struct ehci_hccr *hccr,
 int ehci_deregister(struct udevice *dev);
 extern struct dm_usb_ops ehci_usb_ops;
 
-/* EHCI PHY functions */
-int ehci_setup_phy(struct udevice *dev, struct phy *phy, int index);
-int ehci_shutdown_phy(struct udevice *dev, struct phy *phy);
-
 #include <linux/bitops.h>
 #endif /* USB_EHCI_H */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
