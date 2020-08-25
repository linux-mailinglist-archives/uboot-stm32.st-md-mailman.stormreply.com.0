Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED112517F8
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Aug 2020 13:42:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBC4CC3087A
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Aug 2020 11:42:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F12ECC32EA6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Aug 2020 11:42:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07PBbPEI000615; Tue, 25 Aug 2020 13:42:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=n6rYSi58yQkihj2uUtiLC/q/Zn3OTpp1uWf3O9jGBdI=;
 b=S5vMm+XpdFosLSsu+rIi0nVaZnWrgI8Rk55PaED3keCkbvv4wZGluIqjMoGUkjAvADcs
 3CCD2kphvRY6VLX3o37/MYOwcaZnkh/pg8V24AzEjfCDYY3cGsGt3c1kaEvODmkR7AT3
 hsQMZhvj7cfkQUjh5jDYIlsnpDMDBkC0lOP1UoslsdJVjJMjPyb0WpBpNO1gy6lH52hT
 i/nJSemWgHnQ7Z9OCKTwF2jjoXdlZyxnaAkQx7PNpTSs0fmA9X7nCRoiH4w4YaD+chFR
 8PNxn/KHSFjmqzeijZwdTs+xIjaOnHT237rjPjJIHr5Bm6lJl2CidITwCkIl2g/9AqAr pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 333b3hasq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Aug 2020 13:42:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 769F310002A;
 Tue, 25 Aug 2020 13:42:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6DA3F21F69E;
 Tue, 25 Aug 2020 13:42:16 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 25 Aug 2020 13:42:16 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 25 Aug 2020 13:42:10 +0200
Message-ID: <20200825134206.v3.3.I1b5c7dcf6c43efa10d18b4bc707055fc15fb36ca@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825134206.v3.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
References: <20200825134206.v3.1.I2dff760694d84d8bb1f8dc4ec03a5572681e4e8d@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-25_02:2020-08-25,
 2020-08-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [Uboot-stm32] [PATCH v3 3/3] optee: add property no-map to secure
	reserved memory
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

From: Etienne Carriere <etienne.carriere@st.com>

OP-TEE reserved memory node must set property "no-map" to prevent
Linux kernel from mapping secure memory unless what non-secure world
speculative accesses of the CPU can violate the memory firmware
configuration.

Fixes: 6ccb05eae01b ("image: fdt: copy possible optee nodes to a loaded devicetree")
Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v3:
   - Fix changelogs

 lib/optee/optee.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/optee/optee.c b/lib/optee/optee.c
index 963c2ff430..9e6606568f 100644
--- a/lib/optee/optee.c
+++ b/lib/optee/optee.c
@@ -192,7 +192,7 @@ int optee_copy_fdt_nodes(const void *old_blob, void *new_blob)
 				ret = fdtdec_add_reserved_memory(new_blob,
 								 nodename,
 								 &carveout,
-								 NULL, false);
+								 NULL, true);
 				free(oldname);
 
 				if (ret < 0)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
