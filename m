Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F7C2F1743
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Jan 2021 15:03:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B2C7C56630;
	Mon, 11 Jan 2021 14:03:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26802C424BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jan 2021 14:03:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10BE2XAg014214; Mon, 11 Jan 2021 15:03:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=pH5kswz+7wTS+VeGf/KYC/pic0pGcph1rZO3zKgAWvs=;
 b=1wwAQc/LOAjZmBgEZpKCmelwPj4siXF3zcdtNC1m2IfbV+upX5KJv6Jb70GPeen187+O
 3VZMpX0R99w97hipFeSomKvVSJxPCfMiN9u1l+pzEDbw8HVwYbnJyY+zGnQVnvCPW7vh
 ktrF0BIuSBwXfgppGAn9+1FqaZKOWtOqYePYPgMBiPicjKHVfM+zIIK6kVTOdShmtKOb
 TxxgWck+0tsS40TheWP6r+249jhfWyD5HgXsXZzr3s4RSupCEdeb8iSSYUwtOj8RL+A6
 HGhvF9tUjJF7MK86ah8CDjcKOqADXZlaNLCe83N0fqFG0oVX9Zc1iv7x2T7F72Ol+5Ev HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35yp3xf5j6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 15:03:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D6459100034;
 Mon, 11 Jan 2021 15:03:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBCB12B4D28;
 Mon, 11 Jan 2021 15:03:53 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 Jan 2021 15:03:53
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 11 Jan 2021 15:03:46 +0100
Message-ID: <20210111140347.5754-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210111140347.5754-1-patrice.chotard@foss.st.com>
References: <20210111140347.5754-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-11_26:2021-01-11,
 2021-01-11 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] pinctrl: stmfx: Fix MAX_PIN_NAME_LEN
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

MAX_PIN_NAME_LEN is set to 7 whereas stmfx pin name prefix "stmfx_gpio"
is 10 char long. So "pinmux status" output looks like:

STM32MP> pinmux status -a
--------------------------
stmfx@42:
stmfx_ : input
stmfx_ : input
stmfx_ : input
stmfx_ : input
stmfx_ : input
.....

Set MAX_PIN_NAME_LEN to 13 to get a correct pinmux command output.

Fixes: e27e96aa804e("pinctrl: stmfx: update pin name")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

 drivers/pinctrl/pinctrl-stmfx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index a62be44d2d..d23ad862f2 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -346,7 +346,7 @@ static int stmfx_pinctrl_get_pins_count(struct udevice *dev)
  * STMFX pins[15:0] are called "stmfx_gpio[15:0]"
  * and STMFX pins[23:16] are called "stmfx_agpio[7:0]"
  */
-#define MAX_PIN_NAME_LEN 7
+#define MAX_PIN_NAME_LEN 13
 static char pin_name[MAX_PIN_NAME_LEN];
 static const char *stmfx_pinctrl_get_pin_name(struct udevice *dev,
 					      unsigned int selector)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
