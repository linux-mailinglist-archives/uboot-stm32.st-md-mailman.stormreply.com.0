Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBED63BF724
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Jul 2021 10:54:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 993D3C57B5B;
	Thu,  8 Jul 2021 08:54:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2A88C32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jul 2021 08:54:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1688kxq6001239; Thu, 8 Jul 2021 10:54:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=PRxDMGv0+JhBTScmUNrmyMJeNVzNOQgodeD88hbDWXE=;
 b=67qutjCuWMH4mCzIBdDgZ1x6b0VowwaSl3cK4xNZ164yB8geYsZbStGVMjfAO2IBLAuR
 nNtRPQCC9+ZW3AL5kXCgLheAemuV4RbLM8llgd1ypsq7oYtTcsITa0qSkfmaUTFnUFdG
 ir/4i2Qrm15pS9BPJeAHQ7qe6RCVI5VVGh0dm779R3CvT2KQYieyGC3Ig0ebHWoariX1
 VTmlq0hG8H9c68lsI0dn5D1L4PgXKrO70Zl2dpm3o2T4NY3AnVLaFg3UiKHnWe0xoFRk
 TXS2GPMmMZ628N+U3eeXJLZECIulHHsTsjJhjZrulDA+f+6/gdHrTUPMQ6025fwAAqa3 wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39nwkf0b00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 10:54:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 020C310002A;
 Thu,  8 Jul 2021 10:53:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8498217B74;
 Thu,  8 Jul 2021 10:53:59 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Jul 2021 10:53:59
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Jul 2021 10:53:56 +0200
Message-ID: <20210708105353.1.If5e2c9dc73be2ddb58f1495b4f41186cda743798@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_04:2021-07-06,
 2021-07-08 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH] arm: stm32mp1: force boot_device variable for
	invalid TAMP register value
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

When the TAMP register 20 have an invalid value (0x0 for example after
TAMPER error) the "boot_device" U-Boot env variable have no value and
no error is displayed in U-Boot log.

The STM32MP boot command bootcmd_stm32mp failed with strange trace:
  "Boot over !"

and the next command in bootcmd_stm32mp failed with few indication:
  if test ${boot_device} = serial || test ${boot_device} = usb;
	then stm32prog ${boot_device} ${boot_instance};

As it is difficult to investigate, the current patch avoids this issue:
- change the debug message to error: "unexpected boot mode" is displayed
- display trace "Boot over invalid!" in bootcmd_stm32mp
- execute "run distro_bootcmd" to try all the possible target

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 592bfd413d..5ea1ddc497 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -542,7 +542,9 @@ static void setup_boot_mode(void)
 		env_set("boot_instance", "0");
 		break;
 	default:
-		log_debug("unexpected boot mode = %x\n", boot_mode);
+		env_set("boot_device", "invalid");
+		env_set("boot_instance", "");
+		log_err("unexpected boot mode = %x\n", boot_mode);
 		break;
 	}
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
