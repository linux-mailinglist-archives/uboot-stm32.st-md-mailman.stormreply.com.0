Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4254C2FD045
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Jan 2021 13:43:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCF49C3FAD8;
	Wed, 20 Jan 2021 12:43:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA150C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jan 2021 12:43:53 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10KCadil030791; Wed, 20 Jan 2021 13:43:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=tsTmNhaniC73cHUvrgS/Y0xQh6qutOggGdXmiMmCEN0=;
 b=LXld9rMb6SS5eUaCHLoz4MfnAlNCCH+BglytFtN4irgW323o84U/3Lpx8P35wauwTn9k
 UqWSO+x5pOZm4+eioahOLXifoqrhTBCofAx5fnJPkV85YvKQ19oE8bG0BenyaDZzBJxI
 GS3ZAZEF1YWr2qic9VKClsr+jivRGg8PeuCrpZo39YOCy9MMS/sXU84hPAWhoHY+jMaX
 NbAhYQh5+lrJXav6wlUYVu4BZwFSNUEBaMYHhRvusbu8IzeNCKWzQOKPTeCx5kcp855P
 st7ZgQYgccj9g30s6TuQN1PcGiPCwU3GNCIKsgS29S5tpRpz2iVgSgHkybapMLlZCx3+ 5Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668pyvesc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 13:43:51 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E9FA10002A;
 Wed, 20 Jan 2021 13:43:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E005523E227;
 Wed, 20 Jan 2021 13:43:50 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Jan 2021 13:43:49
 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 20 Jan 2021 13:43:39 +0100
Message-ID: <20210120124340.23612-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_05:2021-01-20,
 2021-01-20 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] pinctrl: stmfx: Fix pin configuration
	issue
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

pin-controller pin's name must be equal to pin's name used in device
tree with "pins" DT property.

Issue detected on stm32mp157c-ev1 board with goodix touchscreen.
In DT, the goodix's pin is declared in DT with the node:

        goodix_pins: goodix {
		pins = "gpio14";
		bias-pull-down;
	};

Whereas in stmfx pin-controller driver, pin's name are equal to
"stmfx_gpioxx" where xx is the pin number.
This lead to not configure stmfx's pins at probe because pins is
identified by its name (see pinctrl_pin_name_to_selector() in
pinctrl-generic.c) and stmfx pin "gpio14" can't be found.

To fix this issue, come back to the original stmfx pin's name.

Revert "pinctrl: stmfx: update pin name"

This reverts commit 38d30cdcd65c73eeefac5efa328ad444a53b77dd.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Tested-by: Patrick DELAUNAY <patrick.delaunay@st.com>
---

 drivers/pinctrl/pinctrl-stmfx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index a62be44d2d..b789f3686c 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -343,8 +343,8 @@ static int stmfx_pinctrl_get_pins_count(struct udevice *dev)
 }
 
 /*
- * STMFX pins[15:0] are called "stmfx_gpio[15:0]"
- * and STMFX pins[23:16] are called "stmfx_agpio[7:0]"
+ * STMFX pins[15:0] are called "gpio[15:0]"
+ * and STMFX pins[23:16] are called "agpio[7:0]"
  */
 #define MAX_PIN_NAME_LEN 7
 static char pin_name[MAX_PIN_NAME_LEN];
@@ -352,9 +352,9 @@ static const char *stmfx_pinctrl_get_pin_name(struct udevice *dev,
 					      unsigned int selector)
 {
 	if (selector < STMFX_MAX_GPIO)
-		snprintf(pin_name, MAX_PIN_NAME_LEN, "stmfx_gpio%u", selector);
+		snprintf(pin_name, MAX_PIN_NAME_LEN, "gpio%u", selector);
 	else
-		snprintf(pin_name, MAX_PIN_NAME_LEN, "stmfx_agpio%u", selector - 16);
+		snprintf(pin_name, MAX_PIN_NAME_LEN, "agpio%u", selector - 16);
 	return pin_name;
 }
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
