Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9C252610
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 10:07:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3693FC5F1F2
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Jun 2019 08:07:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F62FC5F1F1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jun 2019 08:07:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P81YSi012886; Tue, 25 Jun 2019 10:07:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=cqbF+co6UwPV0IiWKsLJ6/4FNC95ccM6BmyU7oKnnaM=;
 b=scj90NuSn9z4EK9KK4Hid0awrl9reMb0GMvks38ye0++gkXGrcOD07j5kmwfuN3IBFws
 Df47nEKWK6CZmN57E1s8uJAi2bj3rFK2IO//9ihVNRWk0o69PwyGlE1y14uQeBxQcfJK
 0QCxspdD0/oKLoccoqv8t7B+Q4z/Vw3/Rge7rg7D3/NJqOZwW7SbWiEKBrSiQrimvNP4
 NdP7/EIQz/5sfoq/NcjNylhhTK8uYN+i9IbA0Eml5XblPro/SIXSh2VReT2pKC+/4sWj
 5E7xs08rno+WDvBtccXU112gPT5IVcZpABDYLSaUVZpKjYy6C1bScxZI9a3fQYisqA47 Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t9d2wg1yy-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 25 Jun 2019 10:07:52 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 66F903A;
 Tue, 25 Jun 2019 08:07:49 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4D95C1C0E;
 Tue, 25 Jun 2019 08:07:49 +0000 (GMT)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 25 Jun 2019 10:07:48 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 25 Jun 2019 10:07:45 +0200
Message-ID: <20190625080745.21813-1-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH] mach-stm32: Fix MPU region size dedicated to
	SDRAM for STM32F4
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

The MPU region dedicated for SDRAM for STM32F4 SoCs family
was set to 16MB, but STM32F429 Evaluation board have 32MB of SDRAM.

When kernel starts, only first 16MB of SDRAM are configured with XN
(eXecute Never) bit disabled, whereas kernel is using 32MB.

It fixes the following user land exception on STM32F429 Evaluation
board :

[    1.713002] VFS: Mounted root (ext4 filesystem) readonly on device 179:2.
[    1.722605] devtmpfs: mounted
[    1.733057] Freeing unused kernel memory: 72K
[    1.737622] This architecture does not have kernel memory protection.
[    1.744070] Run /sbin/init as init process
[    1.906850]
[    1.906850] Unhandled exception: IPSR = 00000004 LR = fffffffd
[    1.914282] CPU: 0 PID: 1 Comm: init Not tainted 5.1.0-00002-gcf9ca5719954 #6
[    1.921433] Hardware name: STM32 (Device Tree Support)
[    1.926601] PC is at 0x1a00b64
[    1.929642] LR is at   (null)
[    1.932669] pc : [<01a00b64>]    lr : [<00000000>]    psr: 01000000
[    1.938993] sp : 01a5cfb0  ip : 00000000  fp : 00000000
[    1.944269] r10: 01a43b00  r9 : 00000000  r8 : 00000000
[    1.949564] r7 : 00000000  r6 : 00000000  r5 : 00000000  r4 : 00000000
[    1.956168] r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000000
[    1.962701] xPSR: 01000000
[    1.965506] CPU: 0 PID: 1 Comm: init Not tainted 5.1.0-00002-gcf9ca5719954 #6
[    1.972658] Hardware name: STM32 (Device Tree Support)
[    1.978132] [<0000c009>] (unwind_backtrace) from [<0000b24f>] (show_stack+0xb/0xc)
[    1.986024] [<0000b24f>] (show_stack) from [<0000b947>] (__invalid_entry+0x4b/0x4c)

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 arch/arm/mach-stm32/soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32/soc.c b/arch/arm/mach-stm32/soc.c
index 6ae31d3a1f..77bb18638f 100644
--- a/arch/arm/mach-stm32/soc.c
+++ b/arch/arm/mach-stm32/soc.c
@@ -18,7 +18,7 @@ int arch_cpu_init(void)
 		 */
 #if defined(CONFIG_STM32F4)
 		{ 0x00000000, REGION_0, XN_DIS, PRIV_RW_USR_RW,
-		O_I_WB_RD_WR_ALLOC, REGION_16MB },
+		O_I_WB_RD_WR_ALLOC, REGION_32MB },
 #endif
 
 		{ 0x90000000, REGION_1, XN_DIS, PRIV_RW_USR_RW,
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
