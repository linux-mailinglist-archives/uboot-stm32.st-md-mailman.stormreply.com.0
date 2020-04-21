Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7921B290E
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 16:09:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66B1DC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 14:09:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C40C5C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 14:09:06 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LE43pa010613; Tue, 21 Apr 2020 16:09:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=aovh9qvZTsRmZFgz2YT4ov8KtsQOFcumen3EsM5CSfE=;
 b=Ogz9vJcDf1wJyq84eOanOk8PXnNH4Lt+59vGApmCliiaOfT6zPZZnetlqlD236txjw8A
 4JnKbsmkE6QZQGXVBzV1YB7E7DMI0XItxGMUH8WZ+CxEagzkh967bGXyQXWV1cVAeUjO
 EWFfaCChlQfqZd5qyHBAE9rIu0tpAZ+Sab+MordBJOO86m5VWX7r/LHgVYYVyflpW+4V
 M7kCtBTzbF1YoKBwBs8xX/PAJ8l+tPMkQOpCHuqQkhvLeVXrEVkqyIPLreSHCFZu6BZy
 EEGsv+Dhh3zeg6DsYs4THI0I2exxppF9gUfzSRqqXt6txLrbD7RJEi+BdSlPoVPcPNDy dQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fq11gkkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 16:09:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D4223100038;
 Tue, 21 Apr 2020 16:08:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C9E002BA141;
 Tue, 21 Apr 2020 16:08:57 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Apr 2020 16:08:57 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 Apr 2020 16:08:38 +0200
Message-ID: <20200421140840.25729-2-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421140840.25729-1-patrice.chotard@st.com>
References: <20200421140840.25729-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_05:2020-04-20,
 2020-04-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v1 1/2] dm: core: give access to
	driver_check_compatible()
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

driver_check_compatible() can be useful in particular case,
give access to this primitive

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
---

 drivers/core/lists.c |  6 +++---
 include/dm/lists.h   | 12 ++++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/core/lists.c b/drivers/core/lists.c
index 68204c303f..c807cf8698 100644
--- a/drivers/core/lists.c
+++ b/drivers/core/lists.c
@@ -106,9 +106,9 @@ int device_bind_driver_to_node(struct udevice *parent, const char *drv_name,
  * @param compat:	The compatible string to search for
  * @return 0 if there is a match, -ENOENT if no match
  */
-static int driver_check_compatible(const struct udevice_id *of_match,
-				   const struct udevice_id **of_idp,
-				   const char *compat)
+int driver_check_compatible(const struct udevice_id *of_match,
+			    const struct udevice_id **of_idp,
+			    const char *compat)
 {
 	if (!of_match)
 		return -ENOENT;
diff --git a/include/dm/lists.h b/include/dm/lists.h
index 810e244d9e..7615f0ab38 100644
--- a/include/dm/lists.h
+++ b/include/dm/lists.h
@@ -44,6 +44,18 @@ struct uclass_driver *lists_uclass_lookup(enum uclass_id id);
  */
 int lists_bind_drivers(struct udevice *parent, bool pre_reloc_only);
 
+/**
+ * driver_check_compatible() - Check if a driver matches a compatible string
+ *
+ * @param of_match:	List of compatible strings to match
+ * @param of_idp:	Returns the match that was found
+ * @param compat:	The compatible string to search for
+ * @return 0 if there is a match, -ENOENT if no match
+ */
+int driver_check_compatible(const struct udevice_id *of_match,
+			    const struct udevice_id **of_idp,
+			    const char *compat);
+
 /**
  * lists_bind_fdt() - bind a device tree node
  *
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
