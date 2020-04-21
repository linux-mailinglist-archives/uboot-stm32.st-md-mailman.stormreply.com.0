Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9714C1B290D
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 16:09:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FC5AC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 14:09:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF377C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 14:09:02 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LE35cJ028497; Tue, 21 Apr 2020 16:09:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=/OI/PcXvZPoqy9/nYycE7FQGGSpSTLMkLzadReSXtfU=;
 b=lgtd5k4G7ArOVGl1Jqb1jfHHLDSAph7zEgAbobXTqc84sosJaZCm4o7xKLLIqT/5Qtea
 AvYuCNyoTMO/A60O3C6jY+aDcJUbIO0/ntPum9iqI+Q487c/25b5c+CJjxnsrtYys1JO
 mDiOLM6oLV1HcTc/0yP8oU0fpgj8Yzb/Zh/QUYsKI1jCJIg4OKteg+X7tNJ5PQA9ri0p
 OJ1wHuPEGH7nGqp7hvB3IbT0e/cfmVGjwJSIJfcHOz8kEpCmo8A9ngea68/cJ4KjXn7Q
 CA5ympuzC0aWSwrf6XhnBJmJAAeSI+EsEpP6t8wgKKx8bGX+XV/MN8PBzcKr8SAfFVWp +g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fqaw8hgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Apr 2020 16:09:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E71B100034;
 Tue, 21 Apr 2020 16:08:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 738E72BA140;
 Tue, 21 Apr 2020 16:08:59 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Apr 2020 16:08:59 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 Apr 2020 16:08:39 +0200
Message-ID: <20200421140840.25729-3-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421140840.25729-1-patrice.chotard@st.com>
References: <20200421140840.25729-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_05:2020-04-20,
 2020-04-21 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v1 2/2] cmd: bind: allow to bind driver with
	driver data
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

Initial implementation invokes device_bind_with_driver_data()
with driver_data parameter equal to 0.
For driver with driver data, the bind command can't bind
correctly this driver or even worse causes data abort.

Add find_udevice_id() to parse the driver's of_match list
and return the entry corresponding to the driver compatible string.
This allows to get access to driver_data and to use it as
parameters of device_bind_with_driver_data().

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>

---

 cmd/bind.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/cmd/bind.c b/cmd/bind.c
index 44a5f17f0d..ab1844c855 100644
--- a/cmd/bind.c
+++ b/cmd/bind.c
@@ -118,6 +118,29 @@ static int unbind_child_by_class_index(const char *uclass, int index,
 	return ret;
 }
 
+static const struct udevice_id *find_udevice_id(struct driver *drv,
+						ofnode ofnode)
+{
+	const char *compat_list, *compat;
+	const struct udevice_id *id;
+	int ret, compat_length, i;
+
+	compat_list = ofnode_get_property(ofnode, "compatible", &compat_length);
+	/*
+	 * Walk through the compatible string list and find the corresponding
+	 * udevice_id entry
+	 */
+	for (i = 0; i < compat_length; i += strlen(compat) + 1) {
+		compat = compat_list + i;
+
+		ret = driver_check_compatible(drv->of_match, &id, compat);
+		if (!ret)
+			break;
+	}
+
+	return id;
+}
+
 static int bind_by_node_path(const char *path, const char *drv_name)
 {
 	struct udevice *dev;
@@ -125,6 +148,7 @@ static int bind_by_node_path(const char *path, const char *drv_name)
 	int ret;
 	ofnode ofnode;
 	struct driver *drv;
+	const struct udevice_id *id;
 
 	drv = lists_driver_lookup_name(drv_name);
 	if (!drv) {
@@ -150,8 +174,11 @@ static int bind_by_node_path(const char *path, const char *drv_name)
 	}
 
 	ofnode = ofnode_path(path);
+	id = find_udevice_id(drv, ofnode);
+
 	ret = device_bind_with_driver_data(parent, drv, ofnode_get_name(ofnode),
-					   0, ofnode, &dev);
+					   id->data, ofnode, &dev);
+
 	if (!dev || ret) {
 		printf("Unable to bind. err:%d\n", ret);
 		return ret;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
