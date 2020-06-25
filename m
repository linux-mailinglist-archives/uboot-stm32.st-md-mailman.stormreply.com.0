Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D5F209AE3
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 10:00:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B10EAC36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 08:00:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5FFAC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2020 08:00:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05P7rC5Y012397; Thu, 25 Jun 2020 10:00:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=/7bsn99QLszwEGkX3ct80hIYIbC6oqFNgz2Oy9XM2MU=;
 b=Wk/bBdPXOu200kWRBa0wanguWowFt4xtGZqUu4TCKDAs6WRDpZwn+Tvswsl9oe9vcYYa
 07XBhWVLFWbr3K+HrimEzca09WQgMxSdzI8BJL18l9t55zPw5DknLyBWF+d0Itash/Ib
 ClrfXkE4yB849v7dtWzfg+5s22NjNdeJyH5rev9UZf9JmQhm8Ttw2nKa+5vEag2aIzQa
 jYbF2sGI2myxbD1Vdysma3DSzojDTFw8KiZs9jhK+iw/ygXC+GXRPtRs1oX8ziN77fLH
 v+gTO93+WBE6/8EgntabFyNwRYIjqiXb9NHgcontyNARAfG3PZg7UnR7bMYlkNUi0/wb HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuucgpxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 10:00:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EC1A1100038;
 Thu, 25 Jun 2020 10:00:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB28C2A991C;
 Thu, 25 Jun 2020 10:00:22 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 25 Jun 2020 10:00:22 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Jun 2020 09:59:45 +0200
Message-ID: <20200625075958.9868-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625075958.9868-1-patrick.delaunay@st.com>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_03:2020-06-25,
 2020-06-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 01/14] env: add absolute path at
	CONFIG_ENV_EXT4_FILE
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

Add the absolute path to the default value of
CONFIG_ENV_EXT4_FILE = "/uboot.env".

This patch avoid the error :
  Saving Environment to EXT4... File System is consistent
  Please supply Absolute path

Reviewed-by: Tom Rini <trini@konsulko.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

For information, it is the value used today by all the boards:

dragonboard820c_defconfig:29:CONFIG_ENV_EXT4_FILE="/uboot.env"
hikey960_defconfig:25:CONFIG_ENV_EXT4_FILE="/uboot.env"
stm32mp15_basic_defconfig:64:CONFIG_ENV_EXT4_FILE="/uboot.env"
stm32mp15_trusted_defconfig:50:CONFIG_ENV_EXT4_FILE="/uboot.env"


(no changes since v1)

 env/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/env/Kconfig b/env/Kconfig
index ca7fef682b..9dad1cf8c1 100644
--- a/env/Kconfig
+++ b/env/Kconfig
@@ -469,7 +469,7 @@ config ENV_EXT4_DEVICE_AND_PART
 config ENV_EXT4_FILE
 	string "Name of the EXT4 file to use for the environment"
 	depends on ENV_IS_IN_EXT4
-	default "uboot.env"
+	default "/uboot.env"
 	help
 	  It's a string of the EXT4 file name. This file use to store the
 	  environment (explicit path to the file)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
