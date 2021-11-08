Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A74CB447CB1
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Nov 2021 10:21:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BE70C5E2CD;
	Mon,  8 Nov 2021 09:21:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5DC5C5718D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Nov 2021 09:21:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A89BHIx000911;
 Mon, 8 Nov 2021 10:21:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=bSouxXYWeYkI0sgD45V3Tcj09L8iAj6sJyXPFWBdP7I=;
 b=CTtTqGbvOYHaQ6MTocOf8WZghLuyozpM9tCrfcS/b78M9h5xYAyX6NMJnQX9eB5nJes7
 z3pnsXgcrIielrPI3L1GZKYr8XcKB7SSp9tqxHXGYdeEBJX/JxKm2JgmHX1DtCwd4TD6
 Ru/LIDEIJZDzIU33svVXEcvvkJ2eYYMoUNozU6ecRKP7ArNAiaZhQANJRbZlVHfYsp7Y
 rc4JbbUII0wCsbIeEFRdHy3cMey1p9RLtgfXZGxsoNA8H31W62O5DosFXvhw3dv5dxHr
 9J/D/KEWHzgk7M5dDVgEuBlrPGE4VYjC/SS+fHyS217rw/K6fnkJsxUqC41t5myjFp6/ Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c6qvp46j8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 10:21:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2248610002A;
 Mon,  8 Nov 2021 10:21:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB5AB216ED3;
 Mon,  8 Nov 2021 10:21:24 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 8 Nov 2021 10:21:24
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 8 Nov 2021 10:21:21 +0100
Message-ID: <20211108102034.1.I5bb33aa84680ff548976f04f18cafca7ebb0ec91@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_03,2021-11-03_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/2] scripts: remove CONFIG_IS_ENABLED and
	CONFIG_VAL in generated u_boot.cfg
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

The two helpers macros CONFIG_IS_ENABLED and CONFIG_VAL are defined in
include/linux/kconfig.h but they are not real configurations; they can
be safely removed in the generated configuration file "u-boot.cfg".

This patch simplifies the comparison of this U-Boot configuration file.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 scripts/Makefile.autoconf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.autoconf b/scripts/Makefile.autoconf
index 0bfc1b2a62..9bf72784c4 100644
--- a/scripts/Makefile.autoconf
+++ b/scripts/Makefile.autoconf
@@ -67,7 +67,8 @@ quiet_cmd_autoconf = GEN     $@
 quiet_cmd_u_boot_cfg = CFG     $@
       cmd_u_boot_cfg = \
 	$(CPP) $(c_flags) $2 -DDO_DEPS_ONLY -dM $(srctree)/include/common.h > $@.tmp && { \
-		grep 'define CONFIG_' $@.tmp > $@;			\
+		grep 'define CONFIG_' $@.tmp | \
+			sed '/define CONFIG_IS_ENABLED(/d;/define CONFIG_VAL(/d;' > $@; \
 		rm $@.tmp;						\
 	} || {								\
 		rm $@.tmp; false;					\
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
