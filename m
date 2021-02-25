Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3BC324FE3
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Feb 2021 13:37:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15C26C57B59;
	Thu, 25 Feb 2021 12:37:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF508C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 12:37:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PCNTfv015026; Thu, 25 Feb 2021 13:37:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=bvvhLfxWv7Ms/v+oP2GdaQ5WHYAB9hv/zx7hhxnf8DM=;
 b=j9GqyEruay8rvAYUjCIQl2MY0dwPkBqhJ0EiNLWV3m/r+76fqL+HlxlrCLQfxq1jYTqU
 Al2EeYjZI1XqNINv+v8ezGyCDB006d9TWVRBjVd4EHCUJlPty6/ujEKKtwt3GJUXhmBh
 oK+7wLhqiSBP6/eAM888FxzB1z6vaCQq/+7qtRj9juirT2bTNupp30rR1WfjZvxchLfY
 59ZAgXZLnnkEztcLZwtHvYhcF8HSCQftoMIyUxyU4AAWxyWPa5ovDRWp1JKcBxS5jM9+
 J3GwZTNta5pXclx2uXHMKvMJllirs4tHoqbHvy74aF+lF0iEY1gjuhyBVkGkDaVLsKlT dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66y5n1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 13:37:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6720A10002A;
 Thu, 25 Feb 2021 13:37:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D11822D616;
 Thu, 25 Feb 2021 13:37:07 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Feb 2021 13:37:06
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Feb 2021 13:37:02 +0100
Message-ID: <20210225133652.3.Ief81f05149ac2a0801badd2baadb49387c0e0fcb@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210225133652.1.I2edaac51f69d6eb9e62ab7aeb01a3f352a364af5@changeid>
References: <20210225133652.1.I2edaac51f69d6eb9e62ab7aeb01a3f352a364af5@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_07:2021-02-24,
 2021-02-25 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 3/4] stm32mp: stm32prog: reactivate console
	and display serial error
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

When serial instance is not found in device tree, the console
should be enabled and the error should be indicated.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cpu.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index a453f89d02..527b6290de 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -476,11 +476,17 @@ static void setup_boot_mode(void)
 			break;
 		/* serial : search associated alias in devicetree */
 		sprintf(cmd, "serial@%x", serial_addr[instance]);
-		if (uclass_get_device_by_name(UCLASS_SERIAL, cmd, &dev))
-			break;
-		if (fdtdec_get_alias_seq(gd->fdt_blob, "serial",
-					 dev_of_offset(dev), &alias))
+		if (uclass_get_device_by_name(UCLASS_SERIAL, cmd, &dev) ||
+		    fdtdec_get_alias_seq(gd->fdt_blob, "serial",
+					 dev_of_offset(dev), &alias)) {
+			/* restore console on error */
+			if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL))
+				gd->flags &= ~(GD_FLG_SILENT |
+					       GD_FLG_DISABLE_CONSOLE);
+			printf("serial%d = %s not found in device tree!\n",
+			       instance, cmd);
 			break;
+		}
 		sprintf(cmd, "%d", alias);
 		env_set("boot_device", "serial");
 		env_set("boot_instance", cmd);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
