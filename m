Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F37323ACF
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 11:52:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D637CC3FAD6;
	Wed, 24 Feb 2021 10:52:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E0FBC57B58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 10:52:45 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OAp9ZK021689; Wed, 24 Feb 2021 11:52:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=eUcMiLb+PwXZVkuUgwu/4aEG0EqAOMld3g5SPy/lO8o=;
 b=SNOi+KCiyXIsQOb4m423d930s+I7pK9X3MuOmel2D6WHQNwyfsIFz3y5qcoQQX3aYrQR
 54ijiHQF62i4ee4OJZHgbTXPH/kK8Mr5/NiYk61X5Zngxp088ZexaXQduLl626God4Zv
 wDOoKWO6tijMo7SjC8TOn9S4ARlICVgDqSo8fqd7+whybJ0k8BMlbW1sDzVpNugqVHpV
 1vKhGdVZv+XH0phszRBxlgnJbs79ZbLmePm+4Nnvtcm0ZecFvOT1EFsI/C27vkVdWK5v
 +v5LvbFHWiOXbIEk7kOYMw//6aI4m1VhGhWe8WgWCjG+KHSqTNd8I36k8FO4I16tdsZl OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66cdhb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 11:52:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B596F10002A;
 Wed, 24 Feb 2021 11:52:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB96E22767F;
 Wed, 24 Feb 2021 11:52:40 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Feb 2021 11:52:40
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Feb 2021 11:52:36 +0100
Message-ID: <20210224115218.RFC.2.I5c06755fe3aea5afd6b9880630bfc7c8218eaa8b@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224105236.25663-1-patrick.delaunay@foss.st.com>
References: <20210224105236.25663-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_03:2021-02-24,
 2021-02-24 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>
Subject: [Uboot-stm32] [RFC PATCH 2/2] env: sf: remove the static env_flash
	variable
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

As the the SPI flash is probed and is released in each ENV sf function
the env_flash no more need to be static.

This patch move this device handle as local variable of each function and
simplify the associated code (env_flash is never == NULL when
setup_flash_device is called).

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 env/sf.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/env/sf.c b/env/sf.c
index acbd712aef..b7cf9c64d4 100644
--- a/env/sf.c
+++ b/env/sf.c
@@ -43,9 +43,7 @@ static ulong env_new_offset	= CONFIG_ENV_OFFSET_REDUND;
 
 DECLARE_GLOBAL_DATA_PTR;
 
-static struct spi_flash *env_flash;
-
-static int setup_flash_device(void)
+static int setup_flash_device(struct spi_flash **env_flash)
 {
 #if CONFIG_IS_ENABLED(DM_SPI_FLASH)
 	struct udevice *new;
@@ -60,14 +58,11 @@ static int setup_flash_device(void)
 		return ret;
 	}
 
-	env_flash = dev_get_uclass_priv(new);
+	*env_flash = dev_get_uclass_priv(new);
 #else
-	if (env_flash)
-		spi_flash_free(env_flash);
-
-	env_flash = spi_flash_probe(CONFIG_ENV_SPI_BUS, CONFIG_ENV_SPI_CS,
-				    CONFIG_ENV_SPI_MAX_HZ, CONFIG_ENV_SPI_MODE);
-	if (!env_flash) {
+	*env_flash = spi_flash_probe(CONFIG_ENV_SPI_BUS, CONFIG_ENV_SPI_CS,
+				     CONFIG_ENV_SPI_MAX_HZ, CONFIG_ENV_SPI_MODE);
+	if (!*env_flash) {
 		env_set_default("spi_flash_probe() failed", 0);
 		return -EIO;
 	}
@@ -82,8 +77,9 @@ static int env_sf_save(void)
 	char	*saved_buffer = NULL, flag = ENV_REDUND_OBSOLETE;
 	u32	saved_size, saved_offset, sector;
 	int	ret;
+	struct spi_flash *env_flash;
 
-	ret = setup_flash_device();
+	ret = setup_flash_device(&env_flash);
 	if (ret)
 		return ret;
 
@@ -150,7 +146,6 @@ static int env_sf_save(void)
 
 done:
 	spi_flash_free(env_flash);
-	env_flash = NULL;
 
 	if (saved_buffer)
 		free(saved_buffer);
@@ -163,6 +158,7 @@ static int env_sf_load(void)
 	int ret;
 	int read1_fail, read2_fail;
 	env_t *tmp_env1, *tmp_env2;
+	struct spi_flash *env_flash;
 
 	tmp_env1 = (env_t *)memalign(ARCH_DMA_MINALIGN,
 			CONFIG_ENV_SIZE);
@@ -174,7 +170,7 @@ static int env_sf_load(void)
 		goto out;
 	}
 
