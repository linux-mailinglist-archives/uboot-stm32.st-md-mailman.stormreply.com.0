Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C80E324FE6
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Feb 2021 13:37:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9630C57B58;
	Thu, 25 Feb 2021 12:37:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C04E2C57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 12:37:15 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PCbEPE018337; Thu, 25 Feb 2021 13:37:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=m43F2L/xxGnx3N8YTRSefnjM/epM9ybja971Fx+DIIw=;
 b=LhtOB14tjoVhzkaygKi3uY/Pl6qOF5cK86KpGu9aq4QL7Lnv3kBFvqa3TeZBWXSvfazj
 +keR8ju2YDOty5fP6iHVN4IM2N9jCmY3DuW59AKiwgXOijBFOEqIm0or6cchAh0NUuZN
 muXj3Ok49/BDOV28oEhEQrH/54ADAnv5x4+RIKDZ79sWll0d+4fou4Um5f8VVCiy/V9G
 oMl4mlkRxnK/YQibvQbjMIyf+RPCM24KxglOi4/CGJqaty8mTCJnvGNIfKmJnZtuf7cG
 XmzJurDj8tfHCKB8b1R5TuzXoF5U/8dNotyislHUwEdcoFSaSqOGBQL9vnXpPNQ8xl3+ Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66cnqxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 13:37:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 361AB100034;
 Thu, 25 Feb 2021 13:37:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A74222D616;
 Thu, 25 Feb 2021 13:37:08 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Feb 2021 13:37:07
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Feb 2021 13:37:03 +0100
Message-ID: <20210225133652.4.I05f314a38edb990c76933a71b0d050e386c6926e@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210225133652.1.I2edaac51f69d6eb9e62ab7aeb01a3f352a364af5@changeid>
References: <20210225133652.1.I2edaac51f69d6eb9e62ab7aeb01a3f352a364af5@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_07:2021-02-24,
 2021-02-25 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 4/4] stm32mp: stm32prog: replace alias by
	serial device sequence number
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

The command "stm32prog serial <dev>" can directly use the device sequence
number of serial uclass as this sequence number is egual to alias when it
exist; this assumption simplify the code and avoid access to gd->fdt_blob
and the device tree parsing.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 .../cmd_stm32prog/stm32prog_serial.c          | 29 ++++---------------
 arch/arm/mach-stm32mp/cpu.c                   | 11 +++----
 2 files changed, 10 insertions(+), 30 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
index 373ca20886..a51e5e3ec8 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_serial.c
@@ -187,36 +187,19 @@ static int stm32prog_read(struct stm32prog_data *data, u8 phase, u32 offset,
 int stm32prog_serial_init(struct stm32prog_data *data, int link_dev)
 {
 	struct udevice *dev = NULL;
-	int node;
-	char alias[10];
-	const char *path;
 	struct dm_serial_ops *ops;
 	/* no parity, 8 bits, 1 stop */
 	u32 serial_config = SERIAL_DEFAULT_CONFIG;
 
 	down_serial_dev = NULL;
 
-	sprintf(alias, "serial%d", link_dev);
-	path = fdt_get_alias(gd->fdt_blob, alias);
-	if (!path) {
-		log_err("%s alias not found", alias);
-		return -ENODEV;
-	}
-	node = fdt_path_offset(gd->fdt_blob, path);
-	if (!uclass_get_device_by_of_offset(UCLASS_SERIAL, node,
-					    &dev)) {
-		down_serial_dev = dev;
-	} else if (node > 0 &&
-		   !lists_bind_fdt(gd->dm_root, offset_to_ofnode(node),
-				   &dev, false)) {
-		if (!device_probe(dev))
-			down_serial_dev = dev;
-	}
-	if (!down_serial_dev) {
-		log_err("%s = %s device not found", alias, path);
+	if (uclass_get_device_by_seq(UCLASS_SERIAL, link_dev, &dev)) {
+		log_err("serial %d device not found\n", link_dev);
 		return -ENODEV;
 	}
 
+	down_serial_dev = dev;
+
 	/* force silent console on uart only when used */
 	if (gd->cur_serial_dev == down_serial_dev)
 		gd->flags |= GD_FLG_DISABLE_CONSOLE | GD_FLG_SILENT;
@@ -226,11 +209,11 @@ int stm32prog_serial_init(struct stm32prog_data *data, int link_dev)
 	ops = serial_get_ops(down_serial_dev);
 
 	if (!ops) {
-		log_err("%s = %s missing ops", alias, path);
+		log_err("serial %d = %s missing ops\n", link_dev, dev->name);
 		return -ENODEV;
 	}
 	if (!ops->setconfig) {
-		log_err("%s = %s missing setconfig", alias, path);
+		log_err("serial %d = %s missing setconfig\n", link_dev, dev->name);
 		return -ENODEV;
 	}
 
diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 527b6290de..9a76b5633b 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -466,7 +466,6 @@ static void setup_boot_mode(void)
 	unsigned int instance = (boot_mode & TAMP_BOOT_INSTANCE_MASK) - 1;
 	u32 forced_mode = (boot_ctx & TAMP_BOOT_FORCED_MASK);
 	struct udevice *dev;
-	int alias;
 
 	log_debug("%s: boot_ctx=0x%x => boot_mode=%x, instance=%d forced=%x\n",
 		  __func__, boot_ctx, boot_mode, instance, forced_mode);
@@ -474,20 +473,18 @@ static void setup_boot_mode(void)
 	case BOOT_SERIAL_UART:
 		if (instance > ARRAY_SIZE(serial_addr))
 			break;
-		/* serial : search associated alias in devicetree */
+		/* serial : search associated node in devicetree */
 		sprintf(cmd, "serial@%x", serial_addr[instance]);
-		if (uclass_get_device_by_name(UCLASS_SERIAL, cmd, &dev) ||
-		    fdtdec_get_alias_seq(gd->fdt_blob, "serial",
-					 dev_of_offset(dev), &alias)) {
+		if (uclass_get_device_by_name(UCLASS_SERIAL, cmd, &dev)) {
 			/* restore console on error */
 			if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL))
 				gd->flags &= ~(GD_FLG_SILENT |
 					       GD_FLG_DISABLE_CONSOLE);
-			printf("serial%d = %s not found in device tree!\n",
+			printf("uart%d = %s not found in device tree!\n",
 			       instance, cmd);
 			break;
 		}
-		sprintf(cmd, "%d", alias);
+		sprintf(cmd, "%d", dev_seq(dev));
 		env_set("boot_device", "serial");
 		env_set("boot_instance", cmd);
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
