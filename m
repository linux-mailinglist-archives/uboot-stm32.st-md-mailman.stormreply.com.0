Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEE31BF388
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 10:52:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8F35C36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 08:52:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41ABAC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 08:52:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03U8qUbi013330; Thu, 30 Apr 2020 10:52:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=5C9Ps8jiYJsVTSp1X4tZo5S7xxGGzOHPO8ec7FtKSFY=;
 b=CHRvXYtNCxkoQuECnS4uhX6XnM/lW6XxUuWNkp9dIOqw1uKk6gdnmC9rDrvgNHuXYZ9D
 zKPIUEdTLa/NFz8wHVoaYFoom6Xiyw/uCENBlMTvBrghEi0y8SXiuT6X6cB0s2OIbrax
 /7W8JFAF9/wGg4ILq2mP9xnV16k9tJRbydrNg5akpTfCzHssYUkRUNdLinUhFeSVnb8R
 KtlFqM9saA7vcxSzQb/5iM3xuJxSjmd0+uMLDnny+pZsBO1Rh4Kszfnn4B8W7Xpnz6EV
 abxmY/nlvWboI8xncEh+pPB/mwyrCyFnNRWVL36fFgYBdKvWZoN26hxF9ut0BbiiTv5f jA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhq6b409-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 10:52:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0944D100034;
 Thu, 30 Apr 2020 10:52:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F27622AE6C4;
 Thu, 30 Apr 2020 10:52:30 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 30 Apr 2020 10:52:30 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 30 Apr 2020 10:52:22 +0200
Message-ID: <20200430085226.19349-2-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430085226.19349-1-patrice.chotard@st.com>
References: <20200430085226.19349-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_03:2020-04-30,
 2020-04-30 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 1/5] cmd: bind: allow to bind driver with
	driver data
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

Initial implementation invokes device_bind_with_driver_data()
with driver_data parameter equal to 0.
For driver with driver data, the bind command can't bind
correctly this driver or even worse causes data abort as shown below:

As example, for debug purpose on STM32MP1 platform, ethernet (dwc_eth_qos.c)
driver needed to be unbinded/binded. This driver is using driver data:

static const struct udevice_id eqos_ids[] = {
    {
        .compatible = "nvidia,tegra186-eqos",
        .data = (ulong)&eqos_tegra186_config
    },
    {
        .compatible = "snps,dwmac-4.20a",
        .data = (ulong)&eqos_stm32_config
    },

    { }
};

After unbinding/binding this driver and probing it (with the dhcp command),
we got a prefetch abort as below:

STM32MP> unbind eth ethernet@5800a000
STM32MP> bind /soc/ethernet@5800a000 eth_eqos
STM32MP> dhcp
prefetch abort
pc : [<4310801c>]          lr : [<ffc8f4ad>]
reloc pc : [<035ba01c>]    lr : [<c01414ad>]
sp : fdaf19b0  ip : ffcea83c     fp : 00000001
r10: ffcfd4a0  r9 : fdaffed0     r8 : 00000000
r7 : ffcff304  r6 : fdc63220     r5 : 00000000  r4 : fdc5b108
r3 : 43108020  r2 : 00003d39     r1 : ffcea544  r0 : fdc63220
Flags: nZCv  IRQs off  FIQs off  Mode SVC_32
Code: data abort
pc : [<ffc4f9c0>]          lr : [<ffc4f9ad>]
reloc pc : [<c01019c0>]    lr : [<c01019ad>]
sp : fdaf18b8  ip : 00000000     fp : 00000001
r10: ffcd69b2  r9 : fdaffed0     r8 : ffcd69aa
r7 : 00000000  r6 : 00000008     r5 : 4310801c  r4 : fffffffc
r3 : 00000001  r2 : 00000028     r1 : 00000000  r0 : 00000006
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32 (T)
Code: 2f00 d1e9 2c00 dce9 (f855) 2024
Resetting CPU ...

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
Reviewed-by: Simon Glass <sjg@chromium.org>

---

Changes in v3: None
Changes in v2:
   - add a bind command test
   - add bind command documentation in doc/driver/model/bind.rst
   - simplify patch 1 by using lists_bind_fdt()

 cmd/bind.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/cmd/bind.c b/cmd/bind.c
index 44a5f17f0d..0aefc531d8 100644
--- a/cmd/bind.c
+++ b/cmd/bind.c
@@ -7,6 +7,7 @@
 #include <dm.h>
 #include <dm/device-internal.h>
 #include <dm/lists.h>
+#include <dm/root.h>
 #include <dm/uclass-internal.h>
 
 static int bind_by_class_index(const char *uclass, int index,
@@ -150,8 +151,8 @@ static int bind_by_node_path(const char *path, const char *drv_name)
 	}
 
 	ofnode = ofnode_path(path);
-	ret = device_bind_with_driver_data(parent, drv, ofnode_get_name(ofnode),
-					   0, ofnode, &dev);
+	ret = lists_bind_fdt(parent, ofnode, &dev, false);
+
 	if (!dev || ret) {
 		printf("Unable to bind. err:%d\n", ret);
 		return ret;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
