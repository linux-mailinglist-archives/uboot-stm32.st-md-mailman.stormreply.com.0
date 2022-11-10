Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AD4624052
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Nov 2022 11:50:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE4EEC65056;
	Thu, 10 Nov 2022 10:50:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D491C65053
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Nov 2022 10:50:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AA9DkRi006401; Thu, 10 Nov 2022 11:50:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=JBp4X4cmku+q1nKc53+tkYMPLMvuR8JgBmmBajWcHwE=;
 b=luzDnqriQSH++UqUXQvwXXtytDguAP3sX9+eKNYjhN6MbVBNt8f+DdbQeKtQRxA+YJUG
 GHDbJ+/yGWnICLO5HBF+c298BzNKTLpUr24ITGGvXEfd1fFZJbCeKxhDBgoMP8ZxlIf5
 bOnBF1fVFdVT28+/E8225CBn/SOP2RWe6vceV3ESptRcD/Zp3dibosknK1D+qPZuT8/A
 RaITNAVtpps65hkRRY6PQ2fpKlj9XnWvcyNbIZE+juUYcroWwLi/B5e3R/L+zN8uZv4U
 Lj+DCWbHs8ZR6gh+sJRyfCQ1/QKu0LerZx44HnsKqvM4haSrQ3CladvPWH+sLkM4mRp3 oA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3krxfu8xqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 11:50:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A6963100038;
 Thu, 10 Nov 2022 11:50:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A0FDD218625;
 Thu, 10 Nov 2022 11:50:19 +0100 (CET)
Received: from localhost (10.252.15.206) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Thu, 10 Nov
 2022 11:50:18 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 10 Nov 2022 11:49:03 +0100
Message-ID: <20221110114828.6.I6580e1953c9b27a410bc6e6223aa71b118b11672@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
References: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.15.206]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_08,2022-11-09_01,2022-06-22_01
Cc: Peng Fan <peng.fan@nxp.com>, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 6/8] env: mmc: select GPT env partition by
	type guid
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

Since commit c0364ce1c695 ("doc/README.gpt: define partition type GUID for
U-Boot environment"), a specific type GUID can be used to indicate
the U-Boot environment partition on the device with GPT partition table.

This patch uses this type GUID to found the env partition as fallback
when the partition name property "u-boot,mmc-env-partition" is not present
in config node or if the indicated partition name is not found.

The mmc_offset_try_partition() function is reused, it selects the first
partition with the correct type GUID when the parameter 'str' is NULL.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 env/mmc.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/env/mmc.c b/env/mmc.c
index 1894b6483220..bd7d51e6b633 100644
--- a/env/mmc.c
+++ b/env/mmc.c
@@ -74,8 +74,18 @@ static inline int mmc_offset_try_partition(const char *str, int copy, s64 *val)
 		if (ret < 0)
 			return ret;
 
-		if (!strncmp((const char *)info.name, str, sizeof(info.name)))
+		if (str && !strncmp((const char *)info.name, str, sizeof(info.name)))
 			break;
+#ifdef CONFIG_PARTITION_TYPE_GUID
+		if (!str) {
+			const efi_guid_t env_guid = PARTITION_U_BOOT_ENVIRONMENT;
+			efi_guid_t type_guid;
+
+			uuid_str_to_bin(info.type_guid, type_guid.b, UUID_STR_FORMAT_GUID);
+			if (!memcmp(&env_guid, &type_guid, sizeof(efi_guid_t)))
+				break;
+		}
+#endif
 	}
 
 	/* round up to info.blksz */
@@ -112,6 +122,13 @@ static inline s64 mmc_offset(int copy)
 			return val;
 	}
 
+	/* try the GPT partition with "U-Boot ENV" TYPE GUID */
+	if (IS_ENABLED(CONFIG_PARTITION_TYPE_GUID)) {
+		err = mmc_offset_try_partition(NULL, copy, &val);
+		if (!err)
+			return val;
+	}
+
 	defvalue = ENV_MMC_OFFSET;
 	propname = dt_prop.offset;
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
