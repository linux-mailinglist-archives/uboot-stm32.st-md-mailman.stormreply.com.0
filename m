Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E27C314D74
	for <lists+uboot-stm32@lfdr.de>; Tue,  9 Feb 2021 11:49:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D68EAC57B54;
	Tue,  9 Feb 2021 10:49:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4650BC57B53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 10:49:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 119AgY1d023243; Tue, 9 Feb 2021 11:48:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=kytvhHJywrKId5CwbCNRI4KX3TTb/rqRWTTrXaXpa7Q=;
 b=SzQpP0TAK7vf1qAcde3FNldAey04UToUqv2tMGL+dLfLxqkd2Cg7U5uti+ovUbGQDvaI
 t/x9sQwms3Qo88D+CjLOVteJo8kkIELTCXCqlfdbPCOw3H7LJmY4PXuK1/Jcyk3I3mQF
 1bYeUiUKzOqOjk+DHxSpsZhfNV9nvAPv1geNrGnXnXnrEgxh4EVELEflzGMepqMSBDhm
 XDjHx5ukgaw52i2nd/zS9/Zt358Cti9HgC/kGyyDNZgSqFkkC7QNVDMSer8eBekcMNKf
 Jn6iKbIR/U8QVvFLdQOvyA4/tl/6xFhVbHASUma+xBY4RNwuzlajqDk2O2T4gqN9fXUH HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36hraur3cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 11:48:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B21A10002A;
 Tue,  9 Feb 2021 11:48:58 +0100 (CET)
Received: from Webmail-eu.st.com (gpxdag2node6.st.com [10.75.127.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2108C226F68;
 Tue,  9 Feb 2021 11:48:58 +0100 (CET)
Received: from localhost (10.75.127.120) by GPXDAG2NODE6.st.com (10.75.127.70)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 9 Feb 2021 11:48:57 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 9 Feb 2021 11:48:52 +0100
Message-ID: <20210209114849.3.I10fb7cded95e008428ff08f4f1e6f785cefc4d0f@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210209104852.1293-1-patrick.delaunay@foss.st.com>
References: <20210209104852.1293-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.120]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To GPXDAG2NODE6.st.com
 (10.75.127.70)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_03:2021-02-09,
 2021-02-09 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [PATCH 3/3] env: sf: add support of command env erase
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

Add support of opts erase for env in SPI flash;
this opts is used by command 'env erase'.

This command only fills the env offset by 0x0 (bit flip to 0) and
the saved environment becomes invalid (with bad CRC).

It doesn't erase the sector here to avoid issue when the sector
is larger than the env (i.e. embedded when
CONFIG_ENV_SECT_SIZE > CONFIG_ENV_SIZE).

The needed sector erase will be managed in the next "env save" command,
using the opt ".save", before to update the environment in SPI flash.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 env/sf.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/env/sf.c b/env/sf.c
index 3f2fbbec12..6b61a4b8de 100644
--- a/env/sf.c
+++ b/env/sf.c
@@ -27,9 +27,18 @@
 #define INITENV
 #endif
 
+#define	OFFSET_INVALID		(~(u32)0)
+
 #ifdef CONFIG_ENV_OFFSET_REDUND
+#define ENV_OFFSET_REDUND	CONFIG_ENV_OFFSET_REDUND
+
 static ulong env_offset		= CONFIG_ENV_OFFSET;
 static ulong env_new_offset	= CONFIG_ENV_OFFSET_REDUND;
+
+#else
+
+#define ENV_OFFSET_REDUND	OFFSET_INVALID
+
 #endif /* CONFIG_ENV_OFFSET_REDUND */
 
 DECLARE_GLOBAL_DATA_PTR;
@@ -279,6 +288,30 @@ out:
 }
 #endif
 
+static int env_sf_erase(void)
+{
+	int ret;
+	env_t env;
+
+	ret = setup_flash_device();
+	if (ret)
+		return ret;
+
+	memset(&env, 0, sizeof(env_t));
+	ret = spi_flash_write(env_flash, CONFIG_ENV_OFFSET, CONFIG_ENV_SIZE, &env);
+	if (ret)
+		goto done;
+
+	if (ENV_OFFSET_REDUND != OFFSET_INVALID)
+		ret = spi_flash_write(env_flash, ENV_OFFSET_REDUND, CONFIG_ENV_SIZE, &env);
+
+done:
+	spi_flash_free(env_flash);
+	env_flash = NULL;
+
+	return ret;
+}
+
 #if CONFIG_ENV_ADDR != 0x0
 __weak void *env_sf_get_env_addr(void)
 {
@@ -406,5 +439,6 @@ U_BOOT_ENV_LOCATION(sf) = {
 	ENV_NAME("SPIFlash")
 	.load		= env_sf_load,
 	.save		= ENV_SAVE_PTR(env_sf_save),
+	.erase		= ENV_ERASE_PTR(env_sf_erase),
 	.init		= env_sf_init,
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