-	ret = setup_flash_device();
+	ret = setup_flash_device(&env_flash);
 	if (ret)
 		goto out;
 
@@ -187,7 +183,6 @@ static int env_sf_load(void)
 				read2_fail, H_EXTERNAL);
 
 	spi_flash_free(env_flash);
-	env_flash = NULL;
 out:
 	free(tmp_env1);
 	free(tmp_env2);
@@ -201,8 +196,9 @@ static int env_sf_save(void)
 	char	*saved_buffer = NULL;
 	int	ret = 1;
 	env_t	env_new;
+	struct spi_flash *env_flash;
 
-	ret = setup_flash_device();
+	ret = setup_flash_device(&env_flash);
 	if (ret)
 		return ret;
 
@@ -250,7 +246,6 @@ static int env_sf_save(void)
 
 done:
 	spi_flash_free(env_flash);
-	env_flash = NULL;
 
 	if (saved_buffer)
 		free(saved_buffer);
@@ -262,6 +257,7 @@ static int env_sf_load(void)
 {
 	int ret;
 	char *buf = NULL;
+	struct spi_flash *env_flash;
 
 	buf = (char *)memalign(ARCH_DMA_MINALIGN, CONFIG_ENV_SIZE);
 	if (!buf) {
@@ -269,7 +265,7 @@ static int env_sf_load(void)
 		return -EIO;
 	}
 
-	ret = setup_flash_device();
+	ret = setup_flash_device(&env_flash);
 	if (ret)
 		goto out;
 
@@ -286,7 +282,6 @@ static int env_sf_load(void)
 
 err_read:
 	spi_flash_free(env_flash);
-	env_flash = NULL;
 out:
 	free(buf);
 
@@ -298,8 +293,9 @@ static int env_sf_erase(void)
 {
 	int ret;
 	env_t env;
+	struct spi_flash *env_flash;
 
-	ret = setup_flash_device();
+	ret = setup_flash_device(&env_flash);
 	if (ret)
 		return ret;
 
@@ -313,7 +309,6 @@ static int env_sf_erase(void)
 
 done:
 	spi_flash_free(env_flash);
-	env_flash = NULL;
 
 	return ret;
 }
@@ -358,6 +353,7 @@ static int env_sf_init_early(void)
 	int crc1_ok;
 	env_t *tmp_env2 = NULL;
 	env_t *tmp_env1;
+	struct spi_flash *env_flash;
 
 	/*
 	 * if malloc is not ready yet, we cannot use
@@ -375,7 +371,7 @@ static int env_sf_init_early(void)
 	if (!tmp_env1 || !tmp_env2)
 		goto out;
 
-	ret = setup_flash_device();
+	ret = setup_flash_device(&env_flash);
 	if (ret)
 		goto out;
 
@@ -411,12 +407,11 @@ static int env_sf_init_early(void)
 	}
 
 	spi_flash_free(env_flash);
-	env_flash = NULL;
 
 	return 0;
 err_read:
 	spi_flash_free(env_flash);
-	env_flash = NULL;
+
 	free(tmp_env1);
 	if (IS_ENABLED(CONFIG_SYS_REDUNDAND_ENVIRONMENT))
 		free(tmp_env2);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
