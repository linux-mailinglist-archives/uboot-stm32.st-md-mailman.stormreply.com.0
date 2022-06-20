Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6BF551601
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 Jun 2022 12:36:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53F8CC0D2BF;
	Mon, 20 Jun 2022 10:36:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2192C03FDF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Jun 2022 10:36:19 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25K8cIiJ006900;
 Mon, 20 Jun 2022 12:36:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=RJPJY0ENm/XtLjWawfEy/MIhUSqObPngbidUe//HLOs=;
 b=IoNwDUK+lWtgjtbe4qdcfdfQpNQPklfkqc0AXITSIl+65Ly5AeU3EyWa8jqej+NFKFV4
 gBSIdz9DC5MXLrys9mGh+LNXzOAclFPuLOUFoVI92UnlAFBkN1y6wsFKWK+VMhIIIcGk
 DF7Hh/xQa6k4fWCnqp/p8ofXKlApTM1rrJkI6EnrIZgoZ5VVPx9SCiQlN9MnwVwxwn+V
 OrzOjwEhZTyS8wjoIsC+EHYg+vSdP3t1rJIlOB4UKgxs62F01ljUteYDTEcLuQPs0PY+
 gZ+zsEofk3TdzJ8wbWWyBi3pK4pQg1v5VwhZ4udMwbF8i1q6CuSyUGWT657Xlu5KZW4v 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gtnj9s65a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jun 2022 12:36:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8491B10002A;
 Mon, 20 Jun 2022 12:36:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7624921BF45;
 Mon, 20 Jun 2022 12:36:17 +0200 (CEST)
Received: from localhost (10.75.127.119) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Jun
 2022 12:36:17 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 Jun 2022 12:36:10 +0200
Message-ID: <20220620123605.1.If8c377a910cabf108ec14bc570c381126e1531e9@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG2NODE5.st.com (10.75.127.69) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-20_05,2022-06-17_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] board: stm32mp1: remove test on
	CONFIG_DM_REGULATOR
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

The tests on CONFIG_DM_REGULATOR, added to avoid compilation issues, can
now be removed, they are no more needed since the commit 16cc5ad0b439
("power: regulator: add dummy helper").

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 board/st/stm32mp1/stm32mp1.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 9496890d164..8c162b42a59 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -494,7 +494,7 @@ static void sysconf_init(void)
 	ret = uclass_get_device_by_driver(UCLASS_PMIC,
 					  DM_DRIVER_GET(stm32mp_pwr_pmic),
 					  &pwr_dev);
-	if (!ret && IS_ENABLED(CONFIG_DM_REGULATOR)) {
+	if (!ret) {
 		ret = uclass_get_device_by_driver(UCLASS_MISC,
 						  DM_DRIVER_GET(stm32mp_bsec),
 						  &dev);
@@ -555,9 +555,6 @@ static int board_stm32mp15x_dk2_init(void)
 	struct gpio_desc hdmi, audio;
 	int ret = 0;
 
-	if (!IS_ENABLED(CONFIG_DM_REGULATOR))
-		return -ENODEV;
-
 	/* Fix to make I2C1 usable on DK2 for touchscreen usage in kernel */
 	node = ofnode_path("/soc/i2c@40012000/hdmi-transmitter@39");
 	if (!ofnode_valid(node)) {
@@ -658,8 +655,7 @@ int board_init(void)
 	if (board_is_stm32mp15x_dk2())
 		board_stm32mp15x_dk2_init();
 
-	if (IS_ENABLED(CONFIG_DM_REGULATOR))
-		regulators_enable_boot_on(_DEBUG);
+	regulators_enable_boot_on(_DEBUG);
 
 	/*
 	 * sysconf initialisation done only when U-Boot is running in secure
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
