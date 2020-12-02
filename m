Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C3E2CBF51
	for <lists+uboot-stm32@lfdr.de>; Wed,  2 Dec 2020 15:16:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B710C06150;
	Wed,  2 Dec 2020 14:16:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CEB5C424C0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Dec 2020 14:16:24 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B2ED0eV008877; Wed, 2 Dec 2020 15:16:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=9ep6Z0oiGCZNfGLLaJBPiJLBlPRnUjp2//R9f11vRCw=;
 b=IjL3K9HFsGtyUGzKuaUClsrSXFMOKF/HZcYRP7izy31H6yXaxYpKOjFEx5jmNeQMe6+l
 PIDVT6TxYvBBYKTT3eiDdlJ42+rZSr7ib5w/8PlL4aLaqw7IrpBWCFdeGD4QlV9lwfds
 2kzbVx8VpgBYaqZRGK50qlfwXa+hxGWsxuxgd9doZ3txvk2PD7UZq8HQwp6QNUtUkOsq
 xgdGkpfk+U7sRzANv8CHBTyJYBjXEjBQMfeA/gbsvEBW3PC/k0gQrNzmWxmy7I1WjDoX
 mPG8zk6oAWJ38iSzXSx/wrn1Y5ONE472JzGX98bXDVchh26qJAzHWXyoU7WYVEnvrzQH 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 355w3e3ntp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 15:16:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E9DE10002A;
 Wed,  2 Dec 2020 15:16:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F2A7C21CA92;
 Wed,  2 Dec 2020 15:16:15 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Dec 2020 15:16:15
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 2 Dec 2020 15:16:13 +0100
Message-ID: <20201202151553.1.I4114af6c3678fdd5bccc69f141dca0b7f30ccc92@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-02_06:2020-11-30,
 2020-12-02 signatures=0
Cc: Bin Meng <bmeng.cn@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>
Subject: [Uboot-stm32] [PATCH] console: cosmetics: remove #if 0
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

Remove the #if 0 present since the first version of console.c

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 common/console.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/common/console.c b/common/console.c
index 3348436da6..d9dfd61ac3 100644
--- a/common/console.c
+++ b/common/console.c
@@ -929,11 +929,6 @@ done:
 
 	gd->flags |= GD_FLG_DEVINIT;	/* device initialization completed */
 
-#if 0
-	/* If nothing usable installed, use only the initial console */
-	if ((stdio_devices[stdin] == NULL) && (stdio_devices[stdout] == NULL))
-		return 0;
-#endif
 	print_pre_console_buffer(flushpoint);
 	return 0;
 }
@@ -1012,11 +1007,6 @@ int console_init_r(void)
 
 	gd->flags |= GD_FLG_DEVINIT;	/* device initialization completed */
 
-#if 0
-	/* If nothing usable installed, use only the initial console */
-	if ((stdio_devices[stdin] == NULL) && (stdio_devices[stdout] == NULL))
-		return 0;
-#endif
 	print_pre_console_buffer(flushpoint);
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
